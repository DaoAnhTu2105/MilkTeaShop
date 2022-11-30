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
public class CatagoryDTO {
    private int catagoryID;
    private String name;
    
    public CatagoryDTO(){
        
    }

    public CatagoryDTO(int catagoryID, String name) {
        this.catagoryID = catagoryID;
        this.name = name;
    }

    public int getCatagoryID() {
        return catagoryID;
    }

    public void setCatagoryID(int catagoryID) {
        this.catagoryID = catagoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
