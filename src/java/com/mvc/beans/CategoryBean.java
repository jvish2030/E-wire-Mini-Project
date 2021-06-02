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
public class CategoryBean {

    private int id;
    private Integer parent_id;
    private String Category;
    private String categoryPhoto;

    public CategoryBean() {
    }

    public CategoryBean(String name, String FileName) {
        this.Category = name;
        this.categoryPhoto = FileName;
    }

    public CategoryBean(int id, String subCategory) {
        this.id = id;
        this.Category = subCategory;
    }

    public String getCategoryPhoto() {
        return categoryPhoto;
    }

    public void setCategoryPhoto(String categoryPhoto) {
        this.categoryPhoto = categoryPhoto;
    }

    public CategoryBean(String Category) {
        this.Category = Category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

}
