<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 12:25 AM
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

    <title> Add Candidate</title>
</head>
<body>
<%@ include file="essentials/sidebar.jsp"%>

    <section id="content">

        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Add Candidate</h1>
                </div>
            </div>

            <div class="container">
                <!-- <hr> -->

                <form action="#" id="authorizeForm">
                    <div class="form first">
                        <div class="input-field photo-upload">
                            <img src="img/img.png" alt="Choose photo"> <br>
                            <input type="file" class="img-file" name="profile">
                        </div>
                        <div class="details personal">
                            <!-- <span class="title">Personal Details</span> -->

                            <div class="fields">

                                <div class="input-field">
                                    <label> Full Name</label>
                                    <input id="name" type="text" placeholder="Enter full name" required>
                                </div>
                                <div class="input-field">
                                    <label> Email</label>
                                    <input id="email" type="email" placeholder="Enter email" required>
                                </div>

                                <div class="input-field">
                                    <label>Age</label>
                                    <input id="address" type="text" placeholder="Enter age" required>
                                </div>
                            </div>
                            <div class="fields">
                                <div class="input-field">
                                    <label>Address</label>
                                    <input id="age" type="text" placeholder="Enter address" required>
                                </div>

                                <div class="input-field">
                                    <label>Gender</label>
                                    <select required>
                                        <option disabled selected>Select gender</option>
                                        <option>Male</option>
                                        <option>Female</option>
                                        <option>Others</option>
                                    </select>
                                </div>

                                <div class="input-field">
                                    <label>Specify Candidancy</label>
                                    <select required>
                                        <option disabled selected>Specify</option>
                                        <option>Semester II(A)</option>
                                        <option>Semester II(B)</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="input-field">
                            <label> Add Experience</label>
                            <textarea class="textarea" placeholder="For semester II Class Representative" required></textarea>
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
        const img = document.querySelector("img");
        input = document.querySelector("input");

        input.addEventListener("change", () => {
            img.src = URL.createObjectURL(input.files[0]);
        })
    </script>

</body>
</html>
