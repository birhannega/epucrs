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
            ${ClassReg}
            ${ClassNotReg}
            <p class="page-header text-primary text-center">Class Registration</p>
            
            <form class="form-horizontal" role="form" id="classform" action="${pageContext.request.contextPath}//ClassServlet">
                <div class="form-group col-lg-10">
                    <label for="blockname"  class="col-lg-4 col-sm-2 control-label">Block Name</label>
                    <div class="col-lg-6 col-sm-10">
                        <input type="text" class="form-control" id="blockname" name="blockname" 
                               placeholder="Enter Bloack Name">
                    </div>
                </div>
                <div class="form-group col-lg-10">
                    <label for="classname" class="col-lg-4 col-sm-2 control-label">Class Name</label>
                    <div class="col-lg-6 col-sm-10">
                        <input type="text" class="form-control" id="classname"  name="classname" 
                               placeholder="Enter Class Name">
                    </div>
                </div>
                <div class="form-group col-lg-10">
                    <label for="classdate" class="col-lg-4 col-sm-2 control-label" >Date</label>
                    <div class="col-lg-6 col-sm-10">
                        <input type="text" class="form-control" id="classdate"  name="classdate" 
                               placeholder="Enter class date">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary"><span class="fa fa-save"> Save Class Info</span></button>
                    </div>
                </div>
            </form>
            <%    request.getSession().setAttribute("ClassReg", null);
                    request.getSession().setAttribute("ClassNotReg", null);
                %>
        </div>
    </body>
</html>
<script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
    $("#classdate").datepicker({
        changeMonth: true,
        changeYear: true,
       dateFormat: 'yy-mm-dd'

    });
</script>