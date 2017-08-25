<%-- 
    Document   : edit
    Created on : Aug 21, 2017, 9:31:24 PM
    Author     : seid
--%>

<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<!DOCTYPE >
<html>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <head>
        <link href="../bootstrap/DataTable/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
       <%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->
<%@include file="../common/imports.jsp" %>
    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
            
               
            <div class="container">
            
                <table class="table table-condensed col-lg-6" id="table" style="margin-right:-240px;">
                <thead><tr><th>
                credit hour
                    </th>
                       <th>
                    course code
                    </th>
                    <th>
                    course name
                    </th>
                    <th>
                   title
                    </th>
                    <th>
                 pre_request
                    </th>
                    <th>
                    course type
                    </th>
                    </tr>
            </thead>
            <tbody>
                        <%
                        connectionManager dbcon=new connectionManager();
                        Statement st=dbcon.getconnection().createStatement();
                        ResultSet rs=st.executeQuery("select * from TBL_TRAINING ");
                        while(rs.next())
                     {%><tr>
        <form method="post" action="${pageContext.request.contextPath}//editTraining">
       <td><input type="text" name="creditehour" value="<%=rs.getString("CREDIT_HOUR")%>"></td>
       <td><input type="text" name="course_code" value="<%=rs.getString("COURSE_CODE")%>"></td>
        <td><input type="text" name="course_name" value="<%=rs.getString("COURSE_NAME")%>"></td>
          <td><input type="text" name="title" value="<%=rs.getString("TITLE")%>"></td>
            <td><input type="text" name="PRE_REQUEST" value="<%=rs.getString("PRE_REQUEST")%>"></td>
              <td><input type="text" name="COURSE_TYPE" value="<%=rs.getString("COURSE_TYPE")%>"></td>
    <td><input type="submit" name="submit" value="update"style="background-color:#49743D;font-weight:bold;color:#ffffff;">
    </td>
                      
                    
                    </form>
            </tr>
              </tbody>
<%}%>
            </table>
        </div>
                </div>
            </div>
    </body>
</html>
                    	<script type="text/javascript">
$(document).ready(function()
		{
$("#table").bdt();	
});
</script>