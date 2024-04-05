<%-- 
    Document   : loginPage
    Created on : 25-Mar-2024, 12:55:30 pm
    Author     : Mr Kalwar
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        
          <!-- CSS -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
               <style>
            body{
               background-color: #f9fcff;
               background-image: linear-gradient(147deg, #f9fcff 0%, #dee4ea 74%);

             }
             </style>
     <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
      integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
      crossorigin="anonymous"
    ></script>
        
        
    
        
    </head>
    
   
        
    <body >
        <!-- navbar -->
        <%@include file = "normal_navbar.jsp" %>
        
  
                                  
        <main class ="d-flex align-items-center justify-content-center"  style= "min-height: 100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card login_card" id="login-card">
                            
                                  
                            
                            <div class ="card-header primary-background text-white text-center">
                                <span class ="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p>
                            </div>

                             <%
                                  
                                      Message m = (Message) session.getAttribute("msg");

                                      // Checking if the message object exists
                                      if (m != null) {
                              %>
                                          <div class="alert alert-success" role="alert">
                                              <%= m.getContent() %>
                                          </div>
                              <%
                                          // Removing the message from the session
                                          session.removeAttribute("msg");
                                      }
                                  
                              %>

                            
                            
                              
                            <div class="card-body">
                                
                                  <form action ="loginServlet" method="post" id="login-form">
                                            <div class="form-group">
                                              <label for="exampleInputEmail1">Email address</label>
                                              <input name ="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                              
                                            </div>
                                            <div class="form-group">
                                              <label for="exampleInputPassword1">Password</label>
                                              <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                            </div>
                                            <div class="form-check">
                                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                              <label class="form-check-label" for="exampleCheck1">Remember me!</label>
                                            </div>
                                      <center>
                                            <button type="submit" id ="loginbtn" class="btn primary-background text-white" style = "border-radius: 50px; width:100px;  margin-top: 1rem ;">Login</button>
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                      </center>
                                          </form>
                                </div>
                                  
                              
                                
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
            
        </main>
        
        
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
        
    <script>
        localStorage.removeItem("underDev");
    </script>
        

    </body>
</html>
