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
public class UserError {

    private String userID;
    private String password;
    private String roleID;
    private String name;
    private String phone;
    private String address;
    private String email;
    private String error;
    private String confirm;

    public UserError() {
        this.userID = "";
        this.password = "";
        this.roleID = "";
        this.name = "";
        this.phone = "";
        this.address = "";
        this.email = "";
        this.error = "";
        this.confirm = "";
    }

    public UserError(String userID, String password, String roleID, String name, String phone, String address, String email, String error) {
        this.userID = userID;
        this.password = password;
        this.roleID = roleID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.error = error;
        this.confirm = confirm;
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

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
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

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }
    
}
