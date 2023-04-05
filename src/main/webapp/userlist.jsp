<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 12:32 AM
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

    <title> User List</title>
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
                    <h1>User List</h1>
                </div>
            </div>

            <div class="table-data list-data">
                <div class="order user-list">
                    <div class="head">
                        <h3>List of User</h3>
                        <i class='bx bx-plus' ></i>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>DOB</th>
                            <th>Address</th>
                            <th>Gender</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>
                                    <img src="C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//userProfile//${user.userProfile}">
                                    ${user.fullName}
                                </td>
                                <td>${user.email}</td>
                                <td> ${user.dob}</td>
                                <td> ${user.address}</td>
                                <td> ${user.gender}</td>

                                <td> <a href="vote?page=userDetailsAdmin&id=${user.id}"> See details</a> </td>

                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </section>

    <nav aria-label="Page navigation example" style="margin: 300px 12px 0 0;">
        <ul class="pagination justify-content-end">
            <li class="page-item disabled">
                <a class="page-link" href="#" style="background: #d1d0df;" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" style="background: #d1d0df;" href="#">1</a></li>
            <li class="page-item"><a class="page-link" style="background: #d1d0df;" href="#">2</a></li>
            <li class="page-item"><a class="page-link" style="background: #d1d0df;" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#" style="background: #d1d0df;">Next</a>
            </li>
        </ul>
    </nav>


    <script src="script.js"></script>

</body>
</html>
