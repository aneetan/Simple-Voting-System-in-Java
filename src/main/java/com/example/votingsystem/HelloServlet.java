package com.example.votingsystem;

import HashPassword.PasswordHashing;
import Model.Candidate;
import Model.Election;
import Model.Vote;
import Model.VotingSystem;
import VotingService.VotingService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;

//@MultipartConfig
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
@WebServlet(name = "HelloServlet", urlPatterns = "/vote")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String page = request.getParameter("page");

//--------------------------------------Registration and Login------------------------------------------------

        //for registering new user
        if (page.equalsIgnoreCase("registerUser")) {
                VotingSystem votingSystem = new VotingSystem();

                votingSystem.setEmail(request.getParameter("email"));
                votingSystem.setDob(request.getParameter("dob"));
                votingSystem.setPassword(PasswordHashing.hashPassword(request.getParameter("password")));

                request.getSession().setAttribute("votingSystem", votingSystem);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("authorize.jsp");
                requestDispatcher.forward(request, response);
            }

        if (page.equalsIgnoreCase("authorizeUser")) {
            VotingSystem votingSystem = (VotingSystem) request.getSession().getAttribute("votingSystem");

            Part file = request.getPart("userProfile");
            String imageFileName = file.getSubmittedFileName();

            String uploadPath = "C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//userProfile//" + imageFileName;

            try{
                FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                InputStream inputStream = file.getInputStream();

                byte[] data = new byte[inputStream.available()];
                inputStream.read(data);
                fileOutputStream.write(data);
                fileOutputStream.close();

                votingSystem.setUserProfile(imageFileName);

            } catch (Exception e){
                e.printStackTrace();
            }
            votingSystem.setEmail(request.getParameter("newEmail"));
            votingSystem.setDob(request.getParameter("newDob"));
            votingSystem.setPassword(request.getParameter("newPassword"));
            votingSystem.setFullName(request.getParameter("fullName"));
            votingSystem.setAddress(request.getParameter("address"));
            votingSystem.setGender(request.getParameter("gender"));
            votingSystem.setCitizenNo(request.getParameter("citizenNo"));
            votingSystem.setIssueDistrict(request.getParameter("issueDistrict"));
            votingSystem.setIssueDate(request.getParameter("issueDate"));

            // executing query with the value generated by form
            new VotingService().authorizeUser(votingSystem);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

        //for login of user using result set from database
        if (page.equalsIgnoreCase("loginUser")) {
            String email = request.getParameter("email");
            String password = PasswordHashing.hashPassword(request.getParameter("password"));
            String adminPassword = PasswordHashing.hashPassword("admin@123");

            //Admin login
            if(email.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase(adminPassword)){
                HttpSession session = request.getSession();
                session.setAttribute("email", email);

                int totalCandidates = new VotingService().totalCandidates();
                request.setAttribute("totalCandidates", totalCandidates);

                int totalUsers = new VotingService().totalUsers();
                request.setAttribute("totalUsers", totalUsers);

                int totalVoters = new VotingService().totalVoters();
                request.setAttribute("totalVoters", totalVoters);

                Election election = new Election();

                List<Election> electionList = new VotingService().getElectionList();   //returned in list
                request.setAttribute("election", election);
                request.setAttribute("electionList", electionList);
                Collections.sort(electionList, Collections.reverseOrder());


                Candidate candidate = new Candidate();
                List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
                request.setAttribute("candidate", candidate);
                request.setAttribute("candidateList", candidateList);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDash.jsp");
                requestDispatcher.forward(request, response);
            } else {
                //User Login
                VotingSystem votingSystem = new VotingService().loginUser(email, password);

                if (votingSystem != null) {
                    int id = votingSystem.getId();
                    HttpSession session = request.getSession();

                    session.setAttribute("email", email);
                    session.setAttribute("id", id);

                    Election election = new Election();

                    List<Election> electionList = new VotingService().getElectionList();   //returned in list
                    request.setAttribute("election", election);
                    request.setAttribute("electionList", electionList);

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("landing.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        }

        // for entering details to update password
        if (page.equalsIgnoreCase("forgotPassword")) {
            String citizenNo = request.getParameter("idNo");
            String issueDistrict = request.getParameter("issuedDistrict");

            VotingSystem votingSystem = new VotingService().forgotPw(citizenNo, issueDistrict);
            request.getSession().setAttribute("votingSystem", votingSystem);

            if (votingSystem != null) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("resetpw.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Sorry incorrect details");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("forgotpw.jsp");
                requestDispatcher.forward(request, response);
            }
        }

        //for resetting the new password
        if (page.equalsIgnoreCase("newpw")) {
            VotingSystem votingSystem = (VotingSystem) request.getSession().getAttribute("votingSystem");

            int id = votingSystem.getId();
            String password = PasswordHashing.hashPassword(request.getParameter("confirmResetPw"));

            new VotingService().resetPw(id,password);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

        //display register page
        if (page.equalsIgnoreCase("register")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
            requestDispatcher.forward(request, response);
        }

        //display login page
        if (page.equalsIgnoreCase("login")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

        //display forgot password page
        if (page.equalsIgnoreCase("forgotpw")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("forgotpw.jsp");
            requestDispatcher.forward(request, response);
        }

//--------------------------------------Admin Panel------------------------------------------------
        //display add election form
        if (page.equalsIgnoreCase("addElection")) {
            int count = new VotingService().countElection();
            if (count>0){
                request.setAttribute("error", "Election already exist");
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("addElection.jsp");
            requestDispatcher.forward(request, response);
        }

        //to add election from admin
        if (page.equalsIgnoreCase("addElectionDetails")) {
            Election election = new Election();

            int count = new VotingService().countElection();
            if (count>0){
                request.setAttribute("error", "You can add only one election.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("addElection.jsp");
                requestDispatcher.forward(request, response);
            }else {

                Part file = request.getPart("profile");
                String imageFileName = file.getSubmittedFileName();

                String uploadPath = "C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//uploadimage//" + imageFileName;

                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                    InputStream inputStream = file.getInputStream();

                    byte[] data = new byte[inputStream.available()];
                    inputStream.read(data);
                    fileOutputStream.write(data);
                    fileOutputStream.close();

//                election.setImageFileName(fileOutputStream);
                    election.setImageFileName(imageFileName);

                } catch (Exception e) {
                    e.printStackTrace();
                }

                election.setElectionName(request.getParameter("electionTitle"));
                election.setCandidacy(request.getParameter("candidacy"));
                election.setElectionDate(request.getParameter("electionDate"));

                // executing query with the value generated by form
                new VotingService().addElection(election);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("addCandidate.jsp");
                requestDispatcher.forward(request, response);
            }
        }

        //to delete election from database
        if (page.equalsIgnoreCase("deleteElection")) {
            int id = Integer.parseInt(request.getParameter("EId"));
            Election election = new Election();

            new VotingService().deleteElection(id);
            request.setAttribute("election", election);

            new VotingService().deleteSession();
            new VotingService().deleteCandidateTable();

            List<Election> electionList = new VotingService().getElectionList();   //returned in list
            request.setAttribute("electionList", electionList);

            Candidate candidate = new Candidate();
            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDash.jsp");
            requestDispatcher.forward(request, response);
        }

        //display edit candidate form
        if (page.equalsIgnoreCase("editElection")) {
            int EId = Integer.parseInt(request.getParameter("EId"));
            Election election = new VotingService().electionDetails(EId);

            request.setAttribute("election", election);
            request.setAttribute("EId", EId);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("editElection.jsp");
            requestDispatcher.forward(request, response);
        }

        if (page.equalsIgnoreCase("editElectionDetails")) {
            int id = Integer.parseInt(request.getParameter("EId"));
            Election election = new Election();

            Part file = request.getPart("profile");
            String imageFileName = file.getSubmittedFileName();

            String uploadPath = "C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//uploadimage//" + imageFileName;

            try{
                FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                InputStream inputStream = file.getInputStream();

                byte[] data = new byte[inputStream.available()];
                inputStream.read(data);
                fileOutputStream.write(data);
                fileOutputStream.close();

                election.setImageFileName(imageFileName);

            } catch (Exception e){
                e.printStackTrace();
            }

            election.setElectionName(request.getParameter("electionTitle"));
            election.setCandidacy(request.getParameter("candidacy"));
            election.setElectionDate(request.getParameter("electionDate"));

            // executing query with the value generated by form
            new VotingService().editElection(id, election);

            List<Election> electionList = new VotingService().getElectionList();   //returned in list
            request.setAttribute("electionList", electionList);

            Candidate candidate = new Candidate();
            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDash.jsp");
            requestDispatcher.forward(request, response);

        }

        //display admin dashboard
        if (page.equalsIgnoreCase("dashboard")) {
            int totalUsers = new VotingService().totalUsers();
            request.setAttribute("totalUsers", totalUsers);

            int totalCandidates = new VotingService().totalCandidates();
            request.setAttribute("totalCandidates", totalCandidates);

            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            Election election = new Election();

            List<Election> electionList = new VotingService().getElectionList();   //returned in list
            request.setAttribute("election", election);
            request.setAttribute("electionList", electionList);

            Candidate candidate = new Candidate();
            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDash.jsp");
            requestDispatcher.forward(request, response);
        }

        //display candidate list
        if (page.equalsIgnoreCase("seecandidate")) {
            Candidate candidate = new Candidate();
            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidatelist.jsp");
            requestDispatcher.forward(request, response);
        }


        //display add candidate form
        if (page.equalsIgnoreCase("addCandidate")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("addCandidate.jsp");
            requestDispatcher.forward(request, response);
        }

        //add candidate with the preference list
        if (page.equalsIgnoreCase("addCandidateDetails")) {

            Candidate candidate = new Candidate();

            Part file = request.getPart("profileCandidate");
            String imageFileName = file.getSubmittedFileName();

            String uploadPath = "C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//candidateProfile//" + imageFileName;

            try{
                FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                InputStream inputStream = file.getInputStream();

                byte[] data = new byte[inputStream.available()];
                inputStream.read(data);
                fileOutputStream.write(data);
                fileOutputStream.close();

                candidate.setCandidateProfile(imageFileName);

            } catch (Exception e){
                e.printStackTrace();
            }

            candidate.setFullNameCandidate(request.getParameter("nameCandidate"));
            candidate.setEmailCandidate(request.getParameter("emailCandidate"));
            candidate.setAgeCandidate(Integer.parseInt(request.getParameter("ageCandidate")));
            candidate.setAddressCandidate(request.getParameter("addressCandidate"));
            candidate.setGenderCandidate(request.getParameter("genderCandidate"));
            candidate.setCandidate(request.getParameter("candidate"));
            candidate.setExperience(request.getParameter("experience"));

            // executing query with the value generated by form
            new VotingService().addCandidate(candidate);
            request.getSession().setAttribute("candidate", candidate);

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidatelist.jsp");
            requestDispatcher.forward(request, response);
        }

        //to delete election from database
        if (page.equalsIgnoreCase("deleteCandidate")) {
            int id = Integer.parseInt(request.getParameter("canId"));
            Candidate candidate = new Candidate();

            new VotingService().deleteCandidate(id);
            request.setAttribute("candidate", candidate);

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidatelist.jsp");
            requestDispatcher.forward(request, response);
        }

        //display edit candidate form
        if (page.equalsIgnoreCase("editCandidate")) {
            int canId = Integer.parseInt(request.getParameter("canId"));
            Candidate candidate = new VotingService().candidateDetails(canId);

            request.setAttribute("candidate", candidate);
            request.setAttribute("canId", canId);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("editCandidate.jsp");
            requestDispatcher.forward(request, response);
        }

        if (page.equalsIgnoreCase("editCandidateDetails")) {
            int id = Integer.parseInt(request.getParameter("canId"));
            Candidate candidate = new Candidate();

            Part file = request.getPart("profileCandidate");
            String imageFileName = file.getSubmittedFileName();

            String uploadPath = "C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//candidateProfile//" + imageFileName;

            try{
                FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                InputStream inputStream = file.getInputStream();

                byte[] data = new byte[inputStream.available()];
                inputStream.read(data);
                fileOutputStream.write(data);
                fileOutputStream.close();

                 candidate.setCandidateProfile(imageFileName);

            } catch (Exception e){
                e.printStackTrace();
            }

            candidate.setFullNameCandidate(request.getParameter("nameCandidate"));
            candidate.setEmailCandidate(request.getParameter("emailCandidate"));
            candidate.setAgeCandidate(Integer.parseInt(request.getParameter("ageCandidate")));
            candidate.setAddressCandidate(request.getParameter("addressCandidate"));
            candidate.setGenderCandidate(request.getParameter("genderCandidate"));
            candidate.setCandidate(request.getParameter("candidate"));
            candidate.setExperience(request.getParameter("experience"));


            // executing query with the value generated by form
            new VotingService().editCandidate(id, candidate);

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidateList", candidateList);


            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidatelist.jsp");
            requestDispatcher.forward(request, response);

        }

        //display user list
        if (page.equalsIgnoreCase("userList")) {
            VotingSystem votingSystem = new VotingSystem();

            List<VotingSystem> userList = new VotingService().getUserList();   //returned in list
            request.setAttribute("votingSystem", votingSystem);
            request.setAttribute("userList", userList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userlist.jsp");
            requestDispatcher.forward(request, response);
        }

        //see user details
        if (page.equalsIgnoreCase("userDetailsAdmin")) {
            int id = Integer.parseInt(request.getParameter("id"));
            VotingSystem votingSystem = new VotingService().userDetails(id);

            request.setAttribute("votingSystem", votingSystem);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userDetailsAdmin.jsp");
            requestDispatcher.forward(request, response);
        }

        //search user list
        if (page.equalsIgnoreCase("searchUser")){
            String searchQuery = request.getParameter("search");

            VotingSystem votingSystem = new VotingSystem();

            List<VotingSystem> userList = new VotingService().searchUser(searchQuery);   //returned in list
            request.setAttribute("votingSystem", votingSystem);
            request.setAttribute("userList", userList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userlist.jsp");
            requestDispatcher.forward(request, response);
        }

        //display add candidate form
        if (page.equalsIgnoreCase("resultAdmin")) {
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            Candidate candidate = new Candidate();

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("resultAdmin.jsp");
            requestDispatcher.forward(request, response);
        }

        //see candidate details
        if (page.equalsIgnoreCase("candidateDetailsAdmin")) {
            int totalVoters = new VotingService().totalVoters();

            int id = Integer.parseInt(request.getParameter("canId"));
            Candidate candidate = new VotingService().candidateDetails(id);

            request.setAttribute("totalVoters", totalVoters);
            request.setAttribute("candidate", candidate);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateDetailsAdmin.jsp");
            requestDispatcher.forward(request, response);
        }

        //to delete user from database
        if (page.equalsIgnoreCase("deleteUser")) {
            int id = Integer.parseInt(request.getParameter("id"));
            VotingSystem votingSystem = new VotingSystem();

            new VotingService().deleteUser(id);
            request.setAttribute("votingSystem", votingSystem);

            List<VotingSystem> userList = new VotingService().getUserList();   //returned in list
            request.setAttribute("votingSystem", votingSystem);
            request.setAttribute("userList", userList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userlist.jsp");
            requestDispatcher.forward(request, response);
        }


        //exit candidate profile
        if (page.equalsIgnoreCase("cancelAdmin")) {
            Candidate candidate = new Candidate();
            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidatelist.jsp");
            requestDispatcher.forward(request, response);
        }

        //logout admin
        if (page.equalsIgnoreCase("logoutAdmin")) {
            HttpSession session = request.getSession(false);
            session.invalidate();
//            Current session return if not available new session in true
//            Current session return if not available return null in false

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }


//--------------------------------------User Panel------------------------------------------------
        //display user landing page
        if (page.equalsIgnoreCase("election")) {
            Election election = new Election();

            List<Election> electionList = new VotingService().getElectionList();   //returned in list
            request.setAttribute("election", election);
            request.setAttribute("electionList", electionList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("landing.jsp");
            requestDispatcher.forward(request, response);
        }

        //display rules for user from nav
        if (page.equalsIgnoreCase("rules")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("rules.jsp");
            requestDispatcher.forward(request, response);
        }

        //open candidate list from user
        if (page.equalsIgnoreCase("candidateCard") || page.equalsIgnoreCase("seeElec")) {
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            Candidate candidate = new Candidate();

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateCard.jsp");
            requestDispatcher.forward(request, response);
        }

        //open candidate list from user
        if (page.equalsIgnoreCase("seeElec")) {
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            Candidate candidate = new Candidate();

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateCard.jsp");
            requestDispatcher.forward(request, response);
        }

        //open voting result for user
        if (page.equalsIgnoreCase("resultUser")) {
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            Candidate candidate = new Candidate();

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("resultUser.jsp");
            requestDispatcher.forward(request, response);
        }

        //open user profile from nav
        if (page.equalsIgnoreCase("userProfile") || page.equalsIgnoreCase("seeDetails") ) {
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id");

            VotingSystem votingSystem = new VotingService().userDetails(id);
            request.setAttribute("votingSystem", votingSystem);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userProfile.jsp");
            requestDispatcher.forward(request, response);
        }
        //when clicked change password
        if (page.equalsIgnoreCase("changePw")){
            int id = Integer.parseInt(request.getParameter("id"));
            VotingSystem votingSystem = new VotingService().userDetails(id);

            request.setAttribute("votingSystem", votingSystem);
            request.setAttribute("id", id);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("oldPw.jsp");
            requestDispatcher.forward(request, response);
            }

        //submitting old password form
        if (page.equalsIgnoreCase("oldPwForm")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String oldPw = PasswordHashing.hashPassword(request.getParameter("oldPassword"));

            VotingSystem votingSystem = new VotingService().changePw(id, oldPw);
            request.getSession().setAttribute("votingSystem", votingSystem);

            if (votingSystem != null) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("changePw.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Sorry incorrect password");

                votingSystem = new VotingService().userDetails(id);

                request.setAttribute("votingSystem", votingSystem);
                request.setAttribute("id", id);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("oldPw.jsp");
                requestDispatcher.forward(request, response);
            }
        }

        //for saving the new password
        if (page.equalsIgnoreCase("changePwForm")) {
            VotingSystem votingSystem = (VotingSystem) request.getSession().getAttribute("votingSystem");
            request.setAttribute("votingSystem", votingSystem);

//            int id = votingSystem.getId();
            int id = Integer.parseInt(request.getParameter("id"));

            String password = PasswordHashing.hashPassword(request.getParameter("confirmPassword"));

            new VotingService().resetPw(id,password);

            VotingSystem votingSys = new VotingService().userDetails(id);
            request.setAttribute("votingSystem", votingSys);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userProfile.jsp");
            requestDispatcher.forward(request, response);
        }

        if (page.equalsIgnoreCase("editUserDetails")) {
            int id = Integer.parseInt(request.getParameter("id"));
            VotingSystem vs = new VotingSystem();

            Part file = request.getPart("userPro");
            String imageFileName = file.getSubmittedFileName();

            String uploadPath = "C://Users//DELL//IdeaProjects//VotingSystem//src//main//webapp//userProfile//" + imageFileName;

            try{
                FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                InputStream inputStream = file.getInputStream();

                byte[] data = new byte[inputStream.available()];
                inputStream.read(data);
                fileOutputStream.write(data);
                fileOutputStream.close();

                vs.setUserProfile(imageFileName);

            } catch (Exception e){
                e.printStackTrace();
            }

            vs.setEmail(request.getParameter("newEmail"));
            vs.setDob(request.getParameter("newDob"));
//            votingSystem.setPassword(request.getParameter("newPassword"));
            vs.setFullName(request.getParameter("fullName"));
            vs.setAddress(request.getParameter("address"));
            vs.setGender(request.getParameter("gender"));
            vs.setCitizenNo(request.getParameter("citizenNo"));
            vs.setIssueDistrict(request.getParameter("issueDistrict"));
            vs.setIssueDate(request.getParameter("issueDate"));

            // executing query with the value generated by form
            new VotingService().editUser(id, vs);

            VotingSystem votingSystem = new VotingService().userDetails(id);
            request.setAttribute("votingSystem", votingSystem);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("userProfile.jsp");
            requestDispatcher.forward(request, response);

        }

        //display edit user details form
        if (page.equalsIgnoreCase("editUser")) {
            int id = Integer.parseInt(request.getParameter("id"));
            VotingSystem votingSystem = new VotingService().userDetails(id);

            request.setAttribute("votingSystem", votingSystem);
            request.setAttribute("id", id);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("editUserDetails.jsp");
            requestDispatcher.forward(request, response);
        }

        //see details of candidate profile
        if (page.equalsIgnoreCase("seeCandidateDetails")) {
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            int id = Integer.parseInt(request.getParameter("canId"));
            Candidate candidate = new VotingService().candidateDetails(id);

//            HttpSession session = request.getSession();
//            int id = (int) session.getAttribute("id");

            request.setAttribute("candidate", candidate);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateProfile.jsp");
            requestDispatcher.forward(request, response);
        }

        if(page.equalsIgnoreCase("voteCandidate")){
            int id = Integer.parseInt(request.getParameter("canId"));
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            // Check if the user has already voted
            if (new VotingService().userHasVoted(request.getRemoteAddr())) {
                // If the user has already voted, display an error message
                request.setAttribute("errorMessage", "Sorry! You have already voted.");
                Candidate candidate = new Candidate();

                List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
                request.setAttribute("candidate", candidate);
                request.setAttribute("candidateList", candidateList);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateCard.jsp");
                requestDispatcher.forward(request, response);
            } else {
                // If the user has not already voted, store their vote in the database
                Vote vote = new Vote();

                vote.setSessionId(request.getRemoteAddr());
                vote.setCandidateId(id);

                // executing query with the value generated by form
                new VotingService().insertVote(vote);
                new VotingService().getVotes(id);

                Candidate candidate = new Candidate();

                List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
                request.setAttribute("candidate", candidate);
                request.setAttribute("candidateList", candidateList);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateCard.jsp");
                requestDispatcher.forward(request, response);
            }

            Candidate candidate = new Candidate();

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateCard.jsp");
            requestDispatcher.forward(request, response);
        }

        //exit details of candidate profile
        if (page.equalsIgnoreCase("cancel")) {
            int totalVoters = new VotingService().totalVoters();
            request.setAttribute("totalVoters", totalVoters);

            Candidate candidate = new Candidate();

            List<Candidate> candidateList = new VotingService().getCandidateList();   //returned in list
            request.setAttribute("candidate", candidate);
            request.setAttribute("candidateList", candidateList);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("candidateCard.jsp");
            requestDispatcher.forward(request, response);
        }

        //logout user
        if (page.equalsIgnoreCase("logoutUser")) {
            HttpSession session = request.getSession(false);
            session.invalidate();

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

        //terms
        if (page.equalsIgnoreCase("terms")){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("terms.jsp");
            requestDispatcher.forward(request, response);
        }



    }

    public void destroy() {
    }
}