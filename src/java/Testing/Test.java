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
        String subCat ="Aluminium";
        int start=1, end=5;
        String query = "select * from (select  products.prodid, products.pname, products.pcat, products.price,products.disc_price,products.remarks,products.descr,products.create_date,products.photo,products.parent_id,ROW_NUMBER() OVER (ORDER BY products.prodid asc ) ROW_NUM FROM PRODUCTS where pcat = '"+subCat+"') WHERE ROW_NUM BETWEEN "+start+" AND "+end+"";
        Statement st = null;
        ResultSet rs1 = null;
        try {
            st = con.createStatement();
            //Executing Query to Select MainCategories from Table
            rs1 = st.executeQuery(query);
            while (rs1.next()) {
                //Printing Category Name 
                System.out.println(rs1.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
