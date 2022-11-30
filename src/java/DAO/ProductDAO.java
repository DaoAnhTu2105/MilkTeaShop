/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CatagoryDTO;
import DTO.ProductDTO;
import DTO.UserDTO;
import Utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author TBL
 */
public class ProductDAO {

    private Connection conn;
    private PreparedStatement pStm;
    private ResultSet rs;

    public ProductDAO() {
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

    private static final String SEARCH = "SELECT productID, catagoryID, name, price, quantity, images FROM tblProduct WHERE name like ?";
    private static final String UPDATE = "UPDATE tblProduct SET catagoryID = ?, name = ?, price = ?, quantity = ?, images = ? WHERE productID = ?";
    private static final String DELETE = "DELETE tblProduct WHERE productID= ?";
    private static final String CHECK_DUPLICATE = "SELECT productID FROM tblProduct WHERE productID = ?";
    private static final String INSERT = "INSERT INTO tblProduct(productID, catagoryID, name, price, quantity, images) VALUES(?, ?, ?, ?, ?, ?)";
     private static final String ALL = "SELECT productID, catagoryID, name, price, quantity, images FROM tblProduct";
    public ArrayList<ProductDTO> search(String search) throws SQLException {
        ArrayList<ProductDTO> pro = new ArrayList<>();
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(SEARCH);
                pStm.setString(1, "%" + search.trim() + "%");
                rs = pStm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    int catagory = rs.getInt("catagoryID");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("images");
                    CatagoryDAO dao = new CatagoryDAO();
                    CatagoryDTO cata = dao.getCataByID(catagory);
                    pro.add(new ProductDTO(id, cata, name, price, quantity, img));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return pro;
    }

    public boolean update(ProductDTO user) throws SQLException {
        boolean check = false;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(UPDATE);
                pStm.setInt(1, user.getCatagoryID().getCatagoryID());
                pStm.setString(2, user.getName());
                pStm.setInt(3, user.getPrice());
                pStm.setInt(4, user.getQuantity());
                pStm.setString(5, user.getImage());
                pStm.setString(6, user.getProductID());
                check = pStm.executeUpdate() > 0? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return check;
    }
    
     public boolean delete(String proID) throws SQLException {
        boolean check = false;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(DELETE);
                pStm.setString(1, proID);
                check = pStm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return check;
    }
     
     public boolean checkDuplicate(String proID) throws SQLException {
        boolean check = false;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(CHECK_DUPLICATE);
                pStm.setString(1, proID);
                rs = pStm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return check;
    }
     public boolean insert(ProductDTO pro) throws SQLException {
        boolean check = false;
        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                pStm = conn.prepareStatement(INSERT);
                pStm.setString(1, pro.getProductID());
                pStm.setInt(2, pro.getCatagoryID().getCatagoryID());
                pStm.setString(3, pro.getName());
                pStm.setInt(4, pro.getPrice());
                pStm.setInt(5, pro.getQuantity());
                pStm.setString(6, pro.getImage());
                check = pStm.executeUpdate() > 0?true:false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return check;
    }
     
         public ArrayList<ProductDTO> getAllPro() throws Exception {
            ArrayList<ProductDTO> result = null;
            try {
                conn = DBContext.getConnection();
                pStm = conn.prepareStatement(ALL);
                rs = pStm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    int catagory = rs.getInt("catagoryID");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("images");
                    CatagoryDAO dao = new CatagoryDAO();
                    CatagoryDTO cata = dao.getCataByID(catagory);
                    ProductDTO pro = new ProductDTO(id, cata, name, price, quantity, img);
                    result.add(pro);
                }
            } finally {
                closeConnection();
            }
            return result;
        }
}
