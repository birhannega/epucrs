<%-- 
    Document   : index
    Created on : Feb 22, 2017, 3:34:47 PM
    Author     : Birhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/login.css"/>
            <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"/>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
            <link rel="stylesheet" href="bootstrap/css/bootstrap.css"> 
        
    </head>
   
    <body>
        <div class="container"> 
            <h4 class="page-header text-capitalize text-ce ">Federal police university college registrar system </h4>  
        
        </div>
        
        
        
        <form name="login-form" class="login-form" action="" method="post">
	
		<div class="header">
		<h1>EFPUC registrar system</h1>
		<span>Please, fill this form</span>
		</div>
	
		<div class="content">
		<input name="username" type="text" class="input username" placeholder="Username" />
		<div class="user-icon"></div>
		<input name="password" type="password" class="input password" placeholder="Password" />
		<div class="pass-icon"></div>		
		</div>

		<div class="footer">
		<button href="#" class="button btn btn-primary">Login</button>
		</div>
	
	</form>
    </body>
</html>
