<%-- 
    Document   : user
    Created on : Jun 30, 2022, 8:44:32 PM
    Author     : TBL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <% UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            ArrayList<ProductDTO> pro = (ArrayList<ProductDTO>) request.getAttribute("lstPro");
            String error = (String) request.getAttribute("ERROR");
        %>
        <% if (user == null || user.getRoleID() != 2) {
                response.sendRedirect("login.jsp");
            }
        %>
        <%               if (error == null) {
                error = "";
            }
        %>
        <br>
        <%=error%>
        <% if (user != null) {%>
        <h1>User Information</h1>
        User ID :  <%= user.getUserID()%> <br>
        User Name :  <%= user.getName()%> <br>
        User Password <%= user.getPassword()%> <br>
        Role ID : <%= user.getRoleID()%> 
        <%  }%>
        <br>
        <a href="login.jsp" >Back</a>
        <br> <a href="LogoutController" >Logout</a>
        <br>
        <form action="MainController">
            <input name="action" type="submit" value="viewProduct" />
        </form>

    </body>
</html>
--%>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf8" />
        <link href="style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Admin Page</title>
    </head>
    <body>
        <% UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            ArrayList<ProductDTO> pro = (ArrayList<ProductDTO>) request.getAttribute("lstPro");
            String error = (String) request.getAttribute("ERROR");
        %>
        <% if (user == null || user.getRoleID() != 2) {
                response.sendRedirect("login.jsp");
            }
        %>
        <%               if (error == null) {
                error = "";
            }
        %>
        <!--Navbar-->
        <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
            <div class="container">                    
                <form id="logoutForm" action="MainController">
                    <input type="hidden" name="action" value="logout">
                    <a id="logoutLink" class="navbar-brand" href="LogoutController">Logout</a>
                </form>                
            </div>
        </nav>
        <h3 class="text-center">${CREATE_CAKE_MSG}</h3>
        <h3 class="text-center">${UPDATE_CAKE_MSG}</h3>
        <h3 class="text-center">${DELETE_MSG}</h3>
        <div class="container mt-5">
            <div style="text-align: center">
                <h3>Hello User :  - ${LOGIN_USER.name}</h3>
            </div>
            <div class="wrapper mt-2" style="text-align: center; margin: 20px">
                <div class="wrapper-content">
                    <%=error%>
                    <% if (user != null) {%>
                    <h1>User Information</h1>
                    User ID :  <%= user.getUserID()%> <br>
                    User Name :  <%= user.getName()%> <br>
                    Role ID : <%= user.getRoleID()%> 
                    <%  }%>
                    <br>
                    <form action="MainController">
                        <input name="action" type="submit" value="viewProduct" />
                    </form>
                </div>
            </div>
            
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
