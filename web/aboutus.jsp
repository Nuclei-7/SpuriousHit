<%-- 
    Document   : aboutus
    Created on : 05-Apr-2024, 9:32:13 pm
    Author     : Mr Kalwar
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <!-- You can link your CSS stylesheets here if needed -->
    
      <!-- CSS -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
     <%@include file = "normal_navbar.jsp"%>
    
    
   

    <main class ="d-flex justify-content-center"  style= "min-height: 100vh">
           
        
        
        <div class="container mt-4" style="width:600px">
            

                        <div class="card"  >
 
                            <div class ="card-header primary-background text-white text-center">
                                
                                <br>
                                <p>About the Developers</p>
                            </div>

                                <div class="card-body">
                                    
                                    <p><b>Shreekant Kalwar</b> : Frontend Engineer</p>
                                    <p>He is a BCA Student of Dibrugarh University, Assam </p>
                                    <p><b>Govind Kalwar</b> : Backend Engineer</p>
                                    <p>He is a MCA Student of Amity University,Noida<p>
                                
                                
                                   
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

    <!-- You can include your JavaScript files here if needed -->
</body>
</html>
