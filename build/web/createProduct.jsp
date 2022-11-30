<%-- 
    Document   : createProduct
    Created on : Jul 5, 2022, 3:05:41 PM
    Author     : TBL
--%>

<%@page import="DTO.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% ProductError proError = (ProductError) request.getAttribute("PRO_ERROR");
            if (proError == null) {
                proError = new ProductError();
            }%>
        <h1>Input Product Infomation</h1>
        <form action="MainController?action=CreateProduct" method="POST" id="form">
            Product ID : <input type="text" name="proID" required="" /><%= proError.getProductID()%><br>
            Catagory ID : <input type="number" name="catagory" required="" min="1" max="5"/><%= proError.getCatagoryID()%><br>
            Name : <input type="text" name="name" value="" required=""/><%= proError.getName()%><br>
            Price : <input type="number" name="price" value="" required=""/><%= proError.getPrice()%><br>
            Quantity : <input type="number" name="quantity" value="" required=""/><%= proError.getQuantity()%><br>
            Images :  <input type="text" name="image" value="" required=""/><%= proError.getImage()%><br>
            <div class="g-recaptcha" data-sitekey="6Lde_ssgAAAAANoxjDYKMrGgkV147_q2bPmBYjXJ"></div>
            <div id="error" style="color: red"></div>
            <input type="submit" name="action" value="CreateProduct" onclick="return confirm('Are you sure to Create this Product ?')"/> || 
            <input type="reset" name="" value="Reset"/>

        </form>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                window.onload = function () {
                    let isValid = false;
                    const form = document.getElementById("form");
                    const error = document.getElementById("error");
                    form.addEventListener("submit", function (event) {
                        event.preventDefault();
                        const response = grecaptcha.getResponse();
                        console.log(response);
                        if (response) {
                            form.submit();
                        } else {
                            error.innerHTML = "Please check the recaptcha"
                        }
                    });
                }
        </script>

        <%= proError.getError()%>
    </body>
</html> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Create Product</title>
    </head>
    <body>
        <% ProductError proError = (ProductError) request.getAttribute("PRO_ERROR");
            if (proError == null) {
                proError = new ProductError();
            }%>
        <!--Navbar-->
        <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
            <div class="container">
                <form id="logoutForm" action="MainController">
                    <input type="hidden" name="action" value="logout">
                    <a id="logoutLink" class="navbar-brand" href="LogoutController">Logout</a>
                </form>
                <a id="" class="navbar-brand" href="admin.jsp">Back</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
        <h2 class="text-center">CREATE NEW PRODUCT</h2>
        <div style="text-align: center; color: red">
           <% if(proError.getProductID() != "") { %>
               <%= proError.getProductID()%><br>
          <% }%>
           <% if(proError.getCatagoryID() != "") { %>
               <%= proError.getCatagoryID()%><br>
          <% }%>
          <% if(proError.getError() != "") { %>
               <%= proError.getError()%><br>
          <% }%>
          <% if(proError.getName() != "") { %>
               <%= proError.getName()%><br>
          <% }%>
          <% if(proError.getPrice() != "") { %>
               <%= proError.getPrice()%><br>
          <% }%>
          <% if(proError.getQuantity() != "") { %>
               <%= proError.getQuantity()%><br>
          <% }%>
        </div>
        <div class="container d-flex justify-content-center">
            <div class="wrapper w-50 mt-5">
                <div class="wrapper-header">
                    <p style="text-align: center">NEW PRODUCT</p>
                </div>              
                <div class="wrapper-content">
                    <form action="MainController?action=CreateProduct" method="POST" id="form">
                        <div class="form-group">
                            <label>Product ID</label>
                            <input type="text" placeholder="Product ID" name="proID" required="" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Catagory ID</label>
                            <input type="number" placeholder="Catagory ID" name="catagory" required="" class="form-control" min="1" max="5">
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" placeholder="Name : Dao Anh Tu, ..." name="name" required="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" placeholder="Ex : 500000, 300000, 60000, ...." name="price" required="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="number" placeholder="Ex : 1,2,3,4,......" value="" min="1" step="1" required="" name="quantity" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="text" placeholder="" value="" min="1" step="1" required="" name="image" class="form-control">
                        </div>

                        <div class="mt-3">                            
                            <button value="CreateProduct" name="action" type="submit" class="btn btn-lg btn-dark w-100" onclick="return confirm('Are you sure to Create this Product ?')">Create</button>
                        </div>

                        <div class="mt-3">
                            <input class="btn btn-dark w-100" type="reset" name="" value="Reset"/>
                        </div>

                    </form>
                </div>
            </div>
        </div>


        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>