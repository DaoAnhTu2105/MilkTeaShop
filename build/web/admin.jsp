<%-- 
    Document   : admin
    Created on : Jun 30, 2022, 8:45:18 PM
    Author     : TBL
--%>

<%@page import="DTO.ProductError"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
<alert>
<% if (proError != null) {
        out.println(proError.getCatagoryID());
    } %> 
</alert>
<br>
<alert>
<% if (proError != null) {
        out.println(proError.getPrice());
    } %> 
</alert>
<br>
<alert>
<% if (proError != null) {
        out.println(proError.getQuantity());
    } %> 
</alert>
<% if (pro != null && pro.size() > 0) { %>
<table border="1">
    <thead>
        <tr>
            <th>No</th>
            <th>Product ID</th>
            <th>Catagory ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Image</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
    </thead>
    <tbody>
<% int count = 1;
    for (ProductDTO p : pro) {%>
<form action="MainController">
<tr>
    <th> <%=count++%></th>
    <th> <%= p.getProductID()%></th>
    <th> 
        <input type="number" name="catagory" value="<%= p.getCatagoryID().getCatagoryID()%>" required="" min="1" max="5"/>         
    </th>
    <th> 
        <input type="text" name="name" value="<%=p.getName()%>" required=""/>       
    </th>
    <th>
        <input type="text" name="price" value="<%=p.getPrice()%>" required=""/>
    </th>
    <th> 
        <input type="number" name="quantity" value="<%=p.getQuantity()%>" required=""/>
    </th>
    <th> 
        <input type="text" name="image" value="<%=p.getImage()%>" required=""/>
    </th>
    <th>
        <a href="MainController?action=Delete&proID=<%= p.getProductID()%>&search=<%=search%>" onclick="return confirm('Are you sure to Delete this Product?')">Delete</a>
    </th>
    <th>
        <input type="hidden" name="search" value="<%= search%>">
        <input type="hidden" name="proID" value="<%= p.getProductID()%>">
        <input type="submit" name="action" value="Update" />
    </th>
</tr> 
</form>
<% }%>
</tbody>
</table>
<% }%>
<% if (err != null) {
        out.print(err);
    }%>
<a href="admin.jsp" >Back</a> || <a href="MainController?action=logout">Logout</a> || <a href="createProduct.jsp">Add new Product</a>
</body>
</html>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf8" />
        <link href="style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Admin Page</title>
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
        <% UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

            String error = (String) request.getAttribute("ERROR");
        %>
        <% if (user == null || user.getRoleID() != 1) {
                response.sendRedirect("login.jsp");
            }
        %>
        <%               if (error == null) {
                error = "";
            }
        %>
        <% ArrayList<ProductDTO> pro = (ArrayList<ProductDTO>) request.getAttribute("SEARCH");
            String search = (String) request.getAttribute("s");
            String err = (String) request.getAttribute("ERROR");
            ProductError proError = (ProductError) request.getAttribute("PRO_ERROR");
            if (proError == null) {
                proError = new ProductError();
            }
        %> 
        <!--Navbar-->
        <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
            <div class="container">                    
                <form id="logoutForm" action="MainController">
                    <input type="hidden" name="action" value="logout">
                    <a id="logoutLink" class="navbar-brand" href="LogoutController">Logout</a>
                </form>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="MainController">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="createProduct.jsp">New Drink</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <h3 class="text-center">${CREATE_CAKE_MSG}</h3>
        <h3 class="text-center">${UPDATE_CAKE_MSG}</h3>
        <h3 class="text-center">${DELETE_MSG}</h3>
        <div class="container mt-5">
            <div>
                <h3>Hello Admin :  - ${LOGIN_USER.name}</h3>
            </div>
            <div class="wrapper mt-2">
                <div class="wrapper-content">
                    <form action="MainController" method="POST">
                        <div class="row">
                            <div class="col-8">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="search" value="<% if (search != null) {
                                            out.print(search);
                                        }%>" placeholder="Search">
                                </div>
                            </div>
                            <div class="col-4 d-flex align-items-end">
                                <div class="w-100">
                                    <button class="btn btn-dark w-100" name="action" value="search">Search</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
            <div style="color: red; text-align: center">
                <alert>
                    <% if (proError != null) {
                            out.println(proError.getCatagoryID());
                        } %> 
                </alert>
            </div>

            <br>
            <div style="color: red; text-align: center">
                <alert>
                    <% if (proError != null) {
                            out.println(proError.getPrice());
                        } %> 
                </alert>
            </div>           
            <br>
            <div style="color: red; text-align: center">
                <alert>
                    <% if (proError != null) {
                            out.println(proError.getQuantity());
                        } %> 
                </alert>
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
                        <th>Quantity</th>
                        <th>Image URL</th>
                        <th>Image</th>                        
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                        for (ProductDTO p : pro) {%>
                <form action="MainController">
                    <tr>
                        <th> <%=count++%></th>
                        <th> <%= p.getProductID()%></th>
                        <th> 
                            <input type="number" name="catagory" value="<%= p.getCatagoryID().getCatagoryID()%>" required="" min="1" max="5"/>         
                        </th>
                        <th> 
                            <input type="text" name="name" value="<%=p.getName()%>" required=""/>       
                        </th>
                        <th>
                            <input type="text" name="price" value="<%=p.getPrice()%>" required=""/>
                        </th>
                        <th> 
                            <input type="number" name="quantity" value="<%=p.getQuantity()%>" required=""/>
                        </th>
                        <th> 
                            <input type="text" name="image" value="<%=p.getImage()%>" required=""/>
                        </th>
                        <th> 
                            <img style="width: 250px; height: 200px" class="card-img-top img-responsive" src="./img/<%=p.getImage()%>" alt="..." />
                        </th>
                        <th>
                            <a href="MainController?action=Delete&proID=<%= p.getProductID()%>&search=<%=search%>" onclick="return confirm('Are you sure to Delete this Product?')">Delete</a>                           
                        </th>
                        <th>
                            <input type="hidden" name="search" value="<%= search%>">
                            <input type="hidden" name="proID" value="<%= p.getProductID()%>">
                            <input type="submit" name="action" value="Update" />
                        </th>
                    </tr> 
                </form>
                <% }%>
                </tbody>
            </table>
            <% }%>
            <% if (err != null) {
                    out.print(err);
                }%>
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>