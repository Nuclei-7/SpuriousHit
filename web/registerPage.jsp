<%-- 
    Document   : registerPage
    Created on : 25-Mar-2024, 2:27:45 pm
    Author     : Mr Kalwar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
            
        <!-- CSS -->

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Custom CSS -->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            body{
               background-color: #f9fcff;
               background-image: linear-gradient(147deg, #f9fcff 0%, #dee4ea 74%);

             }
             </style>
    </head>
    <body>
       <!-- navbar -->
        <%@include file = "normal_navbar.jsp" %>
        
        <main style="min-height: 100vh">
            <div container ="container">
                <div class="col-md-4 offset-md-4">
                    
                    <div class="card" style = "margin-top: 9rem ;">
                        <div class="card-header primary-background text-white text-center">
                            <!-- User Icon -->
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here
                        </div>
                        <div class="card-body">
                            <form id = "reg-form"action ="RegisterServlet" method="POST">
                                    <div class="form-group">
                                      <label for="user_name">User Name</label>
                                      <!-- Input for User Name -->
                                      <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name" required>
                                     
                                    </div>
                                
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <!-- Input for Email -->
                                      <input name ="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      
                                    </div>

                                    <div class="form-group">
                                       <label for="exampleInputPassword1">Password</label>
                                       <!-- Input for Password -->
                                       <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" onkeyup="validatePassword()">
                                       <small id="passwordHelp" class="form-text text-danger"></small>
                                   </div>
                                
                                   <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <!-- Radio buttons for gender selection -->
                                    <input type="radio" id="gender" name="user_gender" value ="male" required>Male
                                    <input type="radio" id="gender" name="user_gender" value ="female" required>Female
                                   </div>
                                
                                
                                    <div class="form-check">
                                      <!-- Checkbox for terms and conditions -->
                                      <input name ="check" type="checkbox" class="form-check-input" id="exampleCheck1" required>
                                      <label class="form-check-label" for="exampleCheck1">I agree Terms and Conditions</label>
                                    </div>
                                    <br>
                                    
                                    <div class = "container text-center" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-2x"></span>
                                        <h4 class = "text-danger">Redirection to Login Page...</h4>
                                        
                                    </div>
                                    
                                    <center>
                                        <!-- Submit button -->
                                        <button id ="submit-btn" type="submit" class="btn primary-background text-white" style="border-radius: 50px; width:100px; margin-top: 1rem;">Signup</button>
                                    </center>
                                    
                                    <!-- Helper text -->
                                    <center>
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your data with anyone else.</small>
                                    </center>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
   
 <script>
    $(document).ready(function(){
        console.log("loaded....");
        $("#submit-btn").show();
            $("#loader").hide();

        $('#reg-form').on('submit', function(event){
            event.preventDefault();

            let form = new FormData(this);
            
            
             $("#submit-btn").hide();
                    $("#loader").show();
            //send register servlet;
            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function(data, textStatus, jqXHR){
                    console.log(data);
              
                   function RedirectLogin(){
                       $("#submit-btn").show();
                    $("#loader").hide();
                       window.location.href = "loginPage.jsp"
                        
                    }
                    
                if(data){
                   setTimeout(RedirectLogin,3000) 
                   }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    console.log(jqXHR);

                    // Hide loader, show submit button
                    $("#submit-btn").show();
                    $("#loader").hide();
                    
                    
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>


<script>
    function validatePassword() {
        var passwordInput = document.getElementById("exampleInputPassword1");
        var password = passwordInput.value;
        var passwordHelp = document.getElementById("passwordHelp");

        // Regular expression for password validation
        var strongPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$/;

        if (password.match(strongPassword)) {
            passwordHelp.textContent = "";
        } else {
            passwordHelp.textContent = "Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character (!@#$%^&*).";
        }
    }
</script>




    
        <footer>
            
             <%@include file = "footer.jsp"%>
        </footer>
    
    
    </body>
</html>
