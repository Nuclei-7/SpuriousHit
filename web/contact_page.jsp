<%-- 
    Document   : contact_page
    Created on : 05-Apr-2024, 11:26:36 pm
    Author     : Mr Kalwar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
         <%@include file = "normal_navbar.jsp" %>
      
         
      <main class ="d-flex justify-content-center"  style= "min-height: 100vh">
           
        
        
        <div class="container mt-4" style="width:600px">
            

                        <div class="card"  >
 
                            <div class ="card-header primary-background text-white text-center">
                                
                                <br>
                                <p>Contact Us</p>
                            </div>

                                <div class="card-body">
                                    
                                    <form action="submitContact.jsp" method="post">
                                        <label for="name">Name:</label>
                                        <input type="text" id="name" name="name" required><br><br>

                                        <label for="email">Email:</label>
                                        <input type="email" id="email" name="email" required><br><br>

                                        <label for="message">Message:</label><br>
                                        <textarea id="message" name="message" rows="4" required></textarea><br><br>

                                        <button type="submit">Send Message</button>
                                    </form>
                                
                                   
                                </div>
                            <div class="card-footer primary-background text-white text-center">
                                
                                 <p>  Spurious Hit.com </p>
                                
                            </div>
  
                            </div>
                
            </div>
            
            
        </main>
  
         
         <footer>
       <%@include file = "footer.jsp"%>
    </footer>
    </body>
</html>
