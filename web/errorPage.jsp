<%-- 
    Document   : errorPage
    Created on : 27-Mar-2024, 11:41:26 pm
    Author     : Mr Kalwar
--%>

<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something Went Wrong</title>
        
        
           <!-- CSS -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        <div class ="container text-center">
            <img src="img/dizzy-robot.png" class="img-fluid">
            <h3 class= "display-3"> sorry! Something went Wrong</h3>
            <a href = "index.jsp" class="btn primary-background btn-lg text-white mt-3" style = "border-radius: 50px; width:100px;">Home</a>
        </div>
    </body>
</html>
