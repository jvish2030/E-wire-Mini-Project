/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.java.ConPool.DBUtils;
import com.mvc.beans.CustDetails;
import static com.mvc.dao.ProductsDao.connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jatin
 */
public class CustInfoDao {

    static Connection connection;
    PreparedStatement pst;

    static {
        connection = DBUtils.connect();
    }

    public String saveCustDetails(CustDetails obj) {
        String query = "insert into Cust_Details values(?,?,?,?,?,?,?,?,?,?,?,?)";
        int count;
        int userid = obj.getUserid();
        String fname = obj.getFname();
        String lname = obj.getLname();
        String email = obj.getEmail();
        String address1 = obj.getAddress1();
        String address2 = obj.getAddress2();
        String country = obj.getCountry();
        String state = obj.getState();
        int pin = obj.getPin();
        String city = obj.getCity();
        int mobile = obj.getMobile();
        String addType = obj.getAddType();
        try {
            pst = connection.prepareStatement(query);
            pst.setInt(1, userid);
            pst.setString(2, fname);
            pst.setString(3, lname);
            pst.setString(4, email);
            pst.setString(5, address1);
            pst.setString(6, address2);
            pst.setString(7, country);
            pst.setString(8, state);
            pst.setString(9, city);
            pst.setInt(10, pin);
            pst.setInt(11, mobile);
            pst.setString(12, addType);

            count = pst.executeUpdate();
            if (count > 0) {
                return "Information saved successfully!";
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Having problem to saving Information!";
    }
}
