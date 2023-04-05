<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/3/2023
  Time: 11:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="css/admin.css" />

    <title> Sidebar</title>
</head>
<body>
    <section id="sidebar">
        <a href="#" class="brand">
            <img src="../img/blue_logo.png" alt="logo" width="50px">
            <span class="text">VoteNow</span>
        </a>
        <ul class="side-menu top">
            <li class="active">
                <a href="vote?page=dashboard">
                    <i class='bx bxs-dashboard' ></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="vote?page=addElection">
                    <i class='bx bx-list-plus'></i>
                    <span class="text">Add Election</span>
                </a>
            </li>
            <li>
                <a href="vote?page=addCandidate">
                    <i class='bx bx-user-plus'></i>
                    <span class="text">Add Candidate</span>
                </a>
            </li>
            <li>
                <a href="vote?page=userList">
                    <i class='bx bx-collection'></i>
                    <span class="text">User List</span>
                </a>
            </li>
            <li>
                <a href="vote?page=resultAdmin">
                    <i class='bx bx-happy'></i>
                    <span class="text">Voting Result</span>
                </a>
            </li>
        </ul>
        <ul class="side-menu">

            <li>
                <a href="vote?page=logoutAdmin" class="logout">
                    <i class='bx bx-arrow-from-left'></i>
                    <span class="text">Logout</span>
                </a>
            </li>
        </ul>
    </section>

<%--<script src="admin.js"></script>--%>
<script>
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
