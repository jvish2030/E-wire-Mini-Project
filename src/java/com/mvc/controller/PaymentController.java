/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import okhttp3.MediaType;
import okhttp3.OkHttpClient; 
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author jatin
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/Payment"})
public class PaymentController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // initializing key id and key_secret with razorpay provided id  
        String key_id = "p_test_JcWu5d1ITT2h0i";
        String key_secret = "uqeT129uaOu2ghjRCfBFHEwx";
        System.out.println("Inside Payment Servlet");
        String amt_string = request.getParameter("amounts");
        System.out.println("amtConversion:" + amt_string);
        int amt = Integer.parseInt(amt_string);
        System.out.println("conv");
        System.out.println("amt:" + amt);
        MediaType typeJson = MediaType.parse("application/json; charset=utf-8");

        JSONObject json = new JSONObject();
        try {
            json.put("amount", amt*100);
            json.put("currency", "INR");
            json.put("receipt", "txn_123456");
            json.put("payment_capture", 1);
        } catch (JSONException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        //Declare to pass a json string to the server
        // Create an OkHttpClient object
        OkHttpClient client = new OkHttpClient().newBuilder().build();
        // Create a RequestBody (parameter 1: data type parameter 2 passed json string)
        //json is a json data of type String
        RequestBody body = RequestBody.create(typeJson, String.valueOf(json));
        // Create a request object
        Request requests;
        requests = new Request.Builder()
                .url("https://api.razorpay.com/v1/orders")
                .method("POST", body)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Basic cnpwX3Rlc3RfSmNXdTVkMUlUVDJoMGk6dXFlVDEyOXVhT3UyZ2hqUkNmQkZIRXd4")
                .build();
        Response responses = client.newCall(requests).execute();
        String jsonOrderStr = responses.body().string();

        //save order ionformation to the database
        System.out.println("executed...");

        HashMap<String, Object> JsonMap = new Gson().fromJson(jsonOrderStr, HashMap.class);
        System.out.println(JsonMap);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(JsonMap));
    }
}
