/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CatagoryDAO;
import DAO.ProductDAO;
import DTO.CatagoryDTO;
import DTO.ProductDTO;
import DTO.ProductError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TBL
 */
@WebServlet(name = "CreateProController", urlPatterns = {"/CreateProController"})
public class CreateProController extends HttpServlet {

    public static final String ERROR = "createProduct.jsp";
    public static final String SUCCESS = "admin.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError err = new ProductError();
        boolean checkValidation = true;
        ProductDAO dao = new ProductDAO();
        try {
            String proID = request.getParameter("proID");
            int catagory = Integer.parseInt(request.getParameter("catagory"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String img = request.getParameter("image");

            if (proID.length() > 10 || proID.length() < 1) {
                err.setProductID("Product ID 1 - 10 characters!!!!!!!");
                checkValidation = false;
            }
            if (catagory < 1 || catagory > 5) {
                err.setCatagoryID("Catagory can not less than 1 or more than 5");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(proID);
            if (checkDuplicate == true) {
                err.setProductID("Duplicate Product ID!!!!!");
                checkValidation = false;
            }
             
            if (price < 1) {
                err.setPrice("Price can not Negative number!!!!!!!");
                checkValidation = false;
            }
            
            if (quantity < 1) {
                err.setQuantity("Quantity can not Negative number and more than 0!");
                checkValidation = false;
            }
            
            if (checkValidation) {
                CatagoryDAO cataDao = new CatagoryDAO();
                CatagoryDTO cata = cataDao.getCataByID(catagory);
                ProductDTO pro = new ProductDTO(proID, cata, name, price, quantity, img);
                boolean checkInsert = dao.insert(pro);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    err.setError("ERROR!!!!!! Check CreateProController Again!!!!");
                }
            } else {
                request.setAttribute("PRO_ERROR", err);
            }
        } catch (Exception e) {
            log("Error at CreateProController : " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
