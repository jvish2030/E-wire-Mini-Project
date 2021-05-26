/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.ProductBean;
import com.mvc.dao.AdminDao;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jatin
 */
@WebServlet(name = "AdminOperationServlet", urlPatterns = {"/AdminOperation"})
@MultipartConfig
public class AdminOperationServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method. //
     * <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");
        operation = operation.toLowerCase();

        switch (operation) {
            case "addproduct":
                addProduct(request, response);
                break;
            default:

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("productName");
        String productCategory = request.getParameter("SelectCategory");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
        Part productPhoto = null;
        try {
            productPhoto = request.getPart("productPhoto");
        } catch (IOException | ServletException ex) {
            Logger.getLogger(AdminOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String productRemark = request.getParameter("productRemark");
        String productDescription = request.getParameter("productDescription");

        ProductBean proObj = new ProductBean();
        proObj.setpName(productName);
        proObj.setpCategory(productCategory);
        proObj.setpPrice(productPrice);
        proObj.setpDiscount(productDiscount);
        proObj.setpRemark(productRemark);
        proObj.setpPhoto(productPhoto.getSubmittedFileName());
        proObj.setpDescription(productDescription);

        AdminDao dao = new AdminDao();
        String authorize = dao.saveProduct(proObj);
        System.out.println(authorize);
        if (authorize.equals("PRODUCT ADDDED SUCCESSFULLY!")) //On success, you can display a message to user on Home page
        {
            try {
                response.sendRedirect("adminPages/forms/form1.jsp");
            } catch (IOException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            try {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
