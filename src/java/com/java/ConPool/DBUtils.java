/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.ConPool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *performing changes here
 * @author jatin
 */
public class DBUtils {

 //  ----------------- Singelton pattern for getting connection---------------//
    static Connection con;
    public static Connection connect() 
    {
        System.out.println("Inside connect() method ange getting :------" + con);
        if (con != null) {
            return con;
        }
        return getConnection();
    }

    private static Connection getConnection() {
        try {
            Context context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:comp/env/e_wire");
            con = ds.getConnection();
        } catch (NamingException | SQLException e) {
        }
        return con;
    }
    //  ------------- Singelton pattern for getting connection------------------//

    //--------------------static method to get total count of rows based in table name ----------------//
    public static int getCount(String tableName) {
        Connection con = DBUtils.connect();
        ResultSet rs;
        int count = 0;
        try {
            rs = con.createStatement().executeQuery("select count(*) from " + tableName);
            rs.next();
            count = rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }
    //--------------------static method to get total count of rows based in table name ----------------//

}
