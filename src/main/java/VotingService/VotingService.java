package VotingService;

import DatabaseConnection.DBConnection;
import Model.Candidate;
import Model.Election;
import Model.Vote;
import Model.VotingSystem;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VotingService {

    //Saving details for registration form and registering user
    public void authorizeUser(VotingSystem votingSystem) {
        String query = "INSERT INTO voter(email,dob,password,userProfile,fullName,address,gender,citizenNo,issueDistrict,issueDate)" + "values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, votingSystem.getEmail());
            preparedStatement.setString(2, votingSystem.getDob());
            preparedStatement.setString(3, votingSystem.getPassword());
            preparedStatement.setString(4, votingSystem.getUserProfile());
            preparedStatement.setString(5, votingSystem.getFullName());
            preparedStatement.setString(6, votingSystem.getAddress());
            preparedStatement.setString(7, votingSystem.getGender());
            preparedStatement.setString(8, votingSystem.getCitizenNo());
            preparedStatement.setString(9, votingSystem.getIssueDistrict());
            preparedStatement.setString(10, votingSystem.getIssueDate());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //helps to login the user by checking database
    public VotingSystem loginUser(String email, String password){
        String query= "select * from voter where email=? and password=?";
        PreparedStatement preparedStatement= new DBConnection().getStatement(query);
        VotingSystem votingSystem= null;

        try{
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                votingSystem= new VotingSystem();

                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setEmail(resultSet.getString("email"));
                votingSystem.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return votingSystem;
    }

    //entering details for resetting password
    public VotingSystem forgotPw(String citizenNo, String issueDistrict){
        String query= "select * from voter where citizenNo=? and issueDistrict=?";
        PreparedStatement preparedStatement= new DBConnection().getStatement(query);
        VotingSystem votingSystem= null;

        try{
            preparedStatement.setString(1, citizenNo);
            preparedStatement.setString(2, issueDistrict);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                votingSystem= new VotingSystem();

                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setCitizenNo(resultSet.getString("citizenNo"));
                votingSystem.setIssueDistrict(resultSet.getString("issueDistrict"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return votingSystem;
    }

    //resetting the password
    public void resetPw(int id, String password){
        String query= "Update voter set password=?" + "where id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, password);
            preparedStatement.setInt(2,id);
            preparedStatement.execute();

        } catch (SQLException e){
            e.printStackTrace();
        }

    }

    //adding election in database
    public void addElection(Election election) {
        String query = "INSERT INTO Election(imageFileName, electionName, candidacy, electionDate)" + "values(?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, election.getImageFileName());
            preparedStatement.setString(2, election.getElectionName());
            preparedStatement.setString(3, election.getCandidacy());
            preparedStatement.setString(4, election.getElectionDate());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //adding candidate in database
    public void addCandidate(Candidate candidate) {
        String query = "INSERT INTO candidate(candidateProfile,fullNameCandidate, emailCandidate, ageCandidate, addressCandidate, genderCandidate, candidate, experience,votes)" + "values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, candidate.getCandidateProfile());
            preparedStatement.setString(2, candidate.getFullNameCandidate());
            preparedStatement.setString(3, candidate.getEmailCandidate());
            preparedStatement.setInt(4, candidate.getAgeCandidate());
            preparedStatement.setString(5, candidate.getAddressCandidate());
            preparedStatement.setString(6, candidate.getGenderCandidate());
            preparedStatement.setString(7, candidate.getCandidate());
            preparedStatement.setString(8, candidate.getExperience());
            preparedStatement.setInt(9, candidate.getVotes());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //displaying election list
    public List<Election> getElectionList(){
        ArrayList<Election> electionList = new ArrayList<>();
        String query = "select * from election";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                Election election = new Election();

                election.setEId(resultSet.getInt("EId"));
                election.setImageFileName(resultSet.getString("imageFileName"));
                election.setElectionName(resultSet.getString("electionName"));
                election.setCandidacy(resultSet.getString("candidacy"));
                election.setElectionDate(resultSet.getString("electionDate"));

                electionList.add(election);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return electionList;
    }

    //deleting election from database
    public void deleteElection(int EId) {
        String query = "Delete from election where EId = ?";
        PreparedStatement preparedStatement1 = new DBConnection().getStatement(query);

        try {
            preparedStatement1.setInt(1, EId);
            preparedStatement1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //edit election from database
    public void editElection(int EId, Election election){
        String query= "Update election set imageFileName=?, electionName=?, candidacy=?, electionDate=?" + " where EId=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, election.getImageFileName());
            preparedStatement.setString(2, election.getElectionName());
            preparedStatement.setString(3, election.getCandidacy());
            preparedStatement.setString(4, election.getElectionDate());

            preparedStatement.setInt(5,EId);
            preparedStatement.execute();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    //display election details
    public Election electionDetails(int EId){
        String query = "Select * from election where EId =?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        Election election = new Election();

        try{
            preparedStatement.setInt(1, EId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                election.setEId(resultSet.getInt("EId"));
                election.setImageFileName(resultSet.getString("imageFileName"));
                election.setElectionName(resultSet.getString("electionName"));
                election.setCandidacy(resultSet.getString("candidacy"));
                election.setElectionDate(resultSet.getString("electionDate"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return election;
    }

    //display candidate list
    public List<Candidate> getCandidateList(){
        ArrayList<Candidate> candidateList = new ArrayList<>();
        String query = "select * from candidate";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                Candidate candidate = new Candidate();

                candidate.setCanId(resultSet.getInt("canId"));
                candidate.setCandidateProfile(resultSet.getString("candidateProfile"));
                candidate.setFullNameCandidate(resultSet.getString("fullNameCandidate"));
                candidate.setEmailCandidate(resultSet.getString("emailCandidate"));
                candidate.setAgeCandidate(resultSet.getInt("ageCandidate"));
                candidate.setAddressCandidate(resultSet.getString("addressCandidate"));
                candidate.setGenderCandidate(resultSet.getString("genderCandidate"));
                candidate.setCandidate(resultSet.getString("candidate"));
                candidate.setExperience(resultSet.getString("experience"));
                candidate.setVotes(resultSet.getInt("votes"));

                candidateList.add(candidate);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return candidateList;
    }

    //deleting candidate from database
    public void deleteCandidate(int canId) {
        String query = "Delete from candidate where canId = ?";
        PreparedStatement preparedStatement1 = new DBConnection().getStatement(query);

        try {
            preparedStatement1.setInt(1, canId);
            preparedStatement1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //edit candidate from database
    public void editCandidate(int canId, Candidate candidate){
        String query= "Update candidate set candidateProfile=?,fullNameCandidate=?, emailCandidate=?, ageCandidate=?, addressCandidate=?, genderCandidate=?, candidate=?, experience=?" + " where canId=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, candidate.getCandidateProfile());
            preparedStatement.setString(2, candidate.getFullNameCandidate());
            preparedStatement.setString(3, candidate.getEmailCandidate());
            preparedStatement.setInt(4, candidate.getAgeCandidate());
            preparedStatement.setString(5, candidate.getAddressCandidate());
            preparedStatement.setString(6, candidate.getGenderCandidate());
            preparedStatement.setString(7, candidate.getCandidate());
            preparedStatement.setString(8, candidate.getExperience());
            preparedStatement.setInt(9,canId);
            preparedStatement.execute();

        } catch (SQLException e){
            e.printStackTrace();
        }

    }

    //get list of user
    public List<VotingSystem> getUserList(){
        ArrayList<VotingSystem> userList = new ArrayList<>();
        String query = "select * from voter";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                VotingSystem votingSystem = new VotingSystem();

                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setUserProfile(resultSet.getString("userProfile"));
                votingSystem.setFullName(resultSet.getString("fullName"));
                votingSystem.setEmail(resultSet.getString("email"));
                votingSystem.setDob(resultSet.getString("dob"));
                votingSystem.setAddress(resultSet.getString("address"));
                votingSystem.setGender(resultSet.getString("gender"));
                votingSystem.setCitizenNo(resultSet.getString("citizenNo"));
                votingSystem.setIssueDistrict(resultSet.getString("issueDistrict"));
                votingSystem.setIssueDate(resultSet.getString("issueDate"));


                userList.add(votingSystem);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return userList;
    }

    //displaying user details
    public VotingSystem userDetails(int id){
        String query = "Select * from voter where id =?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        VotingSystem votingSystem = new VotingSystem();


        try{
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setUserProfile(resultSet.getString("userProfile"));
                votingSystem.setFullName(resultSet.getString("fullName"));
                votingSystem.setEmail(resultSet.getString("email"));
                votingSystem.setDob(resultSet.getString("dob"));
                votingSystem.setAddress(resultSet.getString("address"));
                votingSystem.setGender(resultSet.getString("gender"));
                votingSystem.setCitizenNo(resultSet.getString("citizenNo"));
                votingSystem.setIssueDistrict(resultSet.getString("issueDistrict"));
                votingSystem.setIssueDate(resultSet.getString("issueDate"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return votingSystem;
    }

    //edit user from database
    public void editUser(int id, VotingSystem votingSystem){
        String query= "Update voter set email=?,dob=?,userProfile=?,fullName=?,address=?,gender=?,citizenNo=?,issueDistrict=?,issueDate=?" + " where id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
//        VotingSystem votingSystem = new VotingSystem();

        try{
            preparedStatement.setString(1, votingSystem.getEmail());
            preparedStatement.setString(2, votingSystem.getDob());
            preparedStatement.setString(3, votingSystem.getUserProfile());
            preparedStatement.setString(4, votingSystem.getFullName());
            preparedStatement.setString(5, votingSystem.getAddress());
            preparedStatement.setString(6, votingSystem.getGender());
            preparedStatement.setString(7, votingSystem.getCitizenNo());
            preparedStatement.setString(8, votingSystem.getIssueDistrict());
            preparedStatement.setString(9, votingSystem.getIssueDate());


            preparedStatement.setInt(10,id);
            preparedStatement.execute();

        } catch (SQLException e){
            e.printStackTrace();
        }

    }

    //searching user from list
    public List<VotingSystem> searchUser(String searchQuery){
        ArrayList<VotingSystem> userList = new ArrayList<>();
        String query = "select * from voter where fullName like ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, "%" + searchQuery + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                VotingSystem votingSystem = new VotingSystem();

                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setUserProfile(resultSet.getString("userProfile"));
                votingSystem.setFullName(resultSet.getString("fullName"));
                votingSystem.setEmail(resultSet.getString("email"));
                votingSystem.setDob(resultSet.getString("dob"));
                votingSystem.setAddress(resultSet.getString("address"));
                votingSystem.setGender(resultSet.getString("gender"));
                votingSystem.setCitizenNo(resultSet.getString("citizenNo"));
                votingSystem.setIssueDistrict(resultSet.getString("issueDistrict"));
                votingSystem.setIssueDate(resultSet.getString("issueDate"));


                userList.add(votingSystem);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return userList;
    }

    //pagination
    public List<VotingSystem> getDetails(int start, int total){
        ArrayList<VotingSystem> userList = new ArrayList<>();
        String query = "select * from voter limit ?,?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, total);
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                VotingSystem votingSystem = new VotingSystem();

                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setUserProfile(resultSet.getString("userProfile"));
                votingSystem.setFullName(resultSet.getString("fullName"));
                votingSystem.setEmail(resultSet.getString("email"));
                votingSystem.setDob(resultSet.getString("dob"));
                votingSystem.setAddress(resultSet.getString("address"));
                votingSystem.setGender(resultSet.getString("gender"));
                votingSystem.setCitizenNo(resultSet.getString("citizenNo"));
                votingSystem.setIssueDistrict(resultSet.getString("issueDistrict"));
                votingSystem.setIssueDate(resultSet.getString("issueDate"));


                userList.add(votingSystem);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return userList;
    }



    //deleting user from database
    public void deleteUser(int id) {
        String query = "Delete from voter where id = ?";
        PreparedStatement preparedStatement1 = new DBConnection().getStatement(query);

        try {
            preparedStatement1.setInt(1, id);
            preparedStatement1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //changing user password
    public VotingSystem changePw(int id, String password){
        String query= "select * from voter where id=? and password=?";
        PreparedStatement preparedStatement= new DBConnection().getStatement(query);
        VotingSystem votingSystem= null;

        try{
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                votingSystem= new VotingSystem();

                votingSystem.setId(resultSet.getInt("id"));
                votingSystem.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return votingSystem;
    }

    //display candidate details
    public Candidate candidateDetails(int canId){
        String query = "Select * from candidate where canId =?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        Candidate candidate = new Candidate();


        try{
            preparedStatement.setInt(1, canId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while( resultSet.next()){
                candidate.setCanId(resultSet.getInt("canId"));
                candidate.setCandidateProfile(resultSet.getString("candidateProfile"));
                candidate.setFullNameCandidate(resultSet.getString("fullNameCandidate"));
                candidate.setEmailCandidate(resultSet.getString("emailCandidate"));
                candidate.setAgeCandidate(resultSet.getInt("ageCandidate"));
                candidate.setAddressCandidate(resultSet.getString("addressCandidate"));
                candidate.setGenderCandidate(resultSet.getString("genderCandidate"));
                candidate.setCandidate(resultSet.getString("candidate"));
                candidate.setExperience(resultSet.getString("experience"));
                candidate.setVotes(resultSet.getInt("votes"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return candidate;
    }

    //vote in candidate
    public void getVotes(int id) {
        String query = "UPDATE candidate SET votes = votes + 1 WHERE canId = ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //if user has voted
    public boolean userHasVoted(String sessionId, int userId){
        String query = "SELECT COUNT(*) FROM vote WHERE sessionId = ? and userId=?";
        boolean hasVoted = false;
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, sessionId);
            preparedStatement.setInt(2, userId);

            ResultSet resultSet = preparedStatement.executeQuery();

            // If the result set has a row, the user has already voted
            if (resultSet.next() && resultSet.getInt(1) > 0) {
                hasVoted = true;
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return hasVoted;
    }

    //insert votes when user voted
    public void insertVote(Vote vote){
        String query = "Insert into vote (sessionId, userId, candidateId) values(?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, vote.getSessionId());
            preparedStatement.setInt(2, vote.getUserId());
            preparedStatement.setInt(3, vote.getCandidateId());
            preparedStatement.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    //deleting session
    public void deleteSession(){
        String query = "Truncate table vote";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    //deleting candidate table data
    public void deleteCandidateTable(){
        String query = "Truncate table candidate";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    //get total voters
    public int totalVoters(){
        int totalVote = 0;
        String query ="SELECT COUNT(DISTINCT voteId) FROM vote";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                totalVote = resultSet.getInt(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalVote;
    }

    //get total users
    public int totalUsers(){
        int totalUser = 0;
        String query ="SELECT COUNT(DISTINCT id) FROM voter";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                totalUser = resultSet.getInt(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalUser;
    }

    //get total candidates
    public int totalCandidates(){
        int totalCandidate = 0;
        String query ="SELECT COUNT(DISTINCT canId) FROM candidate";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                totalCandidate = resultSet.getInt(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return totalCandidate;
    }

    //get total candidates
    public int countElection(){
        int total = 0;
        String query ="SELECT COUNT(DISTINCT EId) FROM election";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try{
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                total = resultSet.getInt(1);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

}
