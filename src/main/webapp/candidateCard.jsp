<%@ page import="Model.Candidate" %>
<%@ page import="java.util.List" %>
<%@ page import="VotingService.VotingService" %><%--
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
    <style>
        .error{
            margin-left: 20px;
            font-size: 28px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<%@ include file="essentials/nav.jsp"%>

<%--<% if (request.getAttribute("errorMessage") != null) { %>--%>
<%--&lt;%&ndash;<div class="error" style="color: #ff3860; margin-top: 98px; font-size: 18px; font-weight:400;" id="error-message"><%= request.getAttribute("errorMessage") %></div>&ndash;%&gt;--%>
<%--<script>--%>
<%--    // Show an alert popup when the error message is displayed--%>
<%--    alert("<%= request.getAttribute("errorMessage") %>");--%>
<%--</script>--%>
<%--<% } %>--%>

    <div class="profile-area" style="margin: 8px 20px 0 10px; padding-top: 85px">
      <div class="containerCard" style="margin: 2px 20px 0 50px">
        <div class="row">
            <c:forEach items="${candidateList}" var="candidate">
            <div class="col-md-4">

                      <div class="card" style="margin-top: 10px">
                      <div class="img1" style="height: 145px;"></div>
                      <div class="img2"> <img src="candidateProfile//${candidate.candidateProfile}" alt=""></div>
                      <div class="main-text">
                        <h2> ${candidate.fullNameCandidate}</h2>
                        <p> Age: ${candidate.ageCandidate}</p>
                      </div>
                      <a href="vote?page=seeCandidateDetails&canId=${candidate.canId}"> See more </a>
<%--                          <input type="submit" id="votebtn" class="btn-vote" value="Vote Now">--%>
                          <a href="vote?page=voteCandidate&canId=${candidate.canId}" id="votebtn1" onclick="showAlert()">
                              <button class="btn-vote" id="votebtn">Vote Now</button>
                          </a>
                      <hr>
                          <div class="progress">
                              <div class="progress-bar" role="progressbar" style="width: ${Math.round(candidate.votes/totalVoters*100)}%" aria-valuenow="${Math.round((candidate.votes/totalVoters)*100)}" aria-valuemin="0" aria-valuemax="100">
                                  ${Math.round((candidate.votes/totalVoters)*100)}%

                              </div>
                          </div>

                    </div>

          </div>
            </c:forEach>
        </div>
      </div>
    </div>
<%--</form>--%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>

      document.addEventListener('DOMContentLoaded', function() {

          <% if (request.getAttribute("errorMessage") != null) { %>
          <%--<div class="error" style="color: #ff3860; margin-top: 98px; font-size: 18px; font-weight:400;" id="error-message"><%= request.getAttribute("errorMessage") %></div>--%>
          // <script>
              // Show an alert popup when the error message is displayed
              alert("<%= request.getAttribute("errorMessage") %>");
          var myButton = document.getElementById("votebtn1");

          myButton.addEventListener('click', function() {
              voteBtn.textContent = 'Voted';
              voteBtn.style.backgroundColor = '#add8e6';
              voteBtn.ariaDisabled = true;
          });
<%--    </script>--%>
<% } %>

          function showAlert() {
              // Show an alert box with a message when the button is clicked
              alert("Thank you for voting!");
          }



      });


    </script>
</body>
</html>
