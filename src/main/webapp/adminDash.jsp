<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/29/2023
  Time: 10:38 AM
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

    <link rel="stylesheet" href="css/admin.css" />

    <title> Admin Dashboard</title>
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
                    <h1>Welcome Admin!</h1>

                </div>

            </div>

            <ul class="box-info">
                <li>
                    <i class='bx bx-user-check'></i>
                    <span class="text">
                            <h3>4</h3>
                            <p>Candidates</p>
                        </span>
                </li>
                <li>
                    <i class='bx bxs-group' ></i>
                    <span class="text">
                            <h3>200</h3>
                            <p>User Login</p>
                        </span>
                </li>
                <li>
                    <i class='bx bxs-message-square-check'></i>
                    <span class="text">
                            <h3>2</h3>
                            <p>Elections Held</p>
                        </span>
                </li>
            </ul>


            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>List of Candidates</h3>
                        <a href="vote?page=seecandidate"> See all</a>
<%--                        <a href="vote?page=addcandidate"><i class='bx bx-plus' ></i></a>--%>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Candidancy</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${candidateList}" var="candidate">

                        <tr>
                            <td>
                                <img src="C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//candidateProfile//${candidate.candidateProfile}">
                                <p>${candidate.fullNameCandidate}</p>
                            </td>
                            <td> ${candidate.ageCandidate}</td>

                            <td><span class="status completed"> ${candidate.candidate}</span></td>
                        </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="todo">
                    <div class="head">
                        <h3>Recent Elections</h3>
                        <i class='bx bx-plus' ></i>
                    </div>

                    <c:forEach items="${electionList}" var="election">

                    <div class="card" style="width: 15rem;">
                        <img src="C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//uploadimage//${election.imageFileName}" class="card-img-top" alt="election-img">
                        <div class="card-body">
                            <h5 class="card-title"> ${election.electionName}</h5>
                            <p class="card-text">${election.candidacy}</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"> ${election.electionDate}</li>
                        </ul>
                        <div class="card-body">
                            <a href="vote?page=deleteElection" class="card-link">Delete Election</a>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </main>
    </section>

<script src="admin.js">
    const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

    allSideMenu.forEach(item=> {
        const li = item.parentElement;

        item.addEventListener('click', function () {
            allSideMenu.forEach(i=> {
                i.parentElement.classList.remove('active');
            })
            li.classList.add('active');
        })
    });


    // TOGGLE SIDEBAR
    const menuBar = document.querySelector('#content nav .bx.bx-menu');
    const sidebar = document.getElementById('sidebar');

    menuBar.addEventListener('click', function () {
        sidebar.classList.toggle('hide');
    })



</script>
</body>
</html>
