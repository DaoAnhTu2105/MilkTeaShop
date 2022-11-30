<%-- 
    Document   : viewCart
    Created on : Jul 6, 2022, 2:14:46 PM
    Author     : TBL
--%>

<%@page import="Sample.Cart"%>
<%@page import="DTO.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center; color: red">Your Cart</h1>
        <% Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) { %>
        <div style="display: flex; justify-content: center">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Catagory ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Remove</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                        double total = 0;
                        for (ProductDTO pro : cart.getCart().values()) {
                            total += pro.getPrice() * pro.getQuantity();%>
                <form action="MainController">
                    <tr>
                        <th><%=count++%></th>
                        <th><input type="text" name="id" value="<%=pro.getProductID()%>" readonly=""/></th>
                        <th><%=pro.getCatagoryID().getCatagoryID()%></th>
                        <th><%=pro.getName()%></th>
                        <th><%=pro.getPrice()%></th>
                        <th>
                            <input type="number" name="quantity" value="<%= pro.getQuantity()%>" required="" min="1"/>
                        </th>
                        <th><%=pro.getPrice() * pro.getQuantity()%></th>
                        <th><input type="submit" name="action" value="Remove" /></th>
                        <th><input type="submit" name="action" value="Edit" /></th>
                    </tr>
                </form>

                <%  }%>
                </tbody>
            </table>
        </div>


        <h1  style="text-align: center; color: red">
            Total : <%= total%>
        </h1>
        <% }%>
        <div  style="text-align: center">
            <a href="ViewProController" >Add more</a>
        </div>
    </body>
</html>
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf8" />
        <link href="style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>View Cart Page</title>
    </head>
    <body>
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
            
                    <h1 style="text-align: center; color: red">Your Cart</h1>
        <% Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) { %>
        <div style="display: flex; justify-content: center">
            <table cellpadding="0" cellspacing="0" border="2" align="center" width="75%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Product ID</th>
                        <th>Catagory ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Remove</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <% int count = 1;
                        double total = 0;
                        for (ProductDTO pro : cart.getCart().values()) {
                            total += pro.getPrice() * pro.getQuantity();%>
                <form action="MainController">
                    <tr>
                        <th><%=count++%></th>
                        <th><input type="text" name="id" value="<%=pro.getProductID()%>" readonly=""/></th>
                        <th><%=pro.getCatagoryID().getCatagoryID()%></th>
                        <th><%=pro.getName()%></th>
                        <th><%=pro.getPrice()%></th>
                        <th>
                            <input type="number" name="quantity" value="<%= pro.getQuantity()%>" required="" min="1"/>
                        </th>
                        <th><%=pro.getPrice() * pro.getQuantity()%></th>
                        <th><input type="submit" name="action" value="Remove" /></th>
                        <th><input type="submit" name="action" value="Edit" /></th>
                    </tr>
                </form>

                <%  }%>
                </tbody>
            </table>
        </div>


        <h1  style="text-align: center; color: red">
            Total : <%= total%>
        </h1>
        <% }%>
        <div  style="text-align: center">
            <a href="ViewProController" >Add more</a>
        </div>
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>