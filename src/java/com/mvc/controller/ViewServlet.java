/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.ProductBean;
import com.mvc.dao.ProductsDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jatin
 */
@WebServlet(name = "ViewServlet", urlPatterns = {"/view"})
public class ViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        page = page.toLowerCase();
        switch (page) {
            case "about":
                about(request, response);
                break;
            case "contact":
                contact(request, response);
                break;
            case "faq":
                faqs(request, response);
                break;
            case "single":
                single(request, response);
                break;
            case "cart":
                cart(request, response);
                break;
            default:
                errorPage(request, response);
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

    private void about(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("about.jsp");
            request.setAttribute("title", "About");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void contact(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("contact.jsp");
            request.setAttribute("title", "Contact Us");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void faqs(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("faq.jsp");
            request.setAttribute("title", "FAQ's");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void errorPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("error.jsp");
            request.setAttribute("title", "error");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void single(HttpServletRequest request, HttpServletResponse response) {
        String cat = request.getParameter("cat");
        int pid = Integer.parseInt(request.getParameter("pid"));
        ProductsDao pdao = new ProductsDao();
        ProductBean pObj = pdao.getProductInfo(pid);
        request.setAttribute("product", pObj);
        request.setAttribute("title", cat);
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("single.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void cart(HttpServletRequest request, HttpServletResponse response) {
        String cart = request.getParameter("cart");
        request.setAttribute("title", "MyCart");
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
