package VotingService;

import DatabaseConnection.DBConnection;
import Model.VotingSystem;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VotingService {

    //Saving details for registration form and registering user
    public void authorizeUser(VotingSystem votingSystem) {
        String query = "INSERT INTO voter(email,dob,password,fullName,address,gender,citizenNo,issueDistrict,issueDate)" + "values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, votingSystem.getEmail());
            preparedStatement.setString(2, votingSystem.getDob());
            preparedStatement.setString(3, votingSystem.getPassword());
            preparedStatement.setString(4, votingSystem.getFullName());
            preparedStatement.setString(5, votingSystem.getAddress());
            preparedStatement.setString(6, votingSystem.getGender());
            preparedStatement.setString(7, votingSystem.getCitizenNo());
            preparedStatement.setString(8, votingSystem.getIssueDistrict());
            preparedStatement.setString(9, votingSystem.getIssueDate());

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
}
