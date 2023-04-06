<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/candidateCard.css">
    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />


    <!-- Boxicon link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Candidates</title>
</head>
<body>
<%@ include file="essentials/nav.jsp"%>

    <div class="profile-area">
      <div class="containerCard" style="margin: 8px 20px 0 50px">
        <div class="row">
          <div class="col-md-4">

              <c:forEach items="${candidateList}" var="candidate">

              <div class="card">
              <div class="img1"></div>
              <div class="img2"> <img src="candidateProfile//${candidate.candidateProfile}" alt=""></div>
              <div class="main-text">
                <h2> ${candidate.fullNameCandidate}</h2>
                <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, asperiores!</p>
              </div>
              <a href="vote?page=seeCandidateDetails&canId=${candidate.canId}"> See more </a>
              <button class="btn-vote" id="votebtn">Vote Now</button>
              <hr>

              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
              </div>

            </div>
              </c:forEach>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>
      const voteBtn = document.getElementById('votebtn');

      voteBtn.addEventListener('click', function() {
        voteBtn.textContent = 'Voted';
        voteBtn.style.backgroundColor = '#add8e6';
        voteBtn.ariaDisabled = true;
      });

    </script>
</body>
</html>
