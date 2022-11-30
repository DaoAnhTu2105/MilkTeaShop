<%-- 
    Document   : login
    Created on : Jun 30, 2022, 8:18:39 PM
    Author     : TBL
--%>

<%@page import="DTO.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Login page</title>
    </head>
    <body>
    <c:if test="${not empty ROLE}">
        <c:redirect url="index.jsp"/>
    </c:if>

    <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <!--                            <a class="nav-link" href="MainController">Home</a>-->
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <h2 class="page-title text-center mt-5 bold">Dao Anh Tu Milk Tea Shop</h2>
        <h3 class="text-center text-danger">${ERROR}</h3>
        <div class="wrapper w-50 m-auto mt-5">
            <div class="wrapper-header">
                <h2>Login</h2>
            </div>
            <div class="wrapper-content">
                <form action="MainController" method="POST">
                    <div class="form-group">
                        <label>User ID</label>
                        <input type="text" class="form-control" name="userID" placeholder="UserID" required="">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="pass" placeholder="Password" required="">
                    </div>

                    <div class="row mt-3">
                        <div class="col-3">
                            <button value="login" name="action" type="submit" class="btn btn-lg btn-dark w-100">Login</button>
                        </div>
                        <div class="col-3">
                            <a class="btn w-100 btn-lg btn-outline-dark" href="createUser.jsp">Register</a>
                            </a>
                        </div>
                        <div class="col-6">
                            <a class="btn w-100 btn-lg btn-outline-dark" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/Assignment_PRJ301_DaoAnhTu/login-google&response_type=code
                               &client_id=253684895751-ma1ebjh01la1l1vsbagko5bqng4d7vqu.apps.googleusercontent.com&approval_prompt=force">
                                Login With Google
                            </a>
                        </div>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
