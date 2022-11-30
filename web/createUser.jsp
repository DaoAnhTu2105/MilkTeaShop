<%-- 
    Document   : createUser
    Created on : Jul 7, 2022, 6:05:06 PM
    Author     : TBL
--%>

<%@page import="DTO.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf8" />
        <link href="style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <title>Create User Page</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
            <div class="container">                    
                <form id="logoutForm" action="MainController">
                    <input type="hidden" name="action" value="logout">
                    <a id="logoutLink" class="navbar-brand" href="LogoutController">Logout</a>
                </form>
            </div>
        </nav>

        <% UserError uError = (UserError) request.getAttribute("USER_ERROR");
            String uRe = (String) request.getAttribute("SUCCESS_RE");
            if (uError == null) {
                uError = new UserError();
           }%>
               <h1 style="text-align: center">Input User Infomation</h1>
        <div style="text-align: center">
            <form action="MainController?action=Register" method="POST" id="form">
                User ID : <input type="text" name="userID" required="" /><br>            
                Role ID : <input type="number" name="roleID" value="2" readonly=""/><br>
                Name : <input type="text" name="name" value="" required=""/><br>           
                Phone : <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required="" placeholder="xxxxxxxxxx"><br>
                Address :  <input type="text" name="address" value="" required=""/><br>
                Email :  <input type="email" name="email" value="" required=""/><br>
                Password : <input type="password" name="pass" required=""/><br>
                Confirm :  <input type="password" name="confirm" required=""/>
                <div class="g-recaptcha" data-sitekey="6Lde_ssgAAAAANoxjDYKMrGgkV147_q2bPmBYjXJ" style="text-align: center"></div>
                <div id="error" style="color: red"></div>
                <input type="submit" name="action" value="Register" onclick="return confirm('Are you sure to Register this User ?')"/> || 
                <input type="reset" name="" value="Reset"/>
            </form>
        </div>
        <div style="text-align: center">
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
        </div>
                <div style="text-align: center; color: red">
           <% if(uError.getUserID()!= "") { %>
               <%= uError.getUserID()%><br>
          <% }%>
            <% if(uError.getRoleID()!= "") { %>
               <%= uError.getRoleID()%><br>
          <% }%>
           <% if(uError.getName()!= "") { %>
               <%= uError.getName()%><br>
          <% }%>
           <% if(uError.getPhone()!= "") { %>
               <%= uError.getPhone()%><br>
          <% }%>
          <% if(uError.getAddress()!= "") { %>
          <%= uError.getAddress()%><br>
          <% }%>
           <% if(uError.getEmail()!= "") { %>
               <%= uError.getEmail()%><br>
          <% }%>
           <% if(uError.getPassword()!= "") { %>
               <%= uError.getPassword()%><br>
          <% }%>
           <% if(uError.getConfirm()!= "") { %>
               <%= uError.getConfirm()%><br>
          <% }%>
        </div>

        <% if (uRe != null) { %>
        <h2><% out.print(uRe);%></h2>
        <%  }%>

        <%= uError.getError()%>

        
    </body>
</html>
