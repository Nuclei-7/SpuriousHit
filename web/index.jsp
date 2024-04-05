<%-- 
    Document   : index
    Created on : 25-Mar-2024, 9:50:04 am
    Author     : Mr Kalwar
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        
        <!-- CSS -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        
        <!-- navbar -->
        
        <%@include file = "normal_navbar.jsp"%>
        
        <!-- banner -->
                <div class="container-fluid p-0 m-0">
                   <div class="jumbotron primary-background text-white">
                       <div class="container">
                           <h3  class = "display-3">Welcome, Friends</h3>
                           <h3>Spurious Hit</h3>
                           <p>Welcome to the world of Logic, Initiative by Digiankiya</p>
                             
                           <button class="btn btn-outline-light btn-lg" ><span class="	fa fa-bolt"></span>Start ! its Free </button>
                           <a href ="loginPage.jsp" class="btn btn-outline-light btn-lg" ><span class="fa fa-key fa-spin"></span>Login </a>

                       </div>
                   </div>     
               </div>
        <!-- cards -->
        <div class="container">
           
            <div class ="row mb-2">
                <div class = "col-md-4">
                    
                  
                       <div class="card" style= "width: 18rem;">
                           
                           
                              
                           <img class="card-img-top" src="img/java.png" alt="Card image cap">
                            
                          <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Java is a popular programming language.Java is used to develop mobile apps, web apps, desktop apps, games and much more.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                          </div>
                        </div>
       
                    
                </div>
                <div class = "col-md-4">
                    
                       <div class="card" style="width: 18rem;">
                           <img class="card-img-top" src="img/php.png" alt="Card image cap">
                          <div class="card-body">
                            <h5 class="card-title">PHP web development</h5>
                            <p class="card-text">Java is a popular programming language.Java is used to develop mobile apps, web apps, desktop apps, games and much more.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                          </div>
                        </div>
                    
                </div>
                <div class = "col-md-4">
                    
                       <div class="card" style="width: 18rem;">
                           <img class="card-img-top" src="img/python.png" alt="Card image cap">
                          <div class="card-body">
                            <h5 class="card-title">Python Programming </h5>
                            <p class="card-text">Python is a popular programming language.Python can be used on a server to create web applications.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                          </div>
                        </div>
                    
                </div>
                
            </div>
            <div class ="row" >
                <div class = "col-md-4">
                    
                       <div class="card" style="width: 18rem;">
                           <img class="card-img-top" src="img/kotlin.png" alt="Card image cap">
                          <div class="card-body">
                            <h5 class="card-title">Kotlin & Android Development</h5>
                            <p class="card-text">This Kotlin for Android Tutorial can also be used as an ‘entry point’ for Android App Development. Kotlin is sponsored by Google</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                          </div>
                        </div>
                    
                </div>
                <div class = "col-md-4">
                    
                       <div class="card" style="width: 18rem;">
                           <img class="card-img-top" src="img/mern.jpg" alt="Card image cap">
                          <div class="card-body">
                            <h5 class="card-title">The MERN Stack</h5>
                            <p class="card-text">The MERN stack is a collection of technologies that help developers build robust and scalable web applications using JavaScript.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                          </div>
                        </div>
                    
                </div>
                <div class = "col-md-4">
                    
                       <div class="card" style="width: 18rem;">
                           <img class="card-img-top" src="img/c++.png" alt="Card image cap">
                          <div class="card-body">
                            <h5 class="card-title"> C++ Programming Language</h5>
                            <p class="card-text">C++ is a fast and strongly-typed programming language which makes it an ideal choice for developing operating systems.</p>
                            <a href="#" class="btn primary-background text-white">Read More</a>
                          </div>
                        </div>
                </div>  
            </div>
        </div>
        <!-- javascipt -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" 
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
        crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
   
        
        <footer>
            
             <%@include file = "footer.jsp"%>
        </footer>
        
        
    </body>
</html>
