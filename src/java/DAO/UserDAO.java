/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.ProductDTO;
import DTO.UserDTO;
import Utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author TBL
 */
public class UserDAO {

    private Connection conn;
    private PreparedStatement pStm;
    private ResultSet rs;

    public UserDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (pStm != null) {
            pStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    private static final String LOGIN = "SELECT userID, roleID, name, phone, address, email  FROM tblUsers WHERE userID = ? AND password = ?";
    private static final String INSERT = "INSERT INTO tblUsers(userID, password, roleID, name, phone, address, email) VALUES(?, ?, ?, ?, ?, ?, ?)";
    private static final String CHECK_DUPLICATE = "SELECT userID FROM tblUsers WHERE userID = ?";
    private static final String CHECK_EMAIL = "SELECT userID, roleID, name, phone, address, email FROM tblUsers WHERE email = ?";

    public UserDTO checkLogin(String userID, String pass) throws SQLException, Exception {
        UserDTO user = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(LOGIN);
                pStm.setString(1, userID);
                pStm.setString(2, pass);
                rs = pStm.executeQuery();
                if (rs.next()) {
                    int roleID = rs.getInt("roleID");
                    String name = rs.getString("name");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    user = new UserDTO(userID, pass, roleID, name, phone, address, email);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return user;
    }

    public boolean insert(UserDTO user) throws SQLException, Exception {
        boolean check = false;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(INSERT);
                pStm.setString(1, user.getUserID());
                pStm.setString(2, user.getPassword());
                pStm.setInt(3, user.getRoleID());
                pStm.setString(4, user.getName());
                pStm.setInt(5, user.getPhone());
                pStm.setString(6, user.getAddress());
                pStm.setString(7, user.getEmail());
                check = pStm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws SQLException, Exception {
        boolean check = false;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(CHECK_DUPLICATE);
                pStm.setString(1, userID);
                rs = pStm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return check;
    }

    public UserDTO getUserByEmail(String email) throws SQLException, Exception {
        UserDTO check = null;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(CHECK_EMAIL);
                pStm.setString(1, email);
                rs = pStm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    int roleID = rs.getInt("roleID");
                    String name = rs.getString("name");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String pass = "";
                    check = new UserDTO(userID, pass, roleID, name, phone, address, email);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return check;
    }
}
