<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />


  <link rel="stylesheet" href="css/profile.css">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <title>User Profile</title>
</head>
<body>
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
        <div class="card mb-3 content">
          <div class="content-head">
            <h1 class="m-3 pt-3"> About</h1>
          </div>
          <div class="card-body">
<%--            <div class="row">--%>
<%--              <div class="col-md-3">--%>
<%--                <h5> Full Name</h5>--%>
<%--              </div>--%>
<%--              <div class="col-md-9 text-secondary"> ${votingSystem.fullName} </div>--%>
<%--            </div>--%>
<%--            <hr>--%>
            <div class="row">
              <div class="col-md-3">
                <h5> Email</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.email} </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-3">
                <h5> DOB</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.dob}</div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-3">
                <h5> Address</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.address}</div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-3">
                <h5> Gender</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.gender} </div>
            </div>




          </div>
        </div>
        <div class="card mb-3 content">
          <div class="content-head">
            <h1 class=" m-3 pt-3"> Identity</h1>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-3">
                <h5> Citizenship Number</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.citizenNo} </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-3">
                <h5> Issued District</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.issueDistrict} </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-3">
                <h5> Issued Date</h5>
              </div>
              <div class="col-md-9 text-secondary"> ${votingSystem.issueDate}</div>
            </div>


          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
