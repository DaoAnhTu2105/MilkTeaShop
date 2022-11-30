/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CatagoryDAO;
import DAO.ProductDAO;
import DAO.UserDAO;
import DTO.CatagoryDTO;
import DTO.ProductDTO;
import DTO.ProductError;
import DTO.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TBL
 */
@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {

    public static final String ERROR = "SearchProController";
    public static final String SUCCESS = "SearchProController";

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

            if (catagory > 5 || catagory < 1) {
                err.setCatagoryID("Catagory 1 - 5 characters!!!!!");
                checkValidation = false;
            }
            if (price < 1) {
                err.setPrice("Price can not Negative number");
                checkValidation = false;
            }
            if (quantity < 1) {
                err.setQuantity("Quantity can not Negative number");
                checkValidation = false;
            }
            if (checkValidation) {
                CatagoryDAO cataDao = new CatagoryDAO();
                CatagoryDTO cata = cataDao.getCataByID(catagory);
                ProductDTO p = new ProductDTO(proID, cata, name, price, quantity, img);
                boolean checkUpdate = dao.update(p);
                url = SUCCESS;
            } else {
                request.setAttribute("PRO_ERROR", err);
            }
        } catch (Exception e) {
            log("Error at UpdateController : " + e.toString());
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
