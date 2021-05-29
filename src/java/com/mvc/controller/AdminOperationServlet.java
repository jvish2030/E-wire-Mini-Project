/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.java.ConPool.DBUtils;
import com.mvc.beans.CategoryBean;
import com.mvc.beans.ProductBean;
import com.mvc.dao.AdminDao;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        String operation = request.getParameter("operation");
        operation = operation.toLowerCase();
        System.out.println(operation);
        //CALLING CASE VALUE BASED OF OPERATOPN VALUE
        switch (operation) {
            case "deleteproduct":
                deleteproduct(request, response);
                break;
            case "deleteparentcat":
                deleteParentCat(request, response);
                break;
            default:
                error(request, response);
        }
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

        //getting paameter vzllue of operation
        String operation = request.getParameter("operation");
        operation = operation.toLowerCase();
        System.out.println(operation);
        //CALLING CASE VALUE BASED OF OPERATOPN VALUE
        switch (operation) {
            case "addcategory":
                addCategoryOperation(request, response);
                break;
            case "addsubcategory":
                addSubCategoryOperation(request, response);
                break;
            case "addproduct":
                addProduct(request, response);
                break;
            default:
                error(request, response);
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
//        getting product data through Get Request
        String productName = request.getParameter("productName");
        String product_id_Category = request.getParameter("Select_Id_Category");
        System.out.println("--------------------" + product_id_Category);
        String[] id_cat = product_id_Category.split(",");
        int parent_id = Integer.parseInt(id_cat[0]);
        String category = id_cat[1];
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
        String FileName = DBUtils.getMaxProId() + ".jpg";

//          Creating & Storing productBean oject
        ProductBean proObj = new ProductBean();
        proObj.setpName(productName);
        proObj.setpCategory(category);
        proObj.setParent_id(parent_id);
        proObj.setpPrice(productPrice);
        proObj.setpDiscount(productDiscount);
        proObj.setpRemark(productRemark);
        proObj.setpPhoto(FileName);
        proObj.setpDescription(productDescription);

        //Finding the path to store Image
        String path = request.getRealPath("images") + File.separator + "products" + File.separator + FileName;

        //using try with resource to perform auto close operation
        //creating File output stream object to put image to that specified location
        //getiing image binary data and creating Input stream object
        try (FileOutputStream fos = new FileOutputStream(path);
                InputStream is = productPhoto.getInputStream();) {

//            creating byte array to store binary data of input stream
            byte[] data = new byte[is.available()];

//            read data from input stream to byte array
            is.read(data);

            //writing binary data to byte array
            fos.write(data);

        } catch (FileNotFoundException ex) {
            Logger.getLogger(AdminOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AdminOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        //creating DAO object and passing product Object to insert into database
        AdminDao dao = new AdminDao();
        String authorize = dao.saveProduct(proObj);

        // GETTING HTTP SESSION OBJECT TO STRONG SESSION OBJECT
        HttpSession session = request.getSession();

        //if inserted then redirecting to same page else to error page
        if (authorize.equals("PRODUCT ADDDED SUCCESSFULLY!")) //On success, you can display a message to user on Home page
        {
            session.setAttribute("message", authorize);
            try {
                response.sendRedirect("adminPages/forms/form1.jsp");
            } catch (IOException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void addCategoryOperation(HttpServletRequest request, HttpServletResponse response) {
        // INSERTING CATEGORY NAME IN CATEGORYBEANOBJECT

        String name = request.getParameter("CategoryName");
        Part categoryPhoto = null;
        try {
            categoryPhoto = request.getPart("categoryPhoto");
        } catch (IOException | ServletException ex) {
            Logger.getLogger(AdminOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String FileName = DBUtils.getMaxCatId() + ".jpg";
        CategoryBean cat = new CategoryBean(name, FileName);

        //Finding the path to store Image
        String path = request.getRealPath("images") + File.separator + "category" + File.separator + FileName;

        //using try with resource to perform auto close operation
        //creating File output stream object to put image to that specified location
        //getiing image binary data and creating Input stream object
        try (FileOutputStream fos = new FileOutputStream(path);
                InputStream is = categoryPhoto.getInputStream();) {

//            creating byte array to store binary data of input stream
            byte[] data = new byte[is.available()];

//            read data from input stream to byte array
            is.read(data);

            //writing binary data to byte array
            fos.write(data);

        } catch (FileNotFoundException ex) {
            Logger.getLogger(AdminOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AdminOperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        //PASSING & INSERTING CATEGORYBEANOBJECT TO DATABASE THROUGN DAO 
        String authorize = AdminDao.createNewCategory(cat);
        //if inserted then redirecting to same page else to error page

        // GETTING HTTP SESSION OBJECT TO STRONG SESSION OBJECT
        HttpSession session = request.getSession();

        if (authorize.equals("CATEGORY INSERTED SUCCESSFULLY!")) //On success, you can display a message to user on Home page
        {
            session.setAttribute("message", authorize);
            try {
                response.sendRedirect("adminPages/forms/form1.jsp");
            } catch (IOException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void addSubCategoryOperation(HttpServletRequest request, HttpServletResponse response) {
        //GETTING CATEGORY ID AND STORING INTO LOCAL VARIABLE ID
        int id = Integer.parseInt(request.getParameter("SelectCategory"));
        //GETTING SUBCATEGORY NAME AND STORING INTO LOCAL VARIABLE SUBCATEGORY
        String subCategory = request.getParameter("subCategory");
        //CREATING CATEGORYBEAN OBJECT BY PASING ID AND SUBCATEGORY NAME
        CategoryBean subCatObj = new CategoryBean(id, subCategory);
        //PASSING &  CATEGORYBEAN OBJECT TO DATABASE THROUGN DAO 
        String authorize = AdminDao.createNewSubCategory(subCatObj);
        //if inserted then redirecting to same page else to error page

        // GETTING HTTP SESSION OBJECT TO STRONG SESSION OBJECT
        HttpSession session = request.getSession();

        if (authorize.equals("SUBCATEGORY INSERTED SUCCESSFULLY!")) //On success, you can display a message to user on Home page
        {
            session.setAttribute("message", authorize);
            try {
                response.sendRedirect("adminPages/forms/form1.jsp");
            } catch (IOException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void error(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("error.jsp");
        } catch (IOException ex) {
            Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void deleteproduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String authorize = new AdminDao().deleteProduct(id);
        // GETTING HTTP SESSION OBJECT TO STRONG SESSION OBJECT
        HttpSession session = request.getSession();
        if (authorize.equals("Item Deleted!")) //On success, you can display a message to user on Home page
        {
            session.setAttribute("message", authorize);
            try {
                response.sendRedirect("adminPages/tables/table1.jsp");
            } catch (IOException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void deleteParentCat(HttpServletRequest request, HttpServletResponse response) {
        //getting parameer id from get request
        int id = Integer.parseInt(request.getParameter("id"));
        String authorize = new AdminDao().deleteParentCat(id);
        // GETTING HTTP SESSION OBJECT TO STRONG SESSION OBJECT
        HttpSession session = request.getSession();
        if (authorize.equals("Category Deleted!")) //On success, you can display a message to user on Home page
        {
            session.setAttribute("message", authorize);
            try {
                response.sendRedirect("adminPages/forms/form1.jsp");
            } catch (IOException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
