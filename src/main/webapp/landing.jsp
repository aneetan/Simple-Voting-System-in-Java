<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/16/2023
  Time: 11:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Local css linkage -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/electionCard.css">

    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />

    <!-- Boxicon link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Title</title>
</head>
<body>
    <%@ include file="essentials/nav.jsp"%>
    <div class="election-content" style="margin: 10px 20px 0 50px" >
        <h2>Your <span style="color: #0080ff"> Vote,</span>
            Your <span> Voice</span> </h2>
        <p style="color: #707070"> Please secure your valid vote by reading rules of this election.</p>
    </div>
    <div class="election-card" style="margin: 10px 20px 0 50px" >
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach items="${electionList}" var="election">

            <div class="col">
                <div class="card">
                    <img src="uploadimage//${election.imageFileName}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${election.electionName}</h5>
                        <p class="card-text"> ${election.candidacy} </p>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"> <i class='bx bx-calendar-alt'></i> ${election.electionDate}</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">See Details</a>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>
    </div>
</body>
</html>
