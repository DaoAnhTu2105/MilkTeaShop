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
public class UserDTO {

    private String userID;
    private String password;
    private int roleID;
    private String name;
    private int phone;
    private String address;
    private String email;

    public UserDTO() {
        this.userID = "";
        this.password = "";
        this.roleID = 0;
        this.name = "";
        this.phone = 0;
        this.address = "";
        this.email = "";
    }

    public UserDTO(String userID, String password, int roleID, String name, int phone, String address, String email) {
        this.userID = userID;
        this.password = password;
        this.roleID = roleID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
