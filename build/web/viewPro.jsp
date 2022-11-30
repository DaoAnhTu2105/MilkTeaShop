<%-- 
    Document   : viewPro
    Created on : Jul 6, 2022, 7:22:43 PM
    Author     : TBL
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<ProductDTO> pro = (ArrayList<ProductDTO>) request.getAttribute("lstPro");
            String error = (String) request.getAttribute("ERROR");
        %>
        <% if (pro != null && pro.size() > 0) { %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Catagory ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Cart</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                    for (ProductDTO p : pro) {%>
            <form action="MainController">
                <tr>
                    <th> <%=count++%></th>
                    <th> <input type="text" name="id" value="<%= p.getProductID()%>" readonly=""/> </th>
                    <th> 
                        <input type="text" name="catagory" value="<%= p.getCatagoryID().getCatagoryID()%>" readonly=""/>         
                    </th>
                    <th> 
                        <input type="text" name="name" value="<%=p.getName()%>" readonly=""/>       
                    </th>
                    <th>
                        <input type="text" name="price" value="<%=p.getPrice()%>" readonly=""/>
                    </th>
                   
                    <th> 
                        <input type="text" name="image" value="<%=p.getImage()%>" readonly=""/>
                    </th>
                    <th><input name="action" type="submit" value="Add"/></th>
                    <th>
                        <select name="cmbQuantity">
                            <option value="1">1 Cup</option>
                            <option value="2">2 Cup</option>
                            <option value="3">3 Cup</option>
                            <option value="4">4 Cup</option>
                            <option value="5">5 Cup</option>
                            <option value="6">6 Cup</option>
                            <option value="7">7 Cup</option>
                        </select>
                    </th>
                </tr> 

            </form>
            <% }%>
        </tbody>
    </table>
    <% }%>
    <a href="viewCart.jsp"> View Cart</a>
</body>
</html> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf8" />
        <link href="style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Add Cart Page</title>
        <style>
            .img-responsive {
                max-width: 100%;
                width: 100%;

            }
            .card-img-top {
                border-top-left-radius: calc(0.25rem - 1px);
                border-top-right-radius: calc(0.25rem - 1px);
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<ProductDTO> pro = (ArrayList<ProductDTO>) request.getAttribute("lstPro");
            String error = (String) request.getAttribute("ERROR");
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
            <div>
                <h3 style="text-align: center">Hello User :  - ${LOGIN_USER.name}</h3>
            </div>
            <div class="wrapper mt-2">
                <div class="wrapper-content">

                </div>
            </div>
            <% if (pro != null && pro.size() > 0) { %>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Catagory ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Cart</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                    for (ProductDTO p : pro) {%>
                <form action="MainController">
                    <tr>
                        <th> <%=count++%></th>
                        <th> <input type="text" name="id" value="<%= p.getProductID()%>" readonly=""/> </th>
                        <th> 
                            <input type="text" name="catagory" value="<%= p.getCatagoryID().getCatagoryID()%>" readonly=""/>         
                        </th>
                        <th> 
                            <input type="text" name="name" value="<%=p.getName()%>" readonly=""/>       
                        </th>
                        <th>
                            <input type="text" name="price" value="<%=p.getPrice()%>" readonly=""/>
                        </th>

                        <th> 
                            <img style="width: 250px; height: 200px" class="card-img-top img-responsive" src="./img/<%=p.getImage()%>" alt="..." />
                        </th>

                        <th><input name="action" type="submit" value="Add"/></th>
                        <th>
                            <select name="cmbQuantity">
                                <option value="1">1 Cup</option>
                                <option value="2">2 Cup</option>
                                <option value="3">3 Cup</option>
                                <option value="4">4 Cup</option>
                                <option value="5">5 Cup</option>
                                <option value="6">6 Cup</option>
                                <option value="7">7 Cup</option>
                            </select>
                        </th>
                    </tr> 

                </form>
                <% }%>
                </tbody>
            </table>
            <% }%>
            <div style="text-align: center">
                <a href="viewCart.jsp"> View Cart</a>
            </div>

            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>