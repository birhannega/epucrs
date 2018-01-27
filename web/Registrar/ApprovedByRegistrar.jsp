<%-- 
    Document   : SUbmissionMark
    Created on : Jan 26, 2017, 2:30:11 AM
    Author     : seid
--%>

<%@page import="java.time.Year"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>

    <head>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    
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
                        <%--<%@include file="../common/InstructorSidebar.jsp" %>--%>
                        <%@include file="sidemenu.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
         
        
<form method="post"action="${pageContext.request.contextPath}/RegistrarApproval_controller" 
               id="mark" name="mark" onsubmit="return valiatemark(this)">
         ${inserted}
             <h4 class="text-center">Registrar Mark Approval Form</h4>
      
<div class="span12">
           
                    <div class="form-group col-lg-4 container">
                        <%-- filtter course get session where academicStaffid=session.id--%>
                        Module Code <select class="form-control" name="course" id="course" onchange="showState(this.value)">
                                <option value="">select course Code</option>  
                    
                          <%String course=null,module_title=null,program=null,year=null,term=null,id=null; int crh=0;
                              
                              connectionManager con=new connectionManager();
                          Statement st_course=con.getconnection().createStatement();
                          ResultSet rs_course=st_course.executeQuery("select distinct course_code,program_id,term from tbl_test");
                          while(rs_course.next()){
                              course=rs_course.getString("COURSE_CODE");
                                 program=rs_course.getString("program_id");
                                  term=rs_course.getString("term");
                                
                              %><option>
                            <%=course%>
                              
                          </option>
                 <%
}%>
                        </select>
                        
                       
                    
                    
                    </div>
                        
                    <div class="form-group col-lg-4">
                        
                        Module Title
                        <%
                          Statement st_module_title=con.getconnection().createStatement();
                      ResultSet rs_module_title=st_module_title.executeQuery("select * from TBL_COURSE_REGISTRATION where course_code='"+course+"'");
                      while(rs_module_title.next()){
                          module_title=rs_module_title.getString("COURSE_NAME");
                              crh=rs_module_title.getInt("CREDIT_HOURS");
                                                         

                              
} String academicyear=null;
                        Statement st_academicyear=con.getconnection().createStatement();
                        ResultSet rs_academicyear=st_academicyear.executeQuery("select * from tbl_setup where CURRENT_STATUS='Active'");
                        while(rs_academicyear.next()){
                            academicyear=rs_academicyear.getString("ACADAMIC_YEAR");
                            out.println(academicyear);
                            
}%>
<input type="text"  class="form-control" value="<%=module_title%>" readonly="readonly">
                    </div>
                        
                    <div class="form-group col-lg-4">
                        CHrs<input type="text" class="form-control" value="<%=crh%>" name="crh" disabled>
                    </div>
                    <div class="form-group col-lg-4">
                     Program
                  
                     <input type="text" class="form-control" value="<%=program%>" class="form-control"disabled>
                    </div>

                    <div class="form-group col-lg-4">
                     
                                 Current Date
                                                                          
                            <%!DateFormat year = new SimpleDateFormat("yyyy-MM-E");
                            DateFormat currentyear=new SimpleDateFormat("yyyy");
                            //String activeyear= currentyear.format(new Date());
                             String now = year.format(new Date());
                             
                            %> 
                         
                             <b><input type="text" value="<%=now%>"class="form-control" disabled></b>
                    </div>
                    <div class="form-group col-lg-4">
                        Academic Year<input type="tex" value="<%=academicyear%>" class="form-control" disabled>
                    </div>
                                                                                         

                    <div class="form-group col-lg-4">
                        
                        Term<input type="text" class="form-control" value="<%=term%>" disabled> 
                        
                  </div>
                            <div class="form-group col-lg-4">
                                <%-- registrar officre id get from session --%>
                        Registrar Officer Name <input type="text" class="form-control" value="" name="Registrarofficer">
                    </div>
                        <div class="form-group col-lg-4">
                        <%-- year must be include in student profile update--%>
                        Year<input type="text" class="form-control" value=""> 
                        
                  </div>
                <table id="table" class="table table-striped table-bordered dt-responsive nowrap" width="98%" cellspacing="0">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>40%</th>
                <th>60%</th>
                <th>100%</th>
               </tr>
        </thead>
        <tbody>
         <%String stud_id=null,firstname=null,middlename=null,fullname=null,room=null;float mark_100=0,finalexam=0,mark_60=0;
           
             Statement st_student=con.getconnection().createStatement();
         ResultSet rs_student=st_student.executeQuery("select * from TBL_STUDENT_PROFILE_DATA_TABLE,tbl_mark where tbl_mark.stud_id=TBL_STUDENT_PROFILE_DATA_TABLE.stud_id and status=2");
         while(rs_student.next()){
          // id=rs_student.getString("stud_id"); 
         
                stud_id=rs_student.getString("stud_id");
        firstname=rs_student.getString("stud_first_name");
        middlename=rs_student.getString("STUD_MIDDLE_NAME");
        mark_60=rs_student.getFloat("mark_60");
         finalexam=rs_student.getFloat("mark_40");
           mark_100=rs_student.getFloat("total");
        
         fullname=firstname.concat(middlename);
           //out.println(stud_id);
         
    
         %>  
        
             <tr>
                 <td>
                    <%=stud_id%>
                </td>
                       <td><%=firstname+  " "  + middlename%></td>
            <td><%=finalexam%></td><input type="hidden"  value="<%=finalexam%>" >
	             <td><%=mark_60%></td><input type="hidden"   value="<%=mark_60%>"  >
           <input name="" type="hidden" value="Pending">
                           <input  type="hidden" value="r/001/2010">
                           
                             <input  type="hidden" value="<%=now%>"> 
                             
                <input type="hidden"value="<%=academicyear%>">
               <input  type="hidden"value="<%=course%>"> 
          
                <td><%=mark_100%></td><input type="hidden"  value="<%=mark_100%>">
                     <input type="hidden" value="<%=program%>">
                   <input type="hidden" class="form-control"name="studid" value="<%=stud_id%>">
                 <input  type="hidden" value="<%=term%>">
                    <input name="Registrar_office_name" type="hidden" value="seid">
               <input  type="hidden" value="<%=room%>">
          <input type="hidden" class="form-control"value="<%=fullname+""+middlename%>">
             
           
              
               
              
                </form>
                
               
             </tr>
            <%}%> </tbody>
                                        </table>
                                           <br>
             <div class="col-lg-2 pull-right">
                    <input type="submit" value="Approved"class="btn btn-primary pull-left" name="action"> 
             </div> <div class="col-lg-2 pull-right">
                  <input type="submit" value="Reject"class="btn btn-primary pull-left" name="action">
         
             </div>
                     
                                   
             <p>Instructor's Title& Full Name_____________________Signature________Date_________</p>
               <p>Instructor's Education Level __________________________________</p>
                <p>Instructor's Organization/institution(where he/she has come from)_________________</p>
                 <p>Exam and Result Approval Committee Charirman ____________Signature________Date_________</p>
                  <p>Program Manager_____________________Signature________Date_________</p>
     
     
     
     
                                      </div>
                                   
     
                                      </div>
            	               
                                
               
                    </div>
                         <%
                        
                    %>
                      
        <link href="../resources/DataTables-1.10.15/css/responsive.bootstrap.min..css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTables-1.10.15/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/DataTables-1.10.15/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/DataTables-1.10.15/js/jquery-1.12.4.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/responsive.bootstrap.min.js" type="text/javascript"></script>
         <script src="../resources/DataTables-1.10.15/js/dataTables.responsive.min.js" type="text/javascript"></script>
       <script src="../resources/DataTables-1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
         
            <script type="text/javascript">
                function editmark(){
                    $("#editmark").click(function(e){
                        e.preventDefault();
                        alert("dff");
                        
                    });
                }
                
                
            </script>
            
               <script type="text/javascript">
$(document).ready(function() {
    $('#table').DataTable();
} );
    </script> 
<%%>