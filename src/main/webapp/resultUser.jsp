<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="css/result.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <title> Result User </title>
</head>
<body>
  <%@ include file="essentials/nav.jsp"%>

  <div class="containerP" style="margin: 100px 20px 0 50px">
  <c:forEach items="${candidateList}" var="candidate">

  <p style="font-weight: 600; font-size: 24px"> ${candidate.fullNameCandidate}</p>
      <div class="progress">
        <div class="progress-bar" role="progressbar" style="width: ${Math.round(candidate.votes/totalVoters*100)}%" aria-valuenow="${Math.round((candidate.votes/totalVoters)*100)}" aria-valuemin="0" aria-valuemax="100">
            ${Math.round((candidate.votes/totalVoters)*100)}%
        </div>
      </div>
  </c:forEach>
  </div>
</body>
</html>
