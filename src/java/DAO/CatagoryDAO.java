/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CatagoryDTO;
import Utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author TBL
 */
public class CatagoryDAO {

    private Connection conn;
    private PreparedStatement pStm;
    private ResultSet rs;

    public CatagoryDAO() {
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

    private static final String ID = "SELECT catagoryID, name FROM tblCatagory WHERE catagoryID = ?";

    public CatagoryDTO getCataByID(int id) throws Exception {
        CatagoryDTO result = null;
        try {

            conn = DBContext.getConnection();
            pStm = conn.prepareStatement(ID);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                int cataID = rs.getInt("catagoryID");
                String name = rs.getString("name");
                result = new CatagoryDTO(cataID, name);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
