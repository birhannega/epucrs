<%-- 
    Document   : Re-grade
    Created on : Feb 6, 2017, 10:37:41 PM
    Author     : seid
--%>


<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
                        <link rel="stylesheet" href="../css/jQuery.steps.css"/>   
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
       <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
        <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <link href="../resources/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

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
                        <%@include file="../common/InstructorSidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
        
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/re-grade"name=""method="post">
         <% 
      GregorianCalendar cal = new GregorianCalendar();
     
    ;%>
        <h3 class=" text-center page-header container"><strong>Ethiopian Police University College<br>
                Grade/Mark/ Change Report Form</strong></h3>
        <div class="container col-lg-12 form-group ">
            <div class="form-group col-lg-4">
           Academic Year<input type="text" value="<% out.print(cal.get(Calendar.YEAR)); %>"name="year"class="form-control"size="12px;" readonly="readonly">
            </div>
            <div class="form-group col-lg-4">
   Program<select class="form-control"  name="program">
   <%String program=null;
       connectionManager con=new connectionManager();
   Statement st_regrade=con.getconnection().createStatement();
   ResultSet rs_regrade=st_regrade.executeQuery("select distinct program_id  from TBL_COURSE_REGISTRATION");
   while(rs_regrade.next()){
       %>
       <option>
       <%
       program=rs_regrade.getString("program_id");
       out.println(program);
   }

   %>
       </option>
                          </select>
            </div>

       <div class="form-group col-lg-4">
   select Term<select input type="text"name="term" class="form-control">
       <%String term=null;
           Statement st_term=con.getconnection().createStatement();
       ResultSet rs_term=st_term.executeQuery("select distinct term from TBL_COURSE_REGISTRATION");
       while(rs_term.next()){
           term=rs_term.getString("term");
%>
<option>
    <%=term%> 
       <%}%>
        </option> 
       </select>
       </div>
      
        <div class="form-group col-lg-4">
            Student ID<input type="text" name="studid" class="form-control">
            
        </div>
         
        <div class="form-group col-lg-4">
            Module Code<input type="text" name="modulename" class="form-control">
            
        </div>
        <div class="form-group col-lg-4">
            Change From<input type="text" name="changeform" class="form-control">
        </div>
        <div class="form-group col-lg-4">
            Change To<input type="text" name="changeto" class="form-control">
            
        </div>
        <div class="form-group col-lg-4">
            Reason For Change<textarea type="text" name="reason" class="form-control"></textarea>
        </div>
          <%!DateFormat year = new SimpleDateFormat("yyyy-MM-E");
                            DateFormat currentyear=new SimpleDateFormat("yyyy");
                            //String activeyear= currentyear.format(new Date());
                             String now = year.format(new Date());
                             
                            %>
        <div class="form-group col-lg-4">
            Report Date<input type="text" name="date" class="form-control" value="<%=now%>" readonly="">
        </div>
                <input type="submit" value="submit" class="btn btn-primary pull-right">
          </div>

        </form>
    </body>
</html>
