<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css" />
    <title> Login User</title>
    <style>
        input:focus,
        input::placeholder{
            color: #232323;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form id="loginForm" action="vote?page=loginUser" method="post" class="sign-in-form">
                    <h2 class="title">Login</h2>

<%--                display error message if username or password is incorrect--%>
                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("errorMessage") %></div>
                    <% } %>

                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="email" placeholder="Enter email"/>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Enter password" />
                        <span class="forgotpw"> <a href="vote?page=forgotpw"> Forgot password?</a> </span>
                    </div>
                    <input type="submit" value="Login" class="btn solid" >
                    <p class="register"> Don't have an account? <a href="vote?page=register"> Register </a> </p>
                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <img src="img/Logo.png" alt="logo" class="logo" width="120px">
                    <h3> Welcome back!</h3>
                    <p class="sub-text">
                        Please login to access your voting profile.
                    </p>
                </div>
                <img src="img/vote.png" class="image" alt="" />
            </div>
        </div>
    </div>

    <script src="app.js"></script>

</body>

</html>