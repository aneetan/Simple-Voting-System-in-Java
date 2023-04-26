<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 12:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="css/result.css" />
    <title> Result</title>
</head>
<body>
    <%@ include file="essentials/sidebar.jsp"%>

    <section id="content">

        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Recent result</h1>
                </div>
            </div>

            <div class="container">
                <c:forEach items="${candidateList}" var="candidate">

                    <p> ${candidate.fullNameCandidate}</p>
                    <div class="progress" style="margin-right: 40px">
                        <div class="progress-bar" role="progressbar" style="width: ${Math.round(candidate.votes/totalVoters*100)}%" aria-valuenow="${Math.round(candidate.votes/totalVoters*100)}" aria-valuemin="0" aria-valuemax="100">${candidate.votes/totalVoters*100}%</div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </section>
</body>
</html>
