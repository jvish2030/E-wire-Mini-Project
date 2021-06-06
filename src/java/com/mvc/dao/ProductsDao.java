/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import Testing.Test;
import com.java.ConPool.DBUtils;
import com.mvc.beans.ProductBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jatin
 */
public class ProductsDao {

    static Connection connection;
    PreparedStatement pst;
    private int noOfRecords;

    static {
        connection = DBUtils.connect();
    }

    public List<ProductBean> getAllProducts(int id, int start, int end) {
        String query = "select * from (select  products.prodid, products.pname, products.pcat, products.price,products.disc_price,products.remarks,products.descr,products.create_date,products.photo,products.parent_id , ROW_NUMBER() OVER (ORDER BY products.prodid asc ) ROW_NUM FROM PRODUCTS where parent_id = ?) WHERE ROW_NUM BETWEEN ? AND ?";
        List<ProductBean> list = new ArrayList<ProductBean>();
        try {
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            pst.setInt(2, start);
            pst.setInt(3, end);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int pId = rs.getInt(1);
                String pName = rs.getString(2);
                String pCat = rs.getString(3);
                int pPrice = rs.getInt(4);
                int pDiscPrice = rs.getInt(5);
                String pRemark = rs.getString(6);
                String pDesc = rs.getString(7);
                String pDate = rs.getString(8);
                String pPhoto = rs.getString(9);
                int pParentId = rs.getInt(10);

                // System.out.println(pId + "..." + pName + "..." + pCat + "..." + pPrice + "..." + pDiscPrice + "..." + pRemark + "..." + pDesc + "..." + pDate + "..." + pPhoto + "..." + pParentId);
                ProductBean obj = new ProductBean();
                obj.setpId(pId);
                obj.setpName(pName);
                obj.setpPrice(pPrice);
                obj.setpCategory(pCat);
                obj.setpDiscount(pDiscPrice);
                obj.setpRemark(pRemark);
                obj.setpDescription(pDesc);
                obj.setpDate(pDate);
                obj.setpPhoto(pPhoto);
                obj.setParent_id(pParentId);

                list.add(obj);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNoOfRecords(int id) {
        int count = 0;
        String query = "select count(*) from products where parent_id = ?";
        try {
            pst = connection.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public List<ProductBean> getSubProducts(int id,String subCat, int start, int end) {

        String query = "select * from (select  products.prodid, products.pname, products.pcat, products.price,products.disc_price,products.remarks,products.descr,products.create_date,products.photo,products.parent_id,ROW_NUMBER() OVER (ORDER BY products.prodid asc ) ROW_NUM FROM PRODUCTS where pcat = '" + subCat + "' and parent_id=" + id + ") WHERE ROW_NUM BETWEEN " + start + " AND " + end + "";

        List<ProductBean> list = new ArrayList<ProductBean>();
        try {
            pst = connection.prepareStatement(query);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int pId = rs.getInt(1);
                String pName = rs.getString(2);
                String pCat = rs.getString(3);
                int pPrice = rs.getInt(4);
                int pDiscPrice = rs.getInt(5);
                String pRemark = rs.getString(6);
                String pDesc = rs.getString(7);
                String pDate = rs.getString(8);
                String pPhoto = rs.getString(9);
                int pParentId = rs.getInt(10);

                // System.out.println(pId + "..." + pName + "..." + pCat + "..." + pPrice + "..." + pDiscPrice + "..." + pRemark + "..." + pDesc + "..." + pDate + "..." + pPhoto + "..." + pParentId);
                ProductBean obj = new ProductBean();
                obj.setpId(pId);
                obj.setpName(pName);
                obj.setpPrice(pPrice);
                obj.setpCategory(pCat);
                obj.setpDiscount(pDiscPrice);
                obj.setpRemark(pRemark);
                obj.setpDescription(pDesc);
                obj.setpDate(pDate);
                obj.setpPhoto(pPhoto);
                obj.setParent_id(pParentId);

                list.add(obj);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNoOfSubRecords(int id, String subCat) {
        int count = 0;
        String query = "select count(*) from products where pcat = ? and parent_id = ?";
        try {
            pst = connection.prepareStatement(query);
            pst.setString(1, subCat);
            pst.setInt(2, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
