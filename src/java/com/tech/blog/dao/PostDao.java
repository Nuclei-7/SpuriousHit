/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;
/**
 *
 * @author Mr Kalwar
 */


// dao - Data access objects
public class PostDao {

    Connection con;

    // Constructor to initialize the connection
    public PostDao(Connection con) {
        this.con = con;
    }

    // Method to get all categories
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from categories";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // Method to save a post
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into posts(pTitle,pContent,pCode,pPic, catId, userId) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode()); 
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    // get all post
    public List<Post>getAllPosts(){
        
        
        
        List<Post> list = new ArrayList<>();
        // fetch all the post
        try{
                PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                
                
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post post = new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
                
                list.add(post);
            }
                    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return list;
    }
    
    public List<Post>getPostByCatId(int catId){
         List<Post> list = new ArrayList<>(); // Initialize the list
        
// get all post by id
        
         try{
            PreparedStatement p = con.prepareStatement("select * from posts where catId = ?");
            p.setInt(1,catId);
            ResultSet set = p.executeQuery();
            
            while(set.next()){
                
                
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
              
                int userId = set.getInt("userId");
                
                Post post = new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
                
               list.add(post);
            }
                    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    public Post getPostByPostId(int postId){
        
        
        Post post = null;
        String q = "select * from posts where pid=?";
        
        try{
        
        PreparedStatement p = this.con.prepareStatement(q);
         
         p.setInt(1,postId);
         
         ResultSet set = p.executeQuery();
         
         
         
         if(set.next()){
             
             
             
             
               int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid = set.getInt("catId");
              
                int userId = set.getInt("userId");
                
                 post = new Post(pid,pTitle,pContent,pCode,pPic,date,cid,userId);
  
         }
         
         
         
        }catch(SQLException e){
            e.printStackTrace();
            
        }
        
        return post;
    }
    
    
    public User getUserByUserId(int userId) {
    User user = null;
    try {
        String q = "SELECT * FROM user WHERE id=?";
        PreparedStatement ps = this.con.prepareStatement(q);
        ps.setInt(1, userId);
        ResultSet set = ps.executeQuery();
        if (set.next()) {
            user = new User();
            user.setId(set.getInt("id"));
            user.setName(set.getString("name"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setDateTime(set.getTimestamp("rdate"));
            user.setProfile(set.getString("profile"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return user;
}



}