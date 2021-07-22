/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.java.ConPool.DBUtils;
import com.mvc.beans.CategoryBean;
import com.mvc.beans.CustDetails;
import com.mvc.beans.OrderDetails;
import com.mvc.beans.ProductBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jatin
 */
public class AdminDao {

    static Connection connection;
    private PreparedStatement pst;
    private ResultSet rs;

    static {
        connection = DBUtils.connect();
    }

    public String createNewCategory(CategoryBean cat) {

        String query = "INSERT INTO Categories (Category,photo) values (?,?)";
        int count = 0;
        // System.out.println(email+"..."+password);
        try {
            pst = connection.prepareStatement(query);
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

    public String createNewSubCategory(CategoryBean subCat) {

        int count = 0;
        String query = "INSERT INTO Categories (Parent_id,Category) values (?,?)";
        // System.out.println(email+"..."+password);
        try {
            pst = connection.prepareStatement(query);
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

        String query = "INSERT INTO products (PNAME,PCAT,PRICE,DISC_PRICE,REMARKS,DESCR,PHOTO,PARENT_ID) values (?,?,?,?,?,?,?,?)";
        int count = 0;
        // System.out.println(email+"..."+password);
        try {
            pst = connection.prepareStatement(query);

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
        String query = String.format("Delete from products where prodid = ?");
        try {
            pst = connection.prepareStatement(query);
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

        String query = String.format("Delete from categories where id = ?");
        try {
            pst = connection.prepareStatement(query);
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

    public String deleteChildCat(String name) {
        int count = 0;
        String query = String.format("Delete from categories where category = ?");
        try {
            pst = connection.prepareStatement(query);
            pst.setString(1, name);
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

    public CustDetails getDeliveryAddress(int uid) {
        String query = "SELECT * from cust_details where userid=?";
        CustDetails obj = new CustDetails();
        try {
            pst = connection.prepareStatement(query);
            pst.setInt(1, uid);
            rs = pst.executeQuery();
            if (rs.next()) {
                int userid = rs.getInt(1);
                String fname = rs.getString(2);
                String lname = rs.getString(3);
                String email = rs.getString(4);
                String address1 = rs.getString(5);
                String address2 = rs.getString(6);
                String country = rs.getString(7);
                String state = rs.getString(8);
                String city = rs.getString(9);
                int pin = rs.getInt(10);
                long mobile = rs.getLong(11);
                String addType = rs.getString(12);
                obj.setUserid(userid).setFname(fname).setLname(lname).setEmail(email).setAddress1(address1).setAddress2(address2).setCountry(country).setState(state).setCity(city).setPin(pin).setMobile(mobile).setAddtype(addType);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    public List getUserCart(String oid) {
        String query = "SELECT * from order_details where oid=?";
        List list = new ArrayList();
        try {
            pst = connection.prepareStatement(query);
            pst.setString(1, oid);
            rs = pst.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                String order_id = rs.getString(1);
                long prod_id = Long.parseLong(rs.getString(2));
                String prod_name = rs.getString(3);
                float prod_price = Float.parseFloat(rs.getString(4));
                int prod_qty = rs.getInt(5);
                orderDetails.setOrderId(order_id).setProdid(prod_id).setProdName(prod_name).setProdPrice(prod_price).setQty(prod_qty);
                list.add(orderDetails);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
