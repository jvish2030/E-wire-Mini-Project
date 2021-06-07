/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.CategoryBean;
import com.mvc.beans.ProductBean;
import com.mvc.dao.ProductsDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jatin
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        page = page.toLowerCase();
        switch (page) {
            case "home":
                home(request, response);
                break;
            case "category":
                category(request, response);
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

    private void home(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void error(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("error.jsp");
            request.setAttribute("title", "error");
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void category(HttpServletRequest request, HttpServletResponse response) {
        int pageid = 1;
        int productPerPage = 12;

        int start = 1;
        int end = productPerPage;

        int id;
        String category;
        String subCat = null;
        int noOfRecords;
        int noOfPages;

        if (request.getParameter("pageid") != null) {
            pageid = Integer.parseInt(request.getParameter("pageid"));
            start = pageid - 1;
            start = start * productPerPage + 1;
            end = start + productPerPage - 1;
        }

        CategoryBean obj = new CategoryBean();

        ProductsDao dao = new ProductsDao();

        List<ProductBean> productsList;

        if (request.getParameter("pageid") != null) {
            pageid = Integer.parseInt(request.getParameter("pageid"));
        }

        id = Integer.parseInt(request.getParameter("id"));
        category = request.getParameter("value");

        if (request.getParameter("pcat") == null) {
            obj.setCategory(category);
            obj.setId(id);
            productsList = dao.getAllProducts(id, start, end);
            noOfRecords = dao.getNoOfRecords(id);
            noOfPages = (int) Math.ceil(noOfRecords * 1.0 / productPerPage);
        } else {
            subCat = request.getParameter("pcat");
            obj.setCategory(category);
            obj.setSubCategory(subCat);
            productsList = dao.getSubProducts(id, subCat, start, end);
            noOfRecords = dao.getNoOfSubRecords(id, subCat);
            noOfPages = (int) Math.ceil(noOfRecords * 1.0 / productPerPage);
        }

        //FETCHGNG GET PARAMETERS & STORING IT INTO LOCAL VARIABLES
        //CREATING CategoryBean OBJ & SETTING PARAMETER VALUE
        //initial local var tp get first n records;
        request.setAttribute("title", category);
        request.setAttribute("subCat", subCat);
        request.setAttribute("productsList", productsList);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", pageid);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("products.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
