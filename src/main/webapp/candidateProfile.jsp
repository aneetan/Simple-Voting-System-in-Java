<%--
  Created by IntelliJ IDEA.
  User: Aneeta
  Date: 4/4/2023
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="css/candidateProfile.css">

  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <title> Candidate Profile</title>
</head>
<body>
  <div class="wrapper">
    <div class="left">

      <img src="candidateProfile//${candidate.candidateProfile}" alt="user" width="100">
      <h4>${candidate.fullNameCandidate}</h4>
      <p>Candidate for ${candidate.candidate}</p>

    </div>
    <div class="right">
      <a href="vote?page=cancel"> <i class='bx bx-x'></i></a>
      <div class="info">
        <h3>Information</h3>
        <div class="info_data">
          <div class="data">
            <h4>Email</h4>
            <p>${candidate.emailCandidate}</p>
          </div>
          <div class="data">
            <h4>Age</h4>
            <p>${candidate.ageCandidate}</p>
          </div>

        </div>

        <div class="info_data">
          <div class="data">
            <h4>Address</h4>
            <p>${candidate.addressCandidate}</p>
          </div>
          <div class="data">
            <h4>Gender</h4>
            <p>${candidate.genderCandidate}</p>
          </div>

        </div>
      </div>

      <div class="projects">
        <h3>Past Works</h3>
        <div class="projects_data">
          <p> ${candidate.experience}</p>
        </div>
      </div>

      <div class="progress">
        <div class="progress-bar" role="progressbar" style="width: ${Math.round(candidate.votes/totalVoters*100)}%" aria-valuenow="${Math.round(candidate.votes/totalVoters*100)}" aria-valuemin="0" aria-valuemax="100">${candidate.votes/totalVoters*100}%</div>
      </div>


      <button class="btnVote" id="votebtn"> Vote Now</button>
      <!-- <input type="submit" value="Vote Now" class="btn" id="votebtn"> -->

    </div>
  </div>

  <script>
    const voteBtn = document.getElementById('votebtn');

    voteBtn.addEventListener('click', function() {
      voteBtn.textContent = 'Voted';
      voteBtn.style.backgroundColor = '#add8e6';
      voteBtn.ariaDisabled = true;
    });

  </script>
</body>
</html>
