/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.Helper;

/**
 *
 * @author jatin
 */
public class Helper {

    public static String get10Words(String desc) {
        String[] strs = desc.split(" ");

        if (strs.length > 10) {
            String res = "";
            for (int i = 0; i < 10; i++) {
                res = res + strs[i] + " ";
            }
            return (res + "...");
        } else {

            return (desc);
        }

    }
}
