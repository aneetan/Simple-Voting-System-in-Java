<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/6/2023
  Time: 1:35 PM
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

    <div class="containerPro" style="background: none; margin: 100px 20px 0 50px">
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
                            <a href="vote?page=editUser&id=${votingSystem.id}" class="active"> Edit Details </a>
                            <hr>
                            <a href="vote?page=changePw&id=${votingSystem.id}"> Change Password </a>
                            <hr>
                            <a href="vote?page=logoutUser&id=${votingSystem.id}"> Log Out </a>
                            <hr>


                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8 mt-1">
<%--                <div class="card mb-3 content">--%>

                    <form action="vote?page=editUserDetails" method="post" id="authorizeForm" style="min-height: 435px;" enctype="multipart/form-data">
                        <div class="form first" style="margin-left: 20px;">
                                <span class="title">Edit Details</span>
                                <input type="hidden" name="id" value="${votingSystem.id}">

                                <div class="photo-upload">
                                        <img src="userProfile//${votingSystem.userProfile}" alt="Choose photo" style="height: 60px; width: 60px; border-radius: 50%"> <br>
                                        <input type="file" id="image" class="img-file" name="userPro">
                                    </div>

                                    <div class="input-field">
                                        <label> Email</label>
                                        <input id="email" name="newEmail" type="email" value="${votingSystem.email}" required>
                                    </div>

                                    <div class="input-field">
                                        <label> DOB</label>
                                        <input id="date" name="newDob" type="date" value="${votingSystem.dob}" required>

                                    </div>

                                    <div class="input-field">
                                        <label> Full Name</label>
                                        <input id="name" type="text" name="fullName" value="${votingSystem.fullName}" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Address</label>
                                        <input id="address" type="text" name="address" value="${votingSystem.address}" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Gender</label>
                                        <select required value="${votingSystem.gender}" name="gender">
                                            <option disabled selected>Select gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="others">Others</option>
                                        </select>
                                    </div>

                                    <div class="input-field">
                                        <label>Citizenship Number</label>
                                        <input id="idNum" type="tel" name="citizenNo" value="${votingSystem.citizenNo}" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Issued District</label>
                                        <input id="idDistrict" type="text" name="issueDistrict" value="${votingSystem.issueDistrict}" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Issued Date</label>
                                        <input id="idDate" type="date" name="issueDate" value="${votingSystem.issueDate}" required>
                                    </div>

                            <input type="submit" value="Submit" class="btnText">

                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <script>
        //changing the image to file option
        const img = document.getElementById("image");
        input = document.querySelector("input");

        input.addEventListener("change", () => {
            img.src = URL.createObjectURL(input.files[0]);
        })
    </script>
</body>
</html>
