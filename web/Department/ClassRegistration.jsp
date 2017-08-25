<%-- 
    Document   : ClassRegistration
    Created on : 17-Aug-2017, 11:39:49
    Author     : user
--%>
<%@include file="../common/imports.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <div class="container-fluid col-lg-12">
            <%@include file="../common/department_nav.jsp" %>
        </div>
        <div class="container col-lg-2">
            <%@include file="../common/department_sidebar.jsp" %>
        </div>
        <div class="container col-lg-10">
            <div class="form-group col-lg-4">
                <label>BlockNo</label>
                <input class="" type="text" name="classblockno" id="classblockno" placeholder="Enter Block No">
            </div>  
             <div class="form-group col-lg-4">
                <label>ClassName</label>
                <input class="" type="text" name="classname" id="classname" placeholder="Enter Class Name">
            </div>  
              <div class="form-group col-lg-4">
                <label>Date</label>
                <input class="" type="date" name="classdate" id="classdate" placeholder="Enter Date">
            </div>  
        </div>
    </body>
</html>
<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
    $("#classdate").datepicker({
        changeMonth: true,
        changeYear: true

    });
</script>