/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.beans.Orders;
import com.mvc.dao.OrderDao;
import java.io.IOException;
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
@WebServlet(name = "UpdateOrderServlet", urlPatterns = {"/UpdateOrderServlet"})
public class UpdateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String payment_id = request.getParameter("payment_id");
        String order_id = request.getParameter("order_id");
        String status = request.getParameter("status");
        //creating Orders object
        Orders updateOrder = new Orders().setPayment_id(payment_id).setOrderId(order_id).setPayment_status(status);

        //update Orders info ijn database
        new OrderDao().updateOrder(updateOrder);
        System.out.println("final execution");
        HttpSession                 session         =       request.getSession();
        String                      useridObj       =       session.getAttribute("userid").toString();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(useridObj);

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

}
