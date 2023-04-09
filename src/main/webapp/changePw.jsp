<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/8/2023
  Time: 6:10 PM
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

<div class="containerPro" style="background: none">
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

            <form action="vote?page=changePwForm" method="post" id="changePwForm" style="min-height: 435px;">
                <div class="form first" style="margin-left: 20px;">
                    <span class="title">Edit Details</span>
                    <input type="hidden" name="id" value="${votingSystem.id}">

                    <div class="input-field">
                        <label> New password</label>
                        <input id="newPassword" name="newPassword" type="password" placeholder="Enter new password" required>
                    </div>

                    <div class="input-field">
                        <label> Confirm password</label>
                        <input id="confirmPassword" name="confirmPassword" type="password" placeholder="Confirm password" required>
                    </div>

                    <input type="submit" value="Update" class="btnText">

                </div>
            </form>
        </div>

    </div>
</div>
</div>

<script>
    // -------------- Reset pw form validation -------------------------------------------------------
    const resetForm = document.getElementById("changePwForm");
    const resetPassword = document.getElementById("newPassword");
    const resetconfirmpw = document.getElementById("confirmPassword");

    resetForm.addEventListener('submit', function(e){
        e.preventDefault();

        if (validateResetInputs()) {
            this.submit();
        }
    });

    //error message
    const setError =(element, message) => {
        const inputControl = element.parentElement;
        const errorDisplay = inputControl.querySelector('.error');

        errorDisplay.innerText = message;
        inputControl.classList.add('error');
        inputControl.classList.remove('success');
    }

    //success message
    const setSuccess = element => {
        const inputControl = element.parentElement;
        const errorDisplay = inputControl.querySelector('.error');

        errorDisplay.innerText = '';
        inputControl.classList.add('success');
        inputControl.classList.remove('error');
    }

    const isValidPassword = password => {
        const pw =  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
        return pw.test(String(password).toLowerCase());
    }

    const validateResetInputs = () => {
        const resetpasswordValue = resetPassword.value.trim();
        const resetconfirmpwValue = resetconfirmpw.value.trim();
        let isValid = true;

        //check password validation
        if(resetpasswordValue === ''){
            setError(resetPassword, 'Password is required');
            isValid=false;
        } else if(resetpasswordValue.length < 7){
            setError(resetPassword,'Password must be 7 characters');
            isValid=false;
        }else if (!isValidPassword(resetpasswordValue)){
            setError(resetPassword,'Please insert strong password');
            isValid=false;
        }  else {
            setSuccess(resetPassword);
        }

        //check for matching password
        if(resetconfirmpwValue === ''){
            setError(resetconfirmpw, 'Please confirm your password');
            isValid=false;
        } else if(resetconfirmpwValue !== resetpasswordValue){
            setError(resetconfirmpw, "Password doesn't match");
            isValid=false;
        } else {
            setSuccess(resetconfirmpw);
        }
        return isValid;
    }
</script>
</body>
</html>
