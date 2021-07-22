/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.google.gson.Gson;
import com.mvc.beans.OrderDetails;
import com.mvc.beans.Orders;
import com.mvc.dao.OrderDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.json.JSONArray;
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
        String amt_string = request.getParameter("amounts");
        int amt = Integer.parseInt(amt_string);

        String JSONcart = request.getParameter("jsonData");
        ArrayList<OrderDetails> Order_details_AL;
        //creating list of items
        Order_details_AL = new ArrayList<OrderDetails>();
        try {
            JSONArray jsonArr = new JSONArray(JSONcart);
            for (int i = 0; i < jsonArr.length(); i++) {
                JSONObject jsonObj = jsonArr.getJSONObject(i);
                int id = jsonObj.getInt("productId");
                String name = jsonObj.getString("productName");
                int qty = jsonObj.getInt("productQuantity");
                float price = Float.parseFloat(jsonObj.getString("productPrice"));
                Order_details_AL.add(new OrderDetails().setProdid(id).setQty(qty).setProdName(name).setProdPrice(price));
            }
        } catch (JSONException ex) {
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }

        MediaType typeJson = MediaType.parse("application/json; charset=utf-8");

        JSONObject json = new JSONObject();
        try {
            json.put("amount", amt * 100);
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
        System.out.println(jsonOrderStr);
        HashMap<String, Object> JsonMap = new Gson().fromJson(jsonOrderStr, HashMap.class);

        HttpSession session = request.getSession();
        String useridObj = session.getAttribute("userid").toString();

        int userid = Integer.parseInt(useridObj);
        float amount = Float.parseFloat(JsonMap.get("amount").toString()) / 100;
        String order_id = JsonMap.get("id").toString();
        String receipt
                = JsonMap.get("receipt").toString();

        //creating Orders object
        Orders order = new Orders().setOrderId(order_id).setAmount(amount).setUser_id(userid).setReciept(receipt);

        new OrderDao().saveOrderInfo(order, Order_details_AL);
        //save order ionformation to the database
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(JsonMap));
    }
}
