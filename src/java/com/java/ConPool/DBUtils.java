/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.ConPool;

import Testing.Test;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * performing changes here
 *
 * @author jatin
 */
public class DBUtils {

    //  ----------------- Singelton pattern for getting connection---------------//
    static Connection conn;

    public static Connection connect() {
        System.out.println("Inside connect() method and getting :------" + conn);
        if (conn != null) {
            return conn;
        }
        return getConnection();
    }

    private static Connection getConnection() {
        try {
            Context context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:comp/env/e_wire");
            conn = ds.getConnection();
        } catch (NamingException | SQLException e) {
        }
        return conn;
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

    public static Set getCategoriesSet() {
        Connection con = DBUtils.connect();
        String query1 = "SELECT * FROM CATEGORIES where parent_id is null order by Category";
        Statement st;
        ResultSet rs1;
        LinkedHashMap map = new LinkedHashMap();
        try {
            st = con.createStatement();
            rs1 = st.executeQuery(query1);
            while (rs1.next()) {
                map.put(rs1.getInt(1), rs1.getString(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
        Set s1 = map.entrySet();
        return s1;
    }

    public static List<String> getSubCategories(int id) {
        Connection con;
        con = DBUtils.connect();
        String query2 = "SELECT * FROM CATEGORIES where parent_id = ? order by category";
        ResultSet rs2;
        List l = new ArrayList();
        try {
            PreparedStatement pst = con.prepareStatement(query2);
            pst.setInt(1, id);
            rs2 = pst.executeQuery();
            //Printing SubCategory Name 
            while (rs2.next()) {
                l.add(rs2.getString(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }

        return l;
    }

    public static ResultSet getParentRows() {
        Connection con;
        con = DBUtils.connect();
        String query = "SELECT * FROM CATEGORIES where parent_id is null order by category";
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public static ResultSet getChildRows(int id) {
        Connection con;
        con = DBUtils.connect();
        String query = String.format("SELECT * FROM Products where parent_id = %d order by pname", id);
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static String getMaxProId() {
        String Fname = null;
        Connection con;
        con = DBUtils.connect();
        String query = "SELECT max(prodid)+1 FROM Products";
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(query);
            if (rs.next()) {
                Fname = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Fname;
    }

    public static String getMaxCatId() {
        String Fname = null;
        Connection con;
        con = DBUtils.connect();
        String query = "SELECT max(id)+1 FROM Categories";
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(query);
            if (rs.next()) {
                Fname = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Fname;
    }

    public static ResultSet getDeletingProductsId(int id) {
        Connection con;
        con = DBUtils.connect();
        String query = "SELECT (prodid) FROM PRODUCTS where parent_id = " + id;
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public static ResultSet getAllCustomers() {
    
        Connection con;
        con = DBUtils.connect();
        String query = "SELECT * FROM USERS";
        ResultSet rs = null;
        try {
            rs = con.createStatement().executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

}
