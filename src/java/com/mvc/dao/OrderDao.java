/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.java.ConPool.DBUtils;
import com.mvc.beans.OrderDetails;
import com.mvc.beans.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ListIterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jatin
 */
public class OrderDao {

    static Connection connection;
    private PreparedStatement pst;
    private int noOfRecords;

    static {
        connection = DBUtils.connect();
    }

    public void saveOrderInfo(Orders order, ArrayList<OrderDetails> Order_details_AL) {
        String query1 = "insert into orders(order_id,user_id,order_amount,order_reciept) values(?,?,?,?)";

        String orderId;
        orderId = order.getOrderId();
        int user_id = order.getUser_id();
        float amount = order.getAmount();
        String reciept = order.getReciept();
        try {
            pst = connection.prepareStatement(query1);
            pst.setString(1, orderId);
            pst.setInt(2, user_id);
            pst.setFloat(3, amount);
            pst.setString(4, reciept);
            pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query2 = "insert into order_details(order_id,prod_id,prod_name,prod_price,prod_qty) values(?,?,?,?,?)";
        try {
            pst = connection.prepareStatement(query2);
            ListIterator<OrderDetails> listIterator = Order_details_AL.listIterator();
            while (listIterator.hasNext()) {
                OrderDetails obj = listIterator.next();

                String prodName = obj.getProdName();
                float prodPrice = obj.getProdPrice();
                long prodid = obj.getProdid();
                int qty = obj.getQty();

                pst.setString(1, orderId);
                pst.setLong(2, prodid);
                pst.setString(3, prodName);
                pst.setFloat(4, prodPrice);
                pst.setInt(5, qty);
                pst.executeUpdate();

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
