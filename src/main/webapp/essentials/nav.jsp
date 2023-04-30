<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 3/25/2023
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />


  <!-- Local css linkage -->
  <link rel="stylesheet" href="../css/style.css" />

  <!-- Boxicon link -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <title> Navbar </title>
  <style>
    /*Navbar*/
    header{
      background-color: #3085db;

    }
    .navbar {
      background: #0080ff;
      position: fixed;
      font-family: 'Poppins', sans-serif;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 999;
    }

    li{
      list-style: none;
    }

    .nav-branding{
      color: white;
      text-decoration: none;
      font-size: 24px;
      font-weight: 600;
      margin-left: 6px;
    }

    /*.navbar{*/
    /*  font-family: 'Poppins', sans-serif;*/
    /*  min-height: 70px;*/
    /*  display: flex;*/
    /*  justify-content: space-between;*/
    /*  align-items: center;*/
    /*  padding: 0 24px;*/
    /*}*/

    .nav-menu{
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 60px;
    }

    .nav-link{
      margin-top: 12px;
      transition: 0.7s ease;
      font-size: 18px;
      color: #cadff3;

      /*color: white;*/
    }

    .nav-link:hover{
      color: white;

    }

    .hamburger{
      display: none;
      cursor: pointer;
    }

    .bar{
      display: block;
      width: 25px;
      height: 3px;
      margin: 5px auto;
      -webkit-transition: all 0.3s ease-in-out;
      background-color: white;
    }
    .navbar ul li.activeLinks a{
      color: white;
    }

    @media(max-width: 768px){
      .hamburger{
        display: block;
      }

      .hamburger.active .bar:nth-child(2){
        opacity: 0;

      }
      .hamburger.active .bar:nth-child(1){
        transform: translateY(8px) rotate(45deg);
      }
      .hamburger.active .bar:nth-child(3){
        transform: translateY(-8px) rotate(-45deg);
      }
      .nav-menu{
        position: fixed;
        left: -100%;
        top: 70px;
        gap: 0;
        flex-direction: column;
        background-color: #3085db;
        width: 100%;
        text-align: center;
        transition: 0.3s;
      }

      .nav-item{
        margin: 16px 0;
      }
      .navbar ul li a{
        color: #cadff3;
      }

    }
  </style>
</head>
<body>
<header>
  <nav class="navbar" id="navbar">
    <a href="#" class="nav-branding"><img src="img/votelogo.png" alt="logo" width="40px"> VoteNow</a>
    <ul class="nav-menu">
      <li class="nav-item activeLinks">
        <a href="vote?page=election" class="nav-link">Election</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=rules" class="nav-link" >Rules</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=candidateCard" class="nav-link">Vote</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=resultUser" class="nav-link">View Result</a>
      </li>
      <li class="nav-item">
        <a href="vote?page=userProfile" class="nav-link" >Profile</a>
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


  document.addEventListener('DOMContentLoaded', function() {

    const allSideMenu = document.querySelectorAll('.navbar ul li a');
    // let activeLink = localStorage.getItem('activeLink');

    allSideMenu.forEach(item=> {
      const li = item.closest('li');

      item.addEventListener('click', function (event) {
        event.preventDefault();

        const link = item.getAttribute('href');
        localStorage.setItem('activeLink', link);

        // Navigate to the new page
        window.location.href = link;
      })
    });

    // Highlight the active link when the page is reloaded
    const currentUrl = window.location.href;

    allSideMenu.forEach(item => {

      if (item.href === currentUrl) {
        allSideMenu.forEach(l => l.parentElement.classList.remove('activeLinks'));
        const li = item.closest('li');
        li.classList.add('activeLinks');

      }
    });

    // TOGGLE SIDEBAR
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".nav-menu");

    hamburger.addEventListener("click", () =>{
      hamburger.classList.toggle("active");
      navMenu.classList.toggle("active");
    })
  });

</script>
</body>
</html>
