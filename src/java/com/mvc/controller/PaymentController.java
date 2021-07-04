/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.razorpay.RazorpayException;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author jatin
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/Payment"})
public class PaymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // initializing key id and key_secret with razorpay provided id  
        String key_id = "rzp_test_iYsvo3NAi2xkOe";
        String key_secret = "Zfmc3TY2PjOQ3z0nD2Q4yNmM";

        //testing
        System.out.println("inside payment servlet");

//       converting String to Int
        String amt_string = request.getParameter("amount");
        int amt = Integer.parseInt(amt_string);

        //testing
        System.out.println(amt);

//       we need to pass Amount into Paisa nd then pass it to RazorPay Server
        try {
            RazorpayClient razorpayClient = new RazorpayClient(key_id, key_secret);
            JSONObject options = new JSONObject();
            options.put("amount", amt * 100);
            options.put("currency", "INR");
            options.put("receipt", "txn_123456");
            Order order = razorpayClient.Orders.create(options);
        } catch (RazorpayException | JSONException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
