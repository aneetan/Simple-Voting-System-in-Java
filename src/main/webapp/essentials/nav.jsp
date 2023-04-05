<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/25/2023
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Local css linkage -->
  <link rel="stylesheet" href="css/style.css" />

  <!-- Boxicon link -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <title> Navbar </title>
</head>
<body>
<header>
  <nav class="navbar">
    <a href="#" class="nav-branding"><img src="img/votelogo.png" alt="logo" width="40px"> VoteNow</a>
    <ul class="nav-menu">
      <li class="nav-item">
        <a href="vote?page=election" class="nav-link" style="color: white ;">Election</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=rules" class="nav-link" style="color: white ;" >Rules</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=candidateCard" class="nav-link" style="color: white ;" >Vote</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=resultUser" class="nav-link" style="color: white ;">View Result</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=userProfile" class="nav-link" style="color: white ;" >Profile</a>
      </li>

    </ul>
    <div class="hamburger">
      <span class="bar"></span>
      <span class="bar"></span>
      <span class="bar"></span>


    </div>
  </nav>
</header>

<script>
  const hamburger = document.querySelector(".hamburger");
  const navMenu = document.querySelector(".nav-menu");

  hamburger.addEventListener("click", () =>{
    hamburger.classList.toggle("active");
    navMenu.classList.toggle("active");
  })

  document.querySelector(".nav-link").forEach(n => n.addEventListener("click", () => {
    hamburger.classList.remove("active");
    navMenu.classList.remove("active");
  }))
</script>
</body>
</html>
