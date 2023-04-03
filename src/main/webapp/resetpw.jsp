<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/27/2023
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/authorize.css" />

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title> Reset pw </title>
</head>
<body style="background-image:linear-gradient(to bottom, rgba(245, 246, 252, 0.52), rgba(15, 71, 193, 0.73)),
    url('img/vote.jpg'); background-size: cover;">
    <div class="container" style="background-color: #fff; width: 450px">
      <header> Reset your Password</header>
      <form action="vote?page=newpw" method="post" id="resetPwForm" class="forgotpw-form">

        <span class="title forgot-title">Please enter the details to reset your password.</span>
        <hr>

        <div class="pass-fields">

          <div class="input-field forgot">
            <label> New Password</label> <br>
            <input id="resetpw" name="resetPassword" type="password" placeholder="Enter new password">
            <div class="error"></div>
          </div>

          <div class="input-field forgot" style="width: 400px">
            <label>Confirm Password</label> <br>
            <input id="confirm-resetpw" name="confirmResetPw" type="password" placeholder="Re-enter your password">
            <div class="error"></div>
          </div>
        </div>

        <input type="submit" value="Confirm" class="btnText">

      </form>
    </div>

    <script src="resetpw.js"> </script>

</body>
</html>
