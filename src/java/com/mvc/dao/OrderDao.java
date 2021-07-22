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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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

    public void updateOrder(Orders updateOrder) {
        String payment_id = updateOrder.getPayment_id();
        String orderId = updateOrder.getOrderId();
        String status = updateOrder.getPayment_status();
        String query = "update orders set payment_id=?,payment_status=? where order_id=?";
        try {
            pst = connection.prepareStatement(query);
            pst.setString(1, payment_id);
            pst.setString(2, status);
            pst.setString(3, orderId);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List getOrders() {
        String query = "Select * from Orders order by order_status";
        ArrayList List = new ArrayList();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
            SimpleDateFormat src = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            pst = connection.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                //creating local object
                String order_id = rs.getString(1);
                int user_id = rs.getInt(2);
                float amount = rs.getFloat(3);
                String date = "";
                try {
                    java.util.Date od = src.parse(rs.getString(4));
                    date = sdf.format(od);
                                 } catch (ParseException ex) {
                    Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
                }
                String Payment_status = rs.getString(5);
                String reciept = rs.getString(6);
                String payment_id = rs.getString(7);
                String Order_status = rs.getString(8);
                //Creating orders object
                Orders order = new Orders();
                order.setOrderId(order_id).setUser_id(user_id).setAmount(amount).setDate(date).setPayment_status(Payment_status).setReciept(reciept).setPayment_id(payment_id).setOrder_status(Order_status);
                List.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return List;
    }

}
