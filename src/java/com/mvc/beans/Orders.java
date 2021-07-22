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
public class Orders {

    private String orderId;
    private int user_id;
    private float amount;
    private String reciept;
    private String date;
    private String order_status;
    private String payment_id;
    private String payment_status;

    public String getPayment_id() {
        return payment_id;
    }

    public Orders setPayment_id(String payment_id) {
        this.payment_id = payment_id;
        return this;
    }

    public String getOrderId() {
        return orderId;
    }

    public Orders setOrderId(String orderId) {
        this.orderId = orderId;
        return this;
    }

    public int getUser_id() {
        return user_id;
    }

    public Orders setUser_id(int user_id) {
        this.user_id = user_id;
        return this;
    }

    public float getAmount() {
        return amount;
    }

    public Orders setAmount(float amount) {
        this.amount = amount;
        return this;
    }

    public String getReciept() {
        return reciept;
    }

    public Orders setReciept(String reciept) {
        this.reciept = reciept;
        return this;
    }

    public String getDate() {
        return date;
    }

    public Orders setDate(String date) {
        this.date = date;
        return this;
    }

    public String getOrder_status() {
        return order_status;
    }

    public Orders setOrder_status(String order_status) {
        this.order_status = order_status;
        return this;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public Orders setPayment_status(String payment_status) {
        this.payment_status = payment_status;
        return this;
    }

}
