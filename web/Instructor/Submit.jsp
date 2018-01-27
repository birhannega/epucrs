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
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    
     
           </head>
<body>


        <!--      include side bar start-->
  
        <title>Exam Result Submission</title>
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
                        <%@include file="../common/InstructorSidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="col-lg-12 header">
              <%          connectionManager con=new connectionManager();
                  
                  float test1=0,midexam=0,final_40=0,conductevaluation=0,activity=0,Attendance=0,project=0;
                        if (request.getParameter("action") != null && request.getParameter("id") != null) {
                            String action = request.getParameter("action");
                            String sid = request.getParameter("id");
                            

                   String is=null,name=null,mname1=null;
                            if (action.equalsIgnoreCase("edit")) {
                         Statement st_edit_mark=con.getconnection().createStatement();
                         
                        ResultSet rs_edit = st_edit_mark.executeQuery(" select mark,tbl_test.stud_id,STUD_MIDDLE_NAME,STUD_FIRST_NAME from TBL_STUDENT_PROFILE,tbl_test where tbl_test.stud_id=TBL_STUDENT_PROFILE.stud_id  and tbl_test.stud_id='" +sid+ "' and test_type='test1'");
                        if (rs_edit.next()) {
                        test1=rs_edit.getFloat("mark");
                        is=rs_edit.getString("stud_id");
                          name=rs_edit.getString("STUD_FIRST_NAME");
                             mname1=rs_edit.getString("STUD_MIDDLE_NAME");
                        Statement st_midexam=con.getconnection().createStatement();
                        ResultSet rs_midexam=st_midexam.executeQuery("select * from tbl_test where stud_id='" +sid+ "' and test_type='mid' ");
                      if(rs_midexam.next()){
                          midexam=rs_midexam.getFloat("mark");
        }
                            Statement st_final_40=con.getconnection().createStatement();
                        ResultSet rs_final_40=st_final_40.executeQuery("select * from tbl_test where stud_id='" +sid+ "' and test_type='final' ");
                      if(rs_final_40.next()){
                          final_40=rs_final_40.getFloat("mark");
        }
                            Statement st_conductevaluation=con.getconnection().createStatement();
                        ResultSet rs_conductevaluation=st_conductevaluation.executeQuery("select * from tbl_test where stud_id='" +sid+ "' and test_type='conductevaluation' ");
                      if(rs_conductevaluation.next()){
                          conductevaluation=rs_conductevaluation.getFloat("mark");
        }
                            Statement st_activity=con.getconnection().createStatement();
                        ResultSet rs_activity=st_activity.executeQuery("select * from tbl_test where stud_id='" +sid+ "' and test_type='activity' ");
                      if(rs_activity.next()){
                          activity=rs_activity.getFloat("mark");
        }
                            Statement st_Attendance=con.getconnection().createStatement();
                        ResultSet rs_Attendance=st_Attendance.executeQuery("select * from tbl_test where stud_id='" +sid+ "' and test_type='Attendance' ");
                      if(rs_Attendance.next()){
                          Attendance=rs_Attendance.getFloat("mark");
        }
                            Statement st_project=con.getconnection().createStatement();
                        ResultSet rs_project=st_midexam.executeQuery("select * from tbl_test where stud_id='" +sid+ "' and test_type='project' ");
                      if(rs_project.next()){
                          project=rs_project.getFloat("mark");
        }}
                          //out.println(is);  %>
                    
               
                         <div class="form-group container">

                 
                                     <form class="form-group" action="${ pageContext.request.contextPath }/editMark" method="Post">
                            <!--<form class="form-group" action="../CommonOprations/EditCourse.jsp" method="Post">-->
                            <div class="form-group col-lg-3">
                                Student ID
                                <input class="form-control" type="text" name="stud_id" value="<%=is%>" readonly/>
                            </div>
                             <div class="form-group col-lg-3">
                                Student First Name
                                <input class="form-control" type="text" name="firstname" value="<%=name%>" readonly/>
                            </div>
                            <div class="form-group col-lg-3">
                                Student Middle Name
                                <input class="form-control" type="text" name="middlename" value="<%=mname1%>" readonly/>
                            </div> 
                            <div class="col-lg-4">
                                test 1
                                <input type="text" value="<%=test1%>" class="form-control" name="test1">
                            </div>
                             <div class="col-lg-4">
                                 project
                                 <input type="text" value="<%=project%>" class="form-control" name="project">
                            </div>
                             <div class="col-lg-4">
                                 attendance
                                 <input type="text" value="<%=Attendance%>" class="form-control" name="Attendance">
                            </div>
                             <div class="col-lg-4">
                                 activity
                                 <input type="text" value="<%=activity%>" class="form-control" name="activity">
                            </div>
                             <div class="col-lg-4">
                                 mid
                                 <input type="text" value="<%=midexam%>" class="form-control" name="midexam">
                            </div>
                                  <div class="col-lg-4">
                                      final
                                 <input type="text" value="<%=final_40%>" class="form-control" name="final_40">
                            </div>	
				       <div class="col-lg-4">
                                           evaluation
                                 <input type="text" value="<%=conductevaluation%>" class="form-control" name="conductevaluation">
                            </div>	
                                     
                            <div class="col-lg-2">
                                   <input type="submit" value="submit" class="btn btn-primary pull-right">
                            </div>
                        </form>
                    </div>
                    </div>
                    <%}}%>     
            
<form method="post"action="${pageContext.request.contextPath}/ApprovalController" 
               id="mark" name="mark" onsubmit="return valiatemark(this)">
         ${inserted}
             <h4 class="text-center">Teacher Mark Submission Form</h4>
      
<div class="span12">
           
                    <div class="form-group col-lg-4 container">
                        <%-- filtter course get session where academicStaffid=session.id--%>
                        Module Code <select class="form-control" name="course" id="course" onchange="showState(this.value)">
                                <option value="">select course Code</option>  
                    
                          <%String course=null,module_title=null,program=null,year=null,term=null,id=null; int crh=0;
                              
                       
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
                            //out.println(academicyear);
                            
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
                                                                                       <!--]l-->  

                    <div class="form-group col-lg-4">
                        
                        Term<input type="text" class="form-control" value="<%=term%>" disabled> 
                        
                  </div>
                        <div class="form-group col-lg-4">
                        <%-- year must be include in student profile update--%>
                        Year<input type="text" class="form-control" value="" disabled> 
                        
                  </div>
                
            
                  <table id="table" class="table table-striped table-bordered dt-responsive nowrap" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>40%</th>
                <th>60%</th>
                <th>100%</th>
                <th>Approval Progress</th>
                <th>Action</th>
                </tr>
        </thead>
        <tbody>
         <%Statement st_student=con.getconnection().createStatement();
         ResultSet rs_student=st_student.executeQuery("select * from TBL_STUDENT_PROFILE_DATA_TABLE");
         while(rs_student.next()){
           id=rs_student.getString("stud_id"); 
           }String stud_id=null,firstname=null,middlename=null,fullname=null,room=null,Grade=null;float mark_100=0,finalexam=0,mark_60=0; int status=1;
         Statement student_mark_list=con.getconnection().createStatement();
         ResultSet rs_mark_list=student_mark_list.executeQuery("select distinct SECTION_ID,sum(mark) as mark,sum(mark) as two,TBL_STUDENT_PROFILE.stud_id,stud_first_name,stud_middle_name,stud_last_name from tbl_test , TBL_STUDENT_PROFILE where TBL_STUDENT_PROFILE.stud_id=tbl_test.stud_id group by SECTION_ID,TBL_STUDENT_PROFILE.stud_id,stud_first_name,stud_middle_name,stud_last_name ");
         while(rs_mark_list.next()){
              stud_id=rs_mark_list.getString("stud_id");
         firstname=rs_mark_list.getString("stud_first_name");
         middlename=rs_mark_list.getString("stud_middle_name");
             mark_100=rs_mark_list.getFloat("mark");
            room=rs_mark_list.getString("SECTION_ID");
         fullname=firstname.concat(middlename);
          Statement st_mark=con.getconnection().createStatement();
         ResultSet rs_mark=st_mark.executeQuery("select mark from tbl_test where stud_id='"+stud_id+"' and test_type='final'");
         while(rs_mark.next()){
             finalexam=rs_mark.getFloat("mark");
            mark_60= mark_100-finalexam;
            //grade
            
         
}      String Action="Onprogress"; int i=0;
         Statement st_check_status=con.getconnection().createStatement();
         ResultSet rs_check_status=st_check_status.executeQuery("select * from tbl_mark where stud_id='"+stud_id+"' ");
         while(rs_check_status.next()){
          Action=rs_check_status.getString("status");
          i=rs_check_status.getInt("status");
          if(i==1){
              Action="Ready State";
                   }
          else if(i==2){
            Action="Approved By Program Manager";  
          }
          else if(i==3){
              Action="Approved By Registrar Office";
          }
          else if(i==4){
              Action="Reject By Program Manager";
          }
          else if(i==5) {
              Action="Reject By Registrar office";
          }
         }
         %>  
         <%if(i==2||i==3){%>
             <tr>
                 <td>
                    <%=stud_id%>
                </td>
                       <td><%=firstname+  " "  + middlename%></td>
            <td><%=finalexam%></td><input type="hidden" name="mark_40" value="<%=finalexam%>" >
	             <td><%=mark_60%></td><input type="hidden"  name="mark_60" value="<%=mark_60%>"  >
           <input name="approvalname" type="hidden" value="Pending">
                           <input name="teacherid" type="hidden" value="r/001/2010">
                           
                             <input name="date" type="hidden" value="<%=now%>"> 
                             
                <input name="academicyear"type="hidden"value="<%=academicyear%>">
               <input name="course" type="hidden"value="<%=course%>"> 
          
                <td><%=mark_100%></td><input type="hidden" name="mark_100" value="<%=mark_100%>">
                     <input name="program" type="hidden" value="<%=program%>">
                   <input type="hidden" class="form-control"name="studid" value="<%=stud_id%>">
                 <input name="term" type="hidden" value="<%=term%>">
                    <input name="Registrar_office_name" type="hidden" value="Pending">
               <input name="room" type="hidden" value="<%=room%>">
          <input type="hidden" class="form-control"name="" value="<%=fullname+""+middlename%>">
             
           
              
                <td><%=Action%></td><input type="hidden" class="form-control" value="<%=Action%>">
 
              
                </form>
                
                 <td>
                <form action="" method="post">
                                        <input type="hidden" name="action" value="edit"/>
                                        <input type="hidden" name="id" id="edit_id" value="<%=stud_id%>"/>
                                        <button class="btn btn-danger glyphicon glyphicon-edit" id="edit_id" disabled="">Edit</button>
                                    </form>
                                </td>
               
             </tr>
            <%}else{%>
                                           
     <tr>
                 <td>
                    <%=stud_id%>
                </td>
                       <td><%=firstname+  " "  + middlename%></td>
            <td><%=finalexam%></td><input type="hidden" name="mark_40" value="<%=finalexam%>" >
	             <td><%=mark_60%></td><input type="hidden"  name="mark_60" value="<%=mark_60%>"  >
           <input name="approvalname" type="hidden" value="Pending">
                           <input name="teacherid" type="hidden" value="r/001/2010">
                           
                             <input name="date" type="hidden" value="<%=now%>"> 
                             
                <input name="academicyear"type="hidden"value="<%=academicyear%>">
               <input name="course" type="hidden"value="<%=course%>"> 
          
                <td><%=mark_100%></td><input type="hidden" name="mark_100" value="<%=mark_100%>">
                     <input name="program" type="hidden" value="<%=program%>">
                   <input type="hidden" class="form-control"name="studid" value="<%=stud_id%>">
                 <input name="term" type="hidden" value="<%=term%>">
                    <input name="Registrar_office_name" type="hidden" value="Pending">
               <input name="room" type="hidden" value="<%=room%>">
          <input type="hidden" class="form-control"name="" value="<%=fullname+""+middlename%>">
             
           
              
                <td><%=Action%></td><input type="hidden" class="form-control" value="<%=Action%>">
 
              
                </form>
                 <td>
                <form action="" method="post">
                                        <input type="hidden" name="action" value="edit"/>
                                        <input type="hidden" name="id" id="edit_id" value="<%=stud_id%>"/>
                                        <button class="btn btn-danger glyphicon glyphicon-edit" id="edit_id">Edit</button>
                                    </form>
                                </td>
               
             </tr>
             <%}}%> </tbody>
                                        </table>
                                           <br>
             <div class="col-lg-2 pull-right">
              <input type="submit" value="ReSubmit"class="btn btn-primary" name="action">
                </div> <div class="col-lg-2 pull-right">
                  <input type="submit" value="submit"class="btn btn-primary pull-left" name="action">
             
             </div>
                                          
             <p>Instructor's Title& Full Name_____________________Signature________Date_________</p>
               <p>Instructor's Education Level __________________________________</p>
                <p>Instructor's Organization/institution(where he/she has come from)_________________</p>
                 <p>Exam and Result Approval Committee Charirman ____________Signature________Date_________</p>
                  <p>Program Manager_____________________Signature________Date_________</p>
     
     
     
     
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
