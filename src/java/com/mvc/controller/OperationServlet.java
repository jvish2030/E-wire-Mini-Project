/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.CategoryBean;
import com.mvc.beans.UserBean;
import com.mvc.dao.AdminDao;
import com.mvc.dao.LoginDao;
import com.mvc.dao.RegisterDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author jatin
 */
@WebServlet(name = "OperationServlet", urlPatterns = {"/Operation"})
public class OperationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operation = request.getParameter("operation");
        operation = operation.toLowerCase();

        switch (operation) {
            case "addcategory":

                System.out.println(request.getParameter("CategoryName"));
               addCategoryOperation(request, response);
                break;
            case "addsubcategory":
                int id = Integer.parseInt(request.getParameter("SelectCategory"));
                String subCategory = request.getParameter("subCategory");
                CategoryBean subCatObj = new CategoryBean(id, subCategory);
                addSubCategoryOperation(request, response, subCatObj);
                //  addCategoryOperation(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                error(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String operation = request.getParameter("operation");
        operation = operation.toLowerCase();

        String fullName = null;
        String email = null;
        String password = null;
        UserBean user = null;

        switch (operation) {
            case "register":
                fullName = request.getParameter("fullname");
                email = request.getParameter("email");
                password = request.getParameter("password");
                user = new UserBean(fullName, email, password);
                register(request, response, user);
                break;
            case "login":
                email = request.getParameter("email");
                password = request.getParameter("password");
                user = new UserBean(email, password);
                //System.out.println(user.getEmail()+"....."+user.getPassword());
                login(request, response, user);
                break;
            default:
                error(request, response);
        }

    }

    private void register(HttpServletRequest request, HttpServletResponse response, UserBean user) {
        RegisterDao registerDao = new RegisterDao();

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String authorize = registerDao.registerUser(user);
        HttpSession session = request.getSession();
        if (authorize.equals("REGISTRATION SUCCESSFUL!")) //On success, you can display a message to user on Home page
        {

            session.setAttribute("uname", user.getFullName());
            session.setAttribute("userid", user.getUserid());
            request.setAttribute("message", authorize);
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response, UserBean user) {

        String authorize = new LoginDao().authorizedLogin(user);
        System.out.println(authorize);
        HttpSession session = request.getSession();

        if (authorize.equals("SUCCESS LOGIN")) //On success, you can display a message to user on Home page
        {

            session.setAttribute("uname", user.getFullName());
            session.setAttribute("userid", user.getUserid());
            request.setAttribute("message", authorize);
            if (user.getRole().equalsIgnoreCase("customer")) {
                try {
                    try {
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        //   response.sendRedirect("mainPage.jsp");
                    } catch (ServletException ex) {
                        Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } catch (IOException ex) {
                    Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {

                    response.sendRedirect("adminPage.jsp");
                } catch (IOException ex) {
                    Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } else //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        //response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.invalidate();
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException ex) {
            Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void error(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("error.jsp");
        } catch (IOException ex) {
            Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void addCategoryOperation(HttpServletRequest request, HttpServletResponse response) {

        CategoryBean cat = new CategoryBean(request.getParameter("CategoryName"));        
        String authorize = AdminDao.createNewCategory(cat);

        if (authorize.equals("CATEGORY INSERTED SUCCESSFULLY!")) //On success, you can display a message to user on Home page
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

    private void addSubCategoryOperation(HttpServletRequest request, HttpServletResponse response, CategoryBean subCatObj) {
        String authorize = AdminDao.createNewSubCategory(subCatObj);
        if (authorize.equals("SUBCATEGORY INSERTED SUCCESSFULLY!")) //On success, you can display a message to user on Home page
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
