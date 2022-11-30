/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.UserDAO;
import DTO.UserDTO;
import DTO.UserError;
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
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    public static final String ERROR = "createUser.jsp";
    public static final String SUCCESS = "login.jsp";

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
        UserError err = new UserError();
        boolean checkValidation = true;
        UserDAO dao = new UserDAO();
        try {
            String id = request.getParameter("userID");
            int role = Integer.parseInt(request.getParameter("roleID"));
            String name = request.getParameter("name");
            int phone = Integer.parseInt(request.getParameter("phone"));
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String confirm = request.getParameter("confirm");
            System.out.println(name);
            if (id.length() > 10 || id.length() < 2) {
                err.setUserID("User ID 2 - 10 characters!!!!!");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(id);
            if (checkDuplicate == true) {
                err.setUserID("Duplicate userID!!!!!");
                checkValidation = false;
            }
            if (name.length() > 50 || name.length() < 5) {
                err.setName("Full Name 6 - 50 characters!!!!!!!");
                checkValidation = false;
            }
            if (!name.matches("[A-Za-z]*")) {
                err.setName("Name can not Number!");
                checkValidation = false;
            }
            if (address.length() > 50 || address.length() < 10) {
                err.setAddress("Address 10 - 50 characters!!!!!!!");
                checkValidation = false;
            }
            if (email.length() > 50 || email.length() < 10) {
                err.setEmail("Email 10 - 50 characters!!!!!!!!");
                checkValidation = false;
            }
            if (pass.length() > 50 || pass.length() < 1) {
                err.setPassword("Password 1 - 50 charaters!!!!!!!!!");
                checkValidation = false;
            }
            if (!confirm.equals(pass)) {
                err.setConfirm("Error password, Please try again !!!!!");
                checkValidation = false;
            }
            if (checkValidation) {
                UserDTO user = new UserDTO(id, pass, role, name, phone, address, email);
                boolean checkInsert = dao.insert(user);
                if (checkInsert) {
                    request.setAttribute("USER", user);
                    request.setAttribute("SUCCESS_RE", "You have Register Successful!!!!");
                    url = SUCCESS;
                } else {
                    err.setError("ERROR!!!!!! Check UserController Again!!!!");
                }
            } else {
                request.setAttribute("USER_ERROR", err);
            }

        } catch (Exception e) {
            log("Error at UserController : " + e.toString());
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
