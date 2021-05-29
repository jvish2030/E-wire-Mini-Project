/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.java.ConPool.DBUtils;
import com.mvc.beans.CategoryBean;
import com.mvc.beans.ProductBean;
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
public class AdminDao {

    public static String createNewCategory(CategoryBean cat) {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String query = "INSERT INTO Categories (Category,photo) values (?,?)";
        int count = 0;
        // System.out.println(email+"..."+password);
        con = DBUtils.connect();//getting connection 
        try {
            pst = con.prepareStatement(query);
            pst.setString(1, cat.getCategory());
             pst.setString(2, cat.getCategoryPhoto());
            count = pst.executeUpdate();
            // System.out.println("query executed");
            if (count > 0) {
                return "CATEGORY INSERTED SUCCESSFULLY!";
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Having problem to add new category!";
    }

    public static String createNewSubCategory(CategoryBean subCat) {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int count = 0;
        String query = "INSERT INTO Categories (Parent_id,Category) values (?,?)";
        // System.out.println(email+"..."+password);
        con = DBUtils.connect();//getting connection 
        try {
            pst = con.prepareStatement(query);
            pst.setInt(1, subCat.getId());
            pst.setString(2, subCat.getCategory());
            count = pst.executeUpdate();
            // System.out.println("query executed");
            if (count > 0) {
                return "SUBCATEGORY INSERTED SUCCESSFULLY!";
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Having problem to add new subcategory!";
    }

    public String saveProduct(ProductBean proObj) {

        String pName = proObj.getpName();
        String pCategory = proObj.getpCategory();
        int pPrice = proObj.getpPrice();
        int pDiscount = proObj.getpDiscount();
        String pRemark = proObj.getpRemark();
        String pPhoto = proObj.getpPhoto();
        String pDescription = proObj.getpDescription();
        int parent_id = proObj.getParent_id();

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String query = "INSERT INTO products (PNAME,PCAT,PRICE,DISC_PRICE,REMARKS,DESCR,PHOTO,PARENT_ID) values (?,?,?,?,?,?,?,?)";
        int count = 0;
        // System.out.println(email+"..."+password);
        con = DBUtils.connect();//getting connection 
        try {
            pst = con.prepareStatement(query);

            pst.setString(1, pName);
            pst.setString(2, pCategory);
            pst.setInt(3, pPrice);
            pst.setInt(4, pDiscount);
            pst.setString(5, pRemark);
            pst.setString(6, pDescription);
            pst.setString(7, pPhoto);
            pst.setInt(8, parent_id);
            count = pst.executeUpdate();

            // System.out.println("query executed");
            if (count > 0) {
                return "PRODUCT ADDDED SUCCESSFULLY!";
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Having problem to Save new Product!";
    }

    public String deleteProduct(int id) {
        int count = 0;
        Connection con = DBUtils.connect();
        PreparedStatement pst = null;
        String query = String.format("Delete from products where prodid = ?");
        try {
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            count = pst.executeUpdate();
            // System.out.println("query executed");
            if (count > 0) {
                return "Item Deleted!";
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Having problem to delete product!";
    }

    public String deleteParentCat(int id) {
        int count = 0;
        Connection con = DBUtils.connect();
        PreparedStatement pst = null;
        String query = String.format("Delete from categories where id = ?");
        try {
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            count = pst.executeUpdate();
            // System.out.println("query executed");
            if (count > 0) {
                return "Category Deleted!";
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Having problem to delete Category!";
    }

}
