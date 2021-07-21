/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.beans;

/**
 *
 * @author jatin
 */
public class OrderDetails {

    private String orderId;
    private long prodid;
    private int qty;
    private String prodName;
    private float prodPrice;

    public String getProdName() {
        return prodName;
    }

    public OrderDetails setProdName(String prodName) {
        this.prodName = prodName;
         return this;
    }

    public float getProdPrice() {
        return prodPrice;
    }

    public OrderDetails setProdPrice(float prodPrice) {
        this.prodPrice = prodPrice;
         return this;
    }

    public String getOrderId() {
        return orderId;
    }

    public OrderDetails setOrderId(String orderId) {
        this.orderId = orderId;
        return this;
    }

    public long getProdid() {
        return prodid;
    }

    public OrderDetails setProdid(long prodid) {
        this.prodid = prodid;
        return this;

    }

    public int getQty() {
        return qty;
    }

    public OrderDetails setQty(int qty) {
        this.qty = qty;
        return this;

    }

}
