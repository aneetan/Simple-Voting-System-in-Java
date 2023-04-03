<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Boxicons -->
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <link rel="stylesheet" href="css/admin.css" />

  <title> See Candidate</title>
</head>
<body>
  <%@ include file="essentials/sidebar.jsp"%>

  <section id="content">

    <main>
      <div class="head-title">
        <div class="left">
          <h1>Candidate List</h1>
        </div>
      </div>

      <div class="table-data list-data">
        <div class="order user-list">
          <div class="head">
            <h3>List of Candidates</h3>
            <i class='bx bx-plus' ></i>
          </div>
          <table>
            <thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Age</th>
              <th>Address</th>
              <th>Gender</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>
                <img src="img/people.png">
                John Doe
              </td>
              <td>temp@gmail.com</td>
              <td> 24</td>
              <td> Syangja</td>
              <td> Female</td>

              <td> <a href=""> See details</a> </td>

            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </section>


  <script src="admin.js"></script>
</body>
</html>

