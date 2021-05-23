/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Testing;

import com.java.ConPool.DBUtils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jatin
 */
public class Test {

    public static void main(String[] args) {
        String driver = "oracle.jdbc.OracleDriver";
        String jdbc_url = "jdbc:oracle:thin:e_wire/e_wire@localhost:1521:XE";
        Connection con = null;
        try {
            //load and register driver class
            Class.forName(driver);
            con = DriverManager.getConnection(jdbc_url);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }

        //establish connection between java apllication and database
        System.out.println(con);
        String query1 = "SELECT * FROM CATEGORIES where parent_id is null order by Category";
        String query2 = "SELECT * FROM CATEGORIES where parent_id = ? order by category";
        Statement st = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        try {
            st = con.createStatement();
            //Executing Query to Select MainCategories from Table
            rs1 = st.executeQuery(query1);
            while (rs1.next()) {
                //Printing Category Name 
                System.out.println(rs1.getString(3).toUpperCase());
                //Preparing Query to get SubCategories of Category
                PreparedStatement pst = con.prepareStatement(query2);
                pst.setInt(1, rs1.getInt(1));
                rs2 = pst.executeQuery();
                //Printing SubCategory Name 
                while (rs2.next()) {
                    System.out.println("  -" + rs2.getString(3));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
