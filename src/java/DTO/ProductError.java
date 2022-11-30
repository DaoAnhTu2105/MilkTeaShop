/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author TBL
 */
public class ProductError {

    private String productID;
    private String catagoryID;
    private String name;
    private String price;
    private String quantity;
    private String image;
    private String error;
    
    public ProductError(){
        this.productID="";
        this.catagoryID="";
        this.name="";
        this.price="";
        this.quantity="";
        this.image="";
        this.error="";
    }

    public ProductError(String productID, String catagoryID, String name, String price, String quantity, String image, String error) {
        this.productID = productID;
        this.catagoryID = catagoryID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.error = error;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(String catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
}
