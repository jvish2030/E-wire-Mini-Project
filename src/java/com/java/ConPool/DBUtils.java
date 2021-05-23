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
    static Connection con;

    public static Connection connect() {
        System.out.println("Inside connect() method and getting :------" + con);
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

    public static Set getCategories() {
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
        System.out.println(s1);
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
        System.out.println(l);
        return l;
    }
}
