/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.CategoryBean;
import com.mvc.beans.CustDetails;
import com.mvc.beans.UserBean;
import com.mvc.dao.AdminDao;
import com.mvc.dao.CustInfoDao;
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
            case "saveinfo":
                saveInfo(request, response);
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
            session.setAttribute("message", authorize);
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
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
            session.setAttribute("message", authorize);
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
                    response.sendRedirect("adminPages/main/adminPage.jsp");
                } catch (IOException ex) {
                    Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
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

    private void saveInfo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        int userid = Integer.parseInt(session.getAttribute("userid").toString());

        String fname = request.getParameter("fname");
        System.out.println("fname : " + fname);
        String lname = request.getParameter("lname");
        System.out.println("lname : " + lname);
        String email = request.getParameter("email");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        int pin = Integer.parseInt(request.getParameter("pin"));
        int mobile = Integer.parseInt(request.getParameter("mobile"));
        String addtype = request.getParameter("addtype");

        CustDetails obj = new CustDetails();
        obj.setUserid(userid);
        obj.setFname(fname);
        obj.setLname(lname);
        obj.setEmail(email);
        obj.setAddress1(address1);
        obj.setAddress2(address2);
        obj.setCountry(country);
        obj.setState(state);
        obj.setCity(city);
        obj.setPin(pin);
        obj.setMobile(mobile);
        obj.setAddType(addtype);

        String authorize = new CustInfoDao().saveCustDetails(obj);

        if (authorize.equals("Information saved successfully!") || authorize.equals("Information Update successfully!")) //On success, you can display a message to user on Home page
        {
            session.setAttribute("message", authorize);
            System.out.println(authorize);
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else //On Failure, display a meaningful message to the User.
        {
            session.setAttribute("errMessage", authorize);
            try {
                request.getRequestDispatcher("deliveryInfo.jsp").forward(request, response);
            } catch (IOException | ServletException ex) {
                Logger.getLogger(OperationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
