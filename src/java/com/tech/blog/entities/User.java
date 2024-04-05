package com.tech.blog.entities;
import java.sql.*;

/**
 *
 * @author Mr Kalwar
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp dateTime;
    private String profile;

    // Constructor with all fields
    public User(int id, String name, String email,String password ,String gender, Timestamp dateTime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.dateTime = dateTime;
    }
    
    // Default constructor
    public User(){
        
    }

    // Constructor without id (assuming id can be generated automatically)
    public User(String name, String email,String password, String gender, Timestamp dateTime) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.dateTime = dateTime;
    }
    // Getters and Setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
}
