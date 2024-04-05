package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // method to insert user to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "INSERT INTO user(name, email, password, gender) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.executeUpdate();
            f = true;
            pstmt.close(); // Close PreparedStatement
        } catch (SQLException e) {
        }
        return f;
    }

    // method to get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setName(resultSet.getString("name"));
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setGender(resultSet.getString("gender"));
                user.setDateTime(resultSet.getTimestamp("rdate"));
                user.setProfile(resultSet.getString("profile"));
            }
            resultSet.close(); // Close ResultSet
            pstmt.close(); // Close PreparedStatement
        } catch (SQLException e) {
        }
        return user;
    }
    
    public boolean updataeUser(User user){
        boolean f= false;
        try{
            String query = "update user set name = ?, email=?, password=?, gender=?,profile=? where id =?";
            PreparedStatement p = con.prepareStatement(query);
            
            p.setString(1,user.getName());
            p.setString(2,user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            
            p.setString(5, user.getProfile());
            
            p.setInt(6,user.getId());
            
            p.executeUpdate();
            f  = true;

        }catch(Exception e){
            e.printStackTrace();
            
        }
        return f;
    }

    // method to check if a user exists with a given email
    public boolean isUserExists(String email) {
        boolean userExists = false;
        try {
            String query = "SELECT COUNT(*) AS count FROM user WHERE email = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                userExists = count > 0;
            }
            resultSet.close(); // Close ResultSet
            pstmt.close(); // Close PreparedStatement
        } catch (SQLException e) {
        }
        return userExists;
    }
}
