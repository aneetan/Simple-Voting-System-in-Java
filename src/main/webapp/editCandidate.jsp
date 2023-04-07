<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/6/2023
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core" />

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="css/admin.css" />

    <title> Edit Candidate</title>
</head>
<body>
        <%@ include file="essentials/sidebar.jsp"%>

        <section id="content">

            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Edit Candidate</h1>
                    </div>
                </div>

                <div class="container">
                    <!-- <hr> -->

                    <form action="vote?page=editCandidateDetails" id="authorizeForm" method="post" enctype="multipart/form-data">
                        <div class="form first">
                            <input type="hidden" name="canId" value="${candidate.canId}">

                            <div class="input-field photo-upload">
                                <img src="candidateProfile//${candidate.candidateProfile}" alt="Choose photo"> <br>
                                <input type="file" id="profileCan" class="img-file" name="profileCandidate">
                            </div>
                            <div class="details personal">
                                <!-- <span class="title">Personal Details</span> -->

                                <div class="fields">

                                    <div class="input-field">
                                        <label> Full Name</label>
                                        <input id="nameCandidate" name="nameCandidate" type="text" value="${candidate.fullNameCandidate}" required>
                                    </div>
                                    <div class="input-field">
                                        <label> Email</label>
                                        <input id="emailCandidate" name="emailCandidate" type="email" value="${candidate.emailCandidate}" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Age</label>
                                        <input id="ageCandidate"  name="ageCandidate" type="text" value="${candidate.ageCandidate}" required>
                                    </div>
                                </div>
                                <div class="fields">
                                    <div class="input-field">
                                        <label>Address</label>
                                        <input id="addressCandidate" name="addressCandidate" type="text" value="${candidate.addressCandidate}" required>
                                    </div>

                                    <div class="input-field">
                                        <label>Gender</label>
                                        <select name="genderCandidate" required>
                                            <option disabled selected>Select gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Gender">Others</option>
                                        </select>
                                    </div>

                                    <div class="input-field">
                                        <label>Specify Candidacy</label>
                                        <select name="candidate" required>
                                            <option disabled selected>Specify</option>
                                            <option value="Semester II(A)">Semester II(A)</option>
                                            <option value="Semester II(B)">Semester II(B)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="input-field">
                                <label> Add Experience</label>
                                <textarea name="experience" class="textarea" required> ${candidate.experience} </textarea>
                            </div>

                            <div class="btn-place">
                                <input type="submit" value="Submit" class="btnText">
                            </div>


                        </div>
                    </form>
                </div>
                </div>


            </main>
        </section>


        <script>
            //changing the image to file option
            const img = document.getElementById("profileCan");
            input = document.querySelector("input");

            input.addEventListener("change", () => {
                img.src = URL.createObjectURL(input.files[0]);
            })
        </script>
</body>
</html>
