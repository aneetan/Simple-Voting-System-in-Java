<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/8/2023
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/authorize.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title> Edit user Details </title>
    <style>
        body{
            display: block;
        }
        .title{
            font-weight: 500;
            font-size: 20px;
        }
        hr{
            width: 100%;
        }
        label{
            margin-right: 8px;
        }

    </style>

</head>
<body style="background: #fff">
<%@ include file="essentials/nav.jsp"%>

<div class="containerPro" style="background: none; margin: 100px 20px 0 50px;">
    <div class="row">
        <div class="col-md mt-1">
            <div class="card text-center sidebar">
                <div class="card-body">
                    <img src="userProfile//${votingSystem.userProfile}" alt="profile" width="150">
                    <div class="user-content">
                        <h3> ${votingSystem.fullName}</h3>
                        <p> User</p>
                        <hr>
                        <a href="vote?page=seeDetails" > See Details </a>
                        <hr>
                        <a href="vote?page=editUser&id=${votingSystem.id}"> Edit Details </a>
                        <hr>
                        <a href="vote?page=changePw&id=${votingSystem.id}" class="active"> Change Password </a>
                        <hr>
                        <a href="vote?page=logoutUser&id=${votingSystem.id}"> Log Out </a>
                        <hr>


                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8 mt-1">
            <%--                <div class="card mb-3 content">--%>

            <form action="vote?page=oldPwForm" method="post" id="oldPwForm" style="min-height: 435px;">
                <div class="form first" style="margin-left: 20px;">
                    <span class="title">Edit Details</span>
                    <input type="hidden" name="id" value="${votingSystem.id}">

                    <%--          error message for invalidate--%>
                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("errorMessage") %></div>
                    <% } %>


                    <div class="input-field">
                        <label> Enter current password</label> <br>
                        <input id="password" name="oldPassword" type="password" placeholder="Password" required>
                    </div>

                    <input type="submit" value="Proceed" class="btnText">

                </div>
            </form>
        </div>

    </div>
</div>
</div>

</body>
</html>
