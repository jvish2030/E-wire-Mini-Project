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
public class CustDetails {

    private int userid;
    private String fname;
    private String lname;
    private String email;
    private String address1;
    private String address2;
    private String country;
    private String state;
    private String city;
    private int pin;
    private long mobile;
    private String addType;

    public String getAddType() {
        return addType;
    }

    public CustDetails setAddType(String addType) {
        this.addType = addType;
        return this;

    }

    public String getCity() {
        return city;
    }

    public CustDetails setCity(String city) {
        this.city = city;
        return this;

    }
    private String addtype;

    public int getUserid() {
        return userid;
    }

    public CustDetails setUserid(int userid) {
        this.userid = userid;
        return this;

    }

    public String getFname() {
        return fname;
    }

    public CustDetails setFname(String fname) {
        this.fname = fname;
        return this;

    }

    public String getLname() {
        return lname;
    }

    public CustDetails setLname(String lname) {
        this.lname = lname;
        return this;

    }

    public String getEmail() {
        return email;
    }

    public CustDetails setEmail(String email) {
        this.email = email;
        return this;

    }

    public String getAddress1() {
        return address1;
    }

    public CustDetails setAddress1(String address1) {
        this.address1 = address1;
        return this;
    }

    public String getAddress2() {
        return address2;
    }

    public CustDetails setAddress2(String address2) {
        this.address2 = address2;
        return this;

    }

    public String getCountry() {
        return country;
    }

    public CustDetails setCountry(String country) {
        this.country = country;
        return this;

    }

    public String getState() {
        return state;
    }

    public CustDetails setState(String state) {
        this.state = state;
        return this;

    }

    public int getPin() {
        return pin;
    }

    public CustDetails setPin(int pin) {
        this.pin = pin;
        return this;

    }

    public Long getMobile() {
        return mobile;
    }

    public CustDetails setMobile(long mobile) {
        this.mobile = mobile;
        return this;

    }

    public String getAddtype() {
        return addtype;
    }

    public CustDetails setAddtype(String addtype) {
        this.addtype = addtype;
        return this;

    }

}
