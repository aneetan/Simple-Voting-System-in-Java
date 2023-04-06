<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Boxicons -->
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />

  <link rel="stylesheet" href="css/admin.css" />

  <title> See Candidate</title>
</head>
<body>
  <%@ include file="essentials/sidebar.jsp"%>

  <section id="content">

    <main>
      <div class="head-title">
        <div class="left">
          <h1>Candidate List</h1>
        </div>
      </div>

      <div class="table-data list-data">
        <div class="order user-list">
          <div class="head">
            <h3>List of Candidates</h3>
<%--            <i class='bx bx-plus' ></i>--%>
          </div>
          <table>
            <thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Age</th>
              <th>Address</th>
              <th>Gender</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${candidateList}" var="candidate">

            <tr>
              <td>
                <img src="candidateProfile//${candidate.candidateProfile}">
              ${candidate.fullNameCandidate}
              </td>
              <td>${candidate.emailCandidate}</td>
              <td> ${candidate.ageCandidate}</td>
              <td> ${candidate.addressCandidate}</td>
              <td> ${candidate.genderCandidate}</td>

              <td> <a href="vote?page=candidateDetailsAdmin&canId=${candidate.canId}"> See details</a> </td>

            </tr>
            </c:forEach>

            </tbody>
          </table>
        </div>
      </div>
    </main>
  </section>


  <script src="admin.js"></script>
</body>
</html>

