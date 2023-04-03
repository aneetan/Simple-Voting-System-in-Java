<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/27/2023
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />


    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/authorize.css" />


    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title> Forgot Password?</title>

</head>
<body style="background-image:linear-gradient(to bottom, rgba(245, 246, 252, 0.52), rgba(15, 71, 193, 0.73)),
    url('img/vote.jpg'); background-size: cover;">
  <div class="container" style="background-color: #fff;">
    <header>Forgot your Password?</header>
    <form action="vote?page=forgotPassword" method="post" id="authorizeForm" class="forgotpw-form">

      <span class="title forgot-title">Please enter the details to change your password.</span>
      <hr>

      <div class="pass-fields">

<%--          error message for invalidate--%>
          <% if (request.getAttribute("errorMessage") != null) { %>
          <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("errorMessage") %></div>
          <% } %>

        <div class="input-field forgot">
          <label>Citizenship Number</label> <br>
          <input id="idNum" name="idNo" type="tel" placeholder="Enter Citizenship number" required>
        </div>

        <div class="input-field forgot" style="width: 400px">
          <label>Issued District</label> <br>
          <input id="idDistrict" name="issuedDistrict" type="text" placeholder="Enter issued district" required>
        </div>

      </div>

      <input type="submit" value="Proceed" class="btnText">


    </form>
  </div>
</body>
</html>
