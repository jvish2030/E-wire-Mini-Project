/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.java.ConPool.DBUtils;
import com.mvc.beans.UserBean;
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
public class RegisterDao {

    public String registerUser(UserBean user) {
        int i = 0;
        Connection con = null;
        PreparedStatement pst = null;

        String fullName = user.getFullName();
        String email = user.getEmail();
        String password = user.getPassword();
        con = DBUtils.connect();
        String query1 = "insert into users(fullName,Email,Password) values (?,?,?)";
        String query2 = "select (userid) from users where fullname=? and email=?";
        try {
            //Insert user details into the table 'USERS'
            pst = con.prepareStatement(query1);
            pst.setString(1, fullName);
            pst.setString(2, email);
            pst.setString(3, password);
            i = pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RegisterDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        //another ps objects to get userid
        try {
            pst = con.prepareStatement(query2);
            pst.setString(1, fullName);
            pst.setString(2, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user.setUserid(rs.getInt(1));//getting db userid and setting to user object userid
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (i != 0) //Just to ensure data has been inserted into the database
        {
            return "REGISTRATION SUCCESSFUL!";
        }
        return "Oops.. Something went wrong there..!";
    }

}
