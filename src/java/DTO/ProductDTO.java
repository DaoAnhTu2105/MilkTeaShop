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
public class ProductDTO {
    private String productID;
    private CatagoryDTO catagoryID;
    private String name;
    private int price;
    private int quantity;
    private String image;
    
    public ProductDTO(){
        
    }

    public ProductDTO(String productID, CatagoryDTO catagoryID, String name, int price, int quantity, String image) {
        this.productID = productID;
        this.catagoryID = catagoryID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public CatagoryDTO getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(CatagoryDTO catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
