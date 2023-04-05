package VotingService;

import DatabaseConnection.DBConnection;
import Model.Candidate;
import Model.Election;
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

    public void addCandidate(Candidate candidate) {
        String query = "INSERT INTO candidate(candidateProfile,fullNameCandidate, emailCandidate, ageCandidate, addressCandidate, genderCandidate, candidate, experience)" + "values(?,?,?,?,?,?,?,?)";
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

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

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
                candidate.setAgeCandidate(Integer.parseInt(resultSet.getString("ageCandidate")));
                candidate.setAddressCandidate(resultSet.getString("addressCandidate"));
                candidate.setGenderCandidate(resultSet.getString("genderCandidate"));
                candidate.setCandidate(resultSet.getString("candidate"));
                candidate.setExperience(resultSet.getString("experience"));


                candidateList.add(candidate);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return candidateList;
    }
}
