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
    <link rel="stylesheet" href="css/authorize.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title> Edit user Details </title>
</head>
<body style="background: #fff">
    <%@ include file="essentials/nav.jsp"%>



    <div class="containerPro" style="background: none">
        <div class="row">
            <div class="col-md mt-1">
                <div class="card text-center sidebar">
                    <div class="card-body">
                        <img src="C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//userProfile//${votingSystem.userProfile}" alt="profile" width="150">
                        <div class="user-content">
                            <h3> ${votingSystem.fullName}</h3>
                            <p> User</p>
                            <hr>
                            <a href="vote?page=seeDetails" class="active"> See Details </a>
                            <hr>
                            <a href="vote?page=editUser&id=${votingSystem.id}"> Edit Details </a>
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
                    <div class="content-head">
                        <h1 class="m-3 pt-3"> Edit Details</h1>
                    </div>
                    <form action="vote?page=editUserDetails" id="authorizeForm" style="min-height: 435px;">
                        <div class="form first" style="margin-left: 20px;">
                            <div class="details personal">
                                <span class="title">Personal Details</span>

                                <div class="fields">
                                    <div class="input-field">
                                        <label> Email</label>
                                        <input id="email" type="email" placeholder="Enter email" required>
                                    </div>

                                    <div class="input-field">
                                        <label> DOB</label>
                                        <input id="date" type="date" placeholder="Enter dob" required>
                                    </div>


                                    <div class="input-field">
                                        <label> Full Name</label>
                                        <input id="name" type="text" placeholder="Enter full name" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Address</label>
                                        <input id="address" type="text" placeholder="Enter address" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Gender</label>
                                        <select required>
                                            <option disabled selected>Select gender</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                            <option>Others</option>
                                        </select>
                                    </div>

                                    <div class="input-field">
                                        <label>Citizenship Number</label>
                                        <input id="idNum" type="tel" placeholder="Enter Citizenship number" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Issued District</label>
                                        <input id="idDistrict" type="text" placeholder="Enter issued district" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Issued Date</label>
                                        <input id="idDate" type="date" placeholder="Enter your issued date" required>
                                    </div>

                                    <div class="input-field">
<%--                                        <input type="hidden" placeholder="Enter your issued date" required>--%>
                                    </div>
                                </div>
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
        const img = document.getElementById("profileUser");
        input = document.querySelector("input");

        input.addEventListener("change", () => {
            img.src = URL.createObjectURL(input.files[0]);
        })
    </script>
</body>
</html>
