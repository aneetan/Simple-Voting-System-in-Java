<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/25/2023
  Time: 10:42 PM
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

    <title> Authorize Form</title>
</head>

<body style="background-image:linear-gradient(to bottom, rgba(245, 246, 252, 0.52), rgba(15, 71, 193, 0.73)),
    url('img/vote.jpg'); background-size: cover;">
<div class="container" style="background-color: #fff;">
    <header>Enter Details for verification</header>
    <p style="color: #707070"> By submitting this form you agree to the <a style="text-decoration: none;" href="vote?page=terms"> Terms and Conditions.</a></p>

    <form action="vote?page=authorizeUser"  method="post" id="authorizeForm">
        <input type="hidden" name="newEmail" value="${votingSystem.email}">
        <input type="hidden" name="newDob" value="${votingSystem.dob}">
        <input type="hidden" name="newPassword" value="${votingSystem.password}">

        <div class="form first">
            <div class="details personal">
                <span class="title">Personal Details</span>

                <div class="fields">
                    <div class="input-field">
                        <label> Full Name</label>
                        <input id="name" name="fullName" type="text" placeholder="Enter full name" required>
                    </div>

                    <div class="input-field">
                        <label>Address</label>
                        <input id="address" name="address" type="text" placeholder="Enter address">
                    </div>

                    <div class="input-field">
                        <label>Gender</label>
                        <select name="gender" required>
                            <option disabled selected>Select gender</option>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Others</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="details ID">
                <span class="title">Identity Details</span>

                <div class="fields">

                    <div class="input-field">
                        <label>Citizenship Number</label>
                        <input id="idNum" name="citizenNo" type="tel" placeholder="Enter Citizenship number" required>
                    </div>

                    <div class="input-field">
                        <label>Issued District</label>
                        <input id="idDistrict" name="issueDistrict" type="text" placeholder="Enter issued district" required>
                    </div>

                    <div class="input-field">
                        <label>Issued Date</label>
                        <input id="idDate" type="date" name="issueDate" placeholder="Enter your issued date" required>
                    </div>

                </div>

                <input type="submit" name="authorizeSubmit" value="Submit" class="btnText">


            </div>
        </div>
    </form>
</div>
</body>
</html>
