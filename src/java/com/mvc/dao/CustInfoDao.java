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
import java.sql.ResultSet;
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
        int count;
        String query1 = "select * from Cust_Details where userid=?";
        String query2 = "insert into Cust_Details values(?,?,?,?,?,?,?,?,?,?,?,?)";
        String query3 = "UPDATE cust_details SET  fname = ?,lname = ? ,email = ? ,address1= ? ,address2 = ?  ,country = ? ,state = ? ,city = ? ,pin = ? ,mobile = ?  ,addType = ? WHERE userid = ? ";
        try {
            pst = connection.prepareStatement(query1);
            pst.setInt(1, obj.getUserid());
            ResultSet rs1 = pst.executeQuery();
            if (rs1.next()) {
                //perform update operation
                System.out.println("perform update operation");

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

                pst = connection.prepareStatement(query3);

                pst.setString(1, fname);
                pst.setString(2, lname);
                pst.setString(3, email);
                pst.setString(4, address1);
                pst.setString(5, address2);
                pst.setString(6, country);
                pst.setString(7, state);
                pst.setString(8, city);
                pst.setInt(9, pin);
                pst.setInt(10, mobile);
                pst.setString(11, addType);
                pst.setInt(12, userid);
                count = pst.executeUpdate();
                if (count > 0) {
                    return "Information Update successfully!";
                }

            } else {
                //perform insert operation
                System.out.println("perform insert operation");
                int userid = obj.getUserid();
                System.out.println("userid : "+userid);

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

                pst = connection.prepareStatement(query2);
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
                    return "Information Saved Successfully!";
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Having problem to saving Information!";
    }

    public CustDetails getCustDetails(int userid) {
        String query = "select * from Cust_Details where userid=?";
        CustDetails obj = null;
        try {
            pst = connection.prepareStatement(query);
            pst.setInt(1, userid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                obj = new CustDetails();
                obj.setUserid(rs.getInt(1));
                obj.setFname(rs.getString(2));
                obj.setLname(rs.getString(3));
                obj.setEmail(rs.getString(4));
                obj.setAddress1(rs.getString(5));
                obj.setAddress2(rs.getString(6));
                obj.setCountry(rs.getString(7));
                obj.setState(rs.getString(8));
                obj.setCity(rs.getString(9));
                obj.setPin(rs.getInt(10));
                obj.setMobile(rs.getInt(11));
                obj.setAddType(rs.getString(12));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustInfoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
}
