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
<link rel="stylesheet" href="../css/jQuery.steps.css"/>   
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
  
<style>
    section{
        overflow: scroll;
        background: #fff;
    }

</style>
<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/incoder_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 

        
        <!--      include side bar start-->
  
        <title>Exam Result Submission</title>
    </head>
    <body>
        
<form method="post"action="${pageContext.request.contextPath}/ApprovalController" 
               id="mark" name="mark" onsubmit="return valiatemark(this)">
         ${inserted}
       <%request.getSession().setAttribute("inserted",null);
            request.getSession().setAttribute("oop",null);
            String course=null,modulecode=null,credithour=null,program=null,term=null;
       connectionManager connection=new connectionManager();
       Statement st_mark=connection.getconnection().createStatement();
       ResultSet rs_mark=st_mark.executeQuery("select * from TBL_COURSE_REGISTRATION");
       while(rs_mark.next()){
           modulecode=rs_mark.getString("COURSE_CODE");
           term=rs_mark.getString("term");
           credithour=rs_mark.getString("CREDIT_HOURS");
           
          
       }
       String program_manager_name="seid",activeyear=null,SECTION_ID=null;
       Statement st_academicyear=connection.getconnection().createStatement();
       ResultSet rs_academicyear=st_academicyear.executeQuery("select * from TBL_SETUP where CURRENT_STATUS='Active'");
       while(rs_academicyear.next()){
           activeyear=rs_academicyear.getString("ACADAMIC_YEAR");
       }
       %>
      
<div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
                    <div class="form-group col-lg-4 container">
                           <%Statement st_program=connection.getconnection().createStatement();
                     ResultSet rs_program=st_program.executeQuery("select distinct program,term,course_code,section_id from tbl_test");
                     while(rs_program.next()){
                     program=rs_program.getString("program");
                     term=rs_program.getString("term");
                     modulecode=rs_program.getString("course_code");
                     SECTION_ID=rs_program.getString("SECTION_ID");
             }                  %>
                      Course
                      
                      <input type="text"class="form-control" value="<%=modulecode%>" disabled>
                    </div>
                    <div class="form-group col-lg-4">
                        Module Code<input type="text" class="form-control"  value="<%=modulecode%>" disabled>
                    </div>
                    <div class="form-group col-lg-4">
                        CHrs<input type="text" class="form-control" value="<%=credithour%>" disabled>
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
                        Academic Year<input type="tex" value="<%=activeyear%>" class="form-control" disabled>
                    </div>
                                                                                         

                    <div class="form-group col-lg-4">
                        
                        Term<input type="text" class="form-control" value="<%=term%>" disabled> 
                        
                  </div>
                
                <div class="container col-lg-9">
 
           <table id="table_view" class="display responsive nowrap" width="100%" cellspacing="0">
        <thead>
           <th>Student ID</th>
            <th>Student Name</th>
            <th>40%</th>
                <th>60%</th>
                    <th>100%</th>
                     <th>Action</th>
                        </thead>
        <script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>
           <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript">
$(document).ready(function() {
    $('#table_view').DataTable();
} );
    </script> 
                                            <% int mark_60=0,  finalexam=0,result=0;
                                                String studid=null,mark=null,id=null,action="Onprogress",
                                                        project=null,name=null,
                                                     lastexam=null, conductevaluation=null,activity=null,test1=null,attendance=null,mid=null;
               
                                            Statement st_approval=connection.getconnection().createStatement();
                                            ResultSet rs_approval=st_approval.executeQuery("select * from TBL_STUDENT_PROFILE");
                                            while(rs_approval.next()){
                                                studid=rs_approval.getString("STUD_ID");
                                                name=rs_approval.getString("STUD_FIRST_NAME");
                                            Statement st_student_mark=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark=st_student_mark.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='activity' and stud_id='"+studid+"'");
                                            while(rs_student_mark.next()){
                                                activity=rs_student_mark.getString("mark");
                                              
                                                id=rs_student_mark.getString("stud_id");
                                            } 
                                            Statement st_student_mark_project=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_project=st_student_mark_project.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='project'and stud_id='"+studid+"'");
                                            while(rs_student_mark_project.next()){
                                                project=rs_student_mark_project.getString("mark");
                                                 
                                                id=rs_student_mark_project.getString("stud_id");
                                                
                                            }
                                              Statement st_student_mark_test1=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_test1=st_student_mark_test1.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='test1'and stud_id='"+studid+"'");
                                            while(rs_student_mark_test1.next()){
                                                test1=rs_student_mark_test1.getString("mark");
                                         
                                            
                                            //out.println(project);
                                            }
                                            
                                               Statement st_student_mark_attendance=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_attendance=st_student_mark_attendance.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='Attendance'and stud_id='"+studid+"'");
                                            while(rs_student_mark_attendance.next()){
                                               attendance=rs_student_mark_attendance.getString("mark");
                                            }
                                                 Statement st_student_mark_final=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_final=st_student_mark_final.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='final'and stud_id='"+studid+"'");
                                            while(rs_student_mark_final.next()){
                                                lastexam=rs_student_mark_final.getString("mark");
                                                      id=rs_student_mark_final.getString("stud_id");
                                                      finalexam=Integer.valueOf(lastexam);
                                            }
                                              Statement st_student_mark_conductevaluation=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_conductevaluation=st_student_mark_conductevaluation.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='conductevaluation'and stud_id='"+studid+"'");
                                            while(rs_student_mark_conductevaluation.next()){
                                                conductevaluation=rs_student_mark_conductevaluation.getString("mark");
                                            }
                                              Statement st_student_mark_mid=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_mid=st_student_mark_mid.executeQuery("select  Distinct stud_id , mark from TBL_TEST where TEST_TYPE='mid'and stud_id='"+studid+"'");
                                            while(rs_student_mark_mid.next()){
                                               mid=rs_student_mark_mid.getString("mark");
                                            }
       mark_60=Integer.valueOf(project)+Integer.valueOf(activity)+Integer.valueOf(test1)+Integer.valueOf(attendance)+Integer.valueOf(conductevaluation)+Integer.valueOf(mid);
                      result=finalexam+mark_60;  
Statement st_action=connection.getconnection().createStatement();
ResultSet rs_action=st_action.executeQuery("select * from tbl_mark");
int Action=0;
if(rs_action.next()){
    action=rs_action.getString("status");
    Action=Integer.valueOf(action);
    if(Action==1){
       action="Ready State "; 
    }
    else if(Action==2){
        action="Approved by Program Manager";
    }
    else if(Action==3){
        action="Approved By Registrar";
    }
    
}

%>
                                           
     <tr>
	        <input name="course" type="hidden"value="<%=modulecode%>"> 
                <input name="modulecode"type="hidden"value="<%=modulecode%>"> 
                <input name="academicyear"type="hidden"value="<%=activeyear%>">
                <input name="credithour" type="hidden" value="<%=credithour%>"> 
                <input name="program" type="hidden" value="<%=program%>">
                <input name="date" type="hidden" value="<%=now%>"> 
                <input name="approvalname" type="hidden" value="Pending">
                <input name="Registrar_office_name" type="hidden" value="Pending">
                 <input name="term" type="hidden" value="<%=term%>">
                <input name="room" type="hidden" value="<%=SECTION_ID%>">
                    <input name="teacherid" type="hidden" value="r/001/2010">
                <td><input type="text" class="form-control"name="studid" value="<%=studid%>"  readonly="readonly"></td>
                <td><input type="text" class="form-control"name="" value="<%=name%>" readonly="readonly"></td>
                <td><input type="text" class="form-control" style="width:60px;" name="mark_40" value="<%=finalexam%>" readonly="readonly"></td>
                <td><input type="text" class="form-control" style="width:60px;" name="mark_60" value="<%=mark_60%>"  readonly="readonly"></td>
                <td><input type="text" class="form-control" style="width:60px;" name="mark_100" value="<%=result%>"  readonly="readonly"></td>
                <td><input type="text" class="form-control" value="<%=action%>"  readonly="readonly"></td>

             </tr>
            <%}%>
            	               
                                       
                                         </tbody>
                                        </table>
                                           <br>
             <div class="col-lg-2 pull-right">
             
                <input type="submit" value="submit"class="btn btn-primary pull-left">
             
             </div>
                                           </form>
                                      </div>
                         
