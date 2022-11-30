/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TBL
 */
public class MainController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String LOGIN = "login";
    public static final String LOGIN_CONTROLLER = "LoginController";
    public static final String LOGOUT = "logout";
    public static final String LOGOUT_CONTROLLER = "LogoutController";
    public static final String SEARCH = "search";
    public static final String SEARCH_CONTROLLER = "SearchProController";
    public static final String UPDATE = "Update";
    public static final String UPDATE_CONTROLLER = "UpdateController";
    public static final String DELETE = "Delete";
    public static final String DELETE_CONTROLLER = "DeleteController";
    public static final String CREATE = "CreateProduct";
    public static final String CREATE_CONTROLLER = "CreateProController";
    public static final String ADD = "Add";
    public static final String ADD_CONTROLLER = "AddCartController";
    public static final String VIEWCART = "View";
    public static final String VIEWCART_CONTROLLER = "viewCart.jsp";
    public static final String REMOVE = "Remove";
    public static final String REMOVE_CONTROLLER = "RemoveController";
    public static final String EDIT = "Edit";
    public static final String EDIT_CONTROLLER = "EditController";
    public static final String VIEWPRO = "viewProduct";
    public static final String VIEWPRO_CONTROLLER = "ViewProController";
    public static final String CREATEUSER = "Register";
    public static final String CREATEUSER_CONTROLLER = "UserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            System.out.println(action);
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEWCART.equals(action)) {
                url = VIEWCART_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (VIEWPRO.equals(action)) {
                url = VIEWPRO_CONTROLLER;
            } else if (CREATEUSER.equals(action)) {
                url = CREATEUSER_CONTROLLER;
            } 
        } catch (Exception e) {
            log("Login fail at LoginController" + e.toString());
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
