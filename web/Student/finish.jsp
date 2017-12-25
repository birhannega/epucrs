<%-- 
    Document   : finish
    Created on : Nov 10, 2017, 10:48:53 AM
    Author     : luv2codeit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>finish</title>
       
        <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
            <h4 class="alert alert-success ">congrats!You have successfully finished registration</h4>
            <p>${message}</p>
               
               <div class="col-lg-6">
                   <strong>create user account to login</strong><hr>
                   <form class="form-group" action="${pageContext.request.contextPath}/createaccount" id="userform" method="POST">
                   <div class="form-group ">
                       <label>User name</label>
                       <input type="text" class="form-control" name="username" placeholder="Enter username"/>
                       
                   </div>
                   <div class="form-group ">
                       <label>password</label>
                       <input type="text" class="form-control" name="password" placeholder="Enter password"/>
                       
                   </div>
                   <div class="form-group">
                       <label>confirm password</label>
                       <input type="text" class="form-control" name="cpassword" placeholder="confirm password"/>
                       
                   </div>
                       <input type="hidden" class="form-control" name="stud_id" value="<%=session.getAttribute("studentId") %>" />
                   <input type="submit" class="btn btn-primary pull-right" value="Create account"/>
               </form>
        </div>
        </div>
     
        
    </body>
</html>
