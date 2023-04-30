<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/6/2023
  Time: 10:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />


  <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="css/admin.css" />
    <title> Edit Election </title>
</head>
<body>
    <%@ include file="essentials/sidebar.jsp"%>

    <section id="content">
        <nav>
            <i class='bx bx-menu' ></i>
        </nav>

      <main>
        <div class="head-title">
          <div class="left">
            <h1>Edit election</h1>
          </div>
        </div>

        <div class="wrapper">
          <div class="title">
            Please fill the Details
          </div>
          <form action="vote?page=editElectionDetails" method="post" enctype="multipart/form-data">
              <input type="hidden" name="EId" value="${election.EId}">

              <p class="photo">Select cover photo</p>
            <div class="inputfield">
              <img src="uploadimage//${election.imageFileName}" id="profile" alt="Choose photo"> <br>
              <input type="file" class="img-file" name="profile" id="electionProfile" value="${election.imageFileName}">
            </div>

            <div class="inputfield">
              <label>Election Title</label>
              <input type="text" name="electionTitle" class="input"  value="${election.electionName}" required>
            </div>

            <div class="inputfield">
              <label>Short Description</label>
                <input type="text" name="candidacy" class="input" value="${election.candidacy}" required>

            </div>

            <div class="inputfield">
              <label>Select Date</label>
              <input type="date" class="input" name="electionDate" value="${election.electionDate}" required>
            </div>
            <div class="inputfield">
              <input type="submit" value="Edit Election" class="btn">
            </div>
          </form>
        </div>

        <div class="form">

        </div>
      </main>
    </section>


    <script>
      //changing the image to file option
      document.addEventListener('DOMContentLoaded', function() {
          const img = document.getElementById("profile");
          const input = document.getElementById("electionProfile");


          input.addEventListener("change", () => {
              img.src = URL.createObjectURL(input.files[0]);
          })
      });

    </script>
</body>
</html>
