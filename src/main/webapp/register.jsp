<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/16/2023
  Time: 10:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/style.css" />
    <title> Register User</title>
    <style>
        .input-field input#DOB{
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form action="vote?page=registerUser" method="post" class="sign-in-form" id="form">
                    <h2 class="title" id="text">Sign up</h2>

                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="text" name="email" placeholder="Enter email" id="email">
                        <div class="error"></div>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-calendar"></i>
                        <input type="text" name="dob" placeholder="Enter date of birth" id="DOB" onfocus="(this.type='date')" onblur="if(!this.value) this.type='text'">
                        <div class="error"></div>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Enter password" id="password">
                        <div class="error"></div>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Confirm password" id="confirmPassword">
                        <div class="error"></div>
                    </div>
                    <input type="submit" name="registerSubmit" class="btn solid" value="Register">
                    <p class="register"> Already have an account? <a href="vote?page=login"> Login </a> </p>
                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel right-panel">
                <div class="content">
                    <img src="img/Logo.png" alt="logo" class="logo" width="120px">

                    <h3> Your vote matters!</h3>
                    <p class="sub-text">
                        Sign up now to stay informed about upcoming elections
                        and make a difference in your community.
                    </p>

                </div>
                <img src="img/register.png" class="image" alt="" />
            </div>
        </div>
    </div>

<script src="app.js"></script>

</body>
</html>
