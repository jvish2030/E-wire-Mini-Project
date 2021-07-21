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
    private String status;
    private String payment_id;

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

    public String getStatus() {
        return status;
    }

    public Orders setStatus(String status) {
        this.status = status;
        return this;
    }

}
