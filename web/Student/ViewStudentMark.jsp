<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student mark</title>
      
    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">

                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <%@include file="../common/depsideheader.jsp" %>

                    </div>

                    <!-- Main Menu -->
                    <div class="side-menu-container">
                        <%@include file="../common/studsidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                <form action="" method="Post">
                <div class="col-lg-4 form-inline">
                    <h3>Student Online Mark View Form</h3>
                    <input type="text" class="form-control" name="stud_id"placeholder="enter student id">
                <input type="submit" value="Search" class=" form-inline btn btn-primary pull-right">
                </div>
                </form>
                <%String stud_id=request.getParameter("stud_id");
                if(stud_id==null||stud_id==""){
                    
              
                   }
                else {
                String id=null,name=null,grade=null,course_code=null,program=null; float mark_40=0,mark_60=0,total=0;
                        connectionManager con=new connectionManager();
                    Statement  st_view_mark=con.getconnection().createStatement();
                    ResultSet rs_view_mark=st_view_mark.executeQuery("select * from tbl_mark,TBL_STUDENT_PROFILE where status=3 and TBL_STUDENT_PROFILE.stud_id=tbl_mark.stud_id and tbl_mark.stud_id='"+stud_id+"'");
                    if(rs_view_mark.next()){
                        id=rs_view_mark.getString("STUD_ID");
                        //out.println(id);
                        name=rs_view_mark.getString("STUD_FIRST_NAME");
                        grade=rs_view_mark.getString("GRADE");
                        course_code=rs_view_mark.getString("course_code");
                        mark_40=rs_view_mark.getFloat("mark_40");
                        mark_60=rs_view_mark.getFloat("mark_60");
                        total=rs_view_mark.getFloat("TOTAL");
                        program=rs_view_mark.getString("PROGRAM_id");
                      
    %>
   
    <h2 class="text-info pull-right"> <u>Well Come To Student</u>:<%=name%></h2>
            </div>
            <div class="col-lg-8 col-lg-offset-3">
               <table id="table" class="table table-striped table-bordered dt-responsive nowrap" width="100%" cellspacing="0">
                 <thead>
                    <th>Student id</th>
                    <th>Student name </th>
                    <th>grade</th>
                    
                    <th>40%</th>
                    <th>60%</th>
                    <th>100%</th>
                    <th>Program</th>
                       <th>Module Code</th>
                    </thead>
                     <tbody>
                        <tr>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=name%>
                            </td>
                            <td>
                                <%=grade%>
                            </td>
                           
                            <td>
                                <%=mark_40%>
                            </td>
                            <td>
                                <%=mark_60%>
                            </td>
                            <td>
                                <%=total%>
                            </td>
                            <td><%=program%></td>
                            <td><%=course_code%></td>
                            </tr>
                        <%}
    else if(!rs_view_mark.next()){
%>
                     <h3 class="col-md-6" style="color: red"> Student id can't much </h3>                
                            <%
}}%>
                    </tbody>
                </table>
               </div>
        </div>
                                       
        <link href="../resources/DataTables-1.10.15/css/responsive.bootstrap.min..css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTables-1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTables-1.10.15/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/DataTables-1.10.15/js/jquery-1.12.4.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/responsive.bootstrap.min.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/dataTables.responsive.min.js" type="text/javascript"></script>
       <script src="../resources/DataTables-1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
     
                     <script type="text/javascript">
$(document).ready(function() {
    $('#table').DataTable();
} );
    </script> 
    </body>
</html>
