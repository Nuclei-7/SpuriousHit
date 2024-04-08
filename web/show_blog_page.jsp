<%-- 
    Document   : show_blog_page
    Created on : 03-Apr-2024, 1:09:58 am
    Author     : Mr Kalwar
--%>



<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="errorPage.jsp" %>





<% 
   User user = (User)session.getAttribute("currentUser");
   if(user == null){
     response.sendRedirect("loginPage.jsp");
    }
%>
<%
  int postId = Integer.parseInt(request.getParameter("post_id"));    
   PostDao d = new PostDao(ConnectionProvider.getConnection());
   Post p = d.getPostByPostId(postId);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || Spurious Hit Content </title>
        
        
          <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">

    
    
    <style>
        .post-title{
          font-weight: 100;
          font-size: 30px;
        }
        .post-content{
            font-weight: 100;
            font-size: 25px;
        }
        .post-date{
            font-style: italic;
            font-weight: bold;
        }
        .post-user-info{
            font-size: 20px;
           
        }
        .row-user{
            border: 1px solid #e2e2e2;
            padding-top: 15px;
        }
        body{
           background-color: #f9fcff;
          background-image: linear-gradient(147deg, #f9fcff 0%, #dee4ea 74%);

        }
   
    </style>
    
    <script>
         
         function doLike(pid, uid) {
    console.log(pid + "," + uid);

    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function(data, textStatus, jqXHR) {
            console.log(data);
            
            if(true){
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
               // console.log(c);
            }
            
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
  }
    </script>
        
 <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0" nonce="V9iOy3oc"></script>
        
    </head>
    <body>
        
        <!-- Nav bar -->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="profile.jsp"><span class="fa fa-asterisk"></span>Spurious Hit</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-file-code-o"></span>Learn DSA <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-diamond"></span> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Projects</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structures</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Post</a>
                </li>
            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- end of navbar -->
    
    
    <!-- main content of body -->
    
    <div class="container">
        <div clas="row my-4">            
            <div class="col-md-8 offset-md-2">                
                <div class="card" style="margin:1rem;">
                    
                    <div class="card-header primary-background text-white">
                        
                        <h4 class="post-title"><%= p.getpTitle() %></h4>
                        
                        
                        
                    </div>
                        
                        <div class="card-body">
                            
                  <img class="card-img-top my-2" src="blog_pic/<%= p.getpPic() %> " alt="Card image cap">    
                            
                  <div class="row my-3 row-user">
                      <div class="col-md-8">

                          
                         <% UserDao ud = new UserDao(ConnectionProvider.getConnection()); %>
                         
                        
                             <p class="post-user-info"> <a  href ="#!" style="color: blue!important"> <%= p.getUserId() %>  </a>    has posted </p> 

                      </div>
                      
                      <div class="row-md-4">
                          
                          <p class="post-date"><%= DateFormat.getDateInstance().format(p.getpDate()) %> </p>
                          
                          
                      </div>
                      
                  </div>
                            
                            
                            <p class="post-content"><%= p.getpContent() %></p>
                            
                            <br>
                            <br>
                            
                            <div class="post-code">
                            <pre><%= p.getpCode() %></pre>
                            </div>
                            
                        </div>
                            
                            <div class="card-footer primary-background">
                                
                                
                     <% LikeDao ld = new LikeDao(ConnectionProvider.getConnection()); %>

                                
                                
                                
                               <a href="#!" onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm">
                                   <i class="fa-solid fa-thumbs-up"></i>
                                    <span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span>
                                </a>            
                             <a href="#!" class="btn btn-outline-light btn-sm "><i class="fa-regular fa-comment"></i><span></span></a>
                    
                            </div>
                </div>
            </div>
        </div>
    </div>
  
    <!-- main content of body -->
        
    
    
    <!-- start of profile modal -->
    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <!-- Your profile content goes here -->
                    <div class="container">
                        <img src="pics/<%= user.getProfile()%>">
                        <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                    </div>
                    
                    <!-- details -->
                    <div id="profile-details">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Labels</th>
                                    <th scope="col">Values</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Since :</th>
                                    <td><%= user.getDateTime().toString() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                                
                    <!-- profile edit -->
                    <div id="profile-edit" style="display: none;">
                        <h3 class="mt-2">Please Edit Careful</h3>
                        
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID:</td>
                                    <td><%= user.getId() %></td>
                                </tr>
                                 <tr>
                                    <td>Name:</td>
                                    <td><input type="text" name="user_name" class="form-control" value="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <td>select new profile pic</td>
                                    <td>
                                        <input type="file" name="image" class="form-control">
                                    </td>
                                </tr>
                               
                            </table>
                                <div class ="container">
                                    <button type="submit" class="btn-outline-primary">save</button>
                                    
                                </div>
                                
                        </form>
                    </div>         
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end of profile modal -->
     <!-- start of post modal -->
     

                    <!-- Modal -->
                    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Provide post Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
           
                              <form id ="add-post-form" action="AddPostServlet method="post">
                                  <div class "form-group">
                                      <input name="pTitle" type="text" placeholder="Enter post Title" class ="form-control">
                                      
                                  </div>
                                  <div class="form-group">
                                      <textarea name ="pContent" class="form-control"style="height:300px" placeholder="Enter your content"></textarea>
                                      
                                      
                                  </div>
                                  <div class="form-group">
                                      <textarea name="pCode" class="form-control"style="height:200px" placeholder="Enter your code(if any)"></textarea>
                                      
                                      
                                  </div>
                                      <div class="form-group">
                                  <select class="form-control" name="cid">
                                  <option selected disabled>---Select Category---</option>
                                  
                                 <% 
                                       PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for(Category c: list) {
                                    %>
                                            <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                    <%
                                        }
                                    %>

                              </select>
                              </div>
                                  
                                  <div clas="form-group">
                                      <label>select your pic</label>
                                      <br>
                                      <input type="file" name ="pic">
                                      
                                  </div>
                                  
                                  <div class="container text-center">
                                      
                                      <button type="submit" class="btn btn-outline-primary">Post</button>
                                 </div>    
                              </form> 
                          </div>    
                        </div>
                      </div>
                    </div>

     
     <!-- end of post modal -->
    
    
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

      <script src="js/myjs.js" type="text/javascript"></script>

    <script>
        $(document).ready(function(){
            let editStatus = false;

            $('#edit-profile-button').click(function(){
                if(editStatus == false) {
                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    $(this).text("Back");
                    editStatus = true;
                } else {
                    $("#profile-details").show();
                    $("#profile-edit").hide();
                    $(this).text("Edit");
                    editStatus = false;
                }
            });
        });
        
        </script>
         <script>
                           $(document).ready(function() {
                               $("#add-post-form").on("submit", function(event) {
                                   event.preventDefault();
                                   console.log("You have clicked on submit");

                                   let form = $(this)[0];
                                   let formData = new FormData(form);

                                   // Now sending the form data to the server
                                   $.ajax({
                                       url: "AddPostServlet",
                                       type: 'POST',
                                       data: formData,
                                       processData: false,
                                       contentType: false,
                                       success: function(data, textStatus, jqXHR) {
                                           console.log(data);
                                           if (data) {
                                               swal("Good job!", "Posted!", "success");
                                           } else {
                                               swal("Something went wrong", "Can't post!", "error");
                                           }
                                       },
                                       error: function(jqXHR, textStatus, errorThrown) {
                                           console.error("Error:", errorThrown);
                                           swal("Something went wrong", "Can't post!", "error");
                                       }
                                   });
                               });
                           });
            </script>         
       
             <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
             <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
            <footer>
            
             <%@include file = "footer.jsp"%>
        </footer>
    </body>
</html>
