<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 12:11 AM
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

    <title> Add Election</title>
</head>
<body>
<%@ include file="essentials/sidebar.jsp"%>

    <section id="content">

        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Create an election</h1>
                </div>
            </div>

            <div class="wrapper">
                <div class="title">
                    Please fill the Details
                </div>
                <form action="vote?page=addElectionDetails" method="post" enctype="multipart/form-data">
                    <p class="photo">Select cover photo</p>
                    <div class="inputfield">
                        <img src="img/img.png" id="profile" alt="Choose photo"> <br>
                        <input type="file" class="img-file" name="profile">
                    </div>

                    <div class="inputfield">
                        <label>Election Title</label>
                        <input type="text" name="electionTitle" class="input" placeholder="Eg. Ongoing Election" required>
                    </div>


                    <div class="inputfield">
                        <label>Candidancy for</label>
                        <div class="custom_select">
                            <select name="candidacy">
                                <option value="" disabled selected>Select</option>
                                <option value="Semester II(A)">Semester II(A)</option>
                                <option value="Semester II(B)">Semester II(B)</option>
                            </select>
                        </div>
                    </div>

                    <div class="inputfield">
                        <label>Select Date</label>
                        <input type="date" class="input" name="electionDate" required>
                    </div>
                    <div class="inputfield">
                        <input type="submit" value="Add Election" class="btn">
                    </div>
                </form>
            </div>

            <div class="form">

            </div>
        </main>
    </section>


    <script>
        //changing the image to file option
        const img = document.getElementById("profile");
        input = document.querySelector("input");

        input.addEventListener("change", () => {
            img.src = URL.createObjectURL(input.files[0]);
        })
    </script>
</body>
</html>
