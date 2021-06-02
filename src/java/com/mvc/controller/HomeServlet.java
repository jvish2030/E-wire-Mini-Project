/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.CategoryBean;
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
        //FETCHGNG GET PARAMETERS & STORING IT INTO LOCAL VARIABLES
        int id = Integer.parseInt(request.getParameter("id"));
        String category = request.getParameter("value");
        //CREATING CategoryBean OBJ & SETTING PARAMETER VALUE
        CategoryBean obj = new CategoryBean();
        obj.setCategory(category);
        obj.setId(id);
        //SETTING CATEGORY OBJINTO SEESION OBJ
        HttpSession session = request.getSession();
        session.setAttribute("category", obj);
        //GETTING RequestDispatcher TO CATEGORY.JSP
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("products.jsp");
        
        //setting title attribute
         request.setAttribute("title", category);
        try {
            //FORWARDING REQUEST
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
