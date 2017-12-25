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

<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

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
  
        <title>Registrar Approval Form</title>
    </head>
    <body>
        
        
<form method="post"action="${pageContext.request.contextPath}/RegistrarApproval_controller"id="mark" name="mark" onsubmit="return valiatemark(this)">
    <p class="pull-right">${updated} ${notupdated}</p>
       <%request.getSession().setAttribute("updated",null);
            request.getSession().setAttribute("notupdated",null);
            String modultitle=null,modulecode=null,credithour=null,program=null,term=null;
       connectionManager connection=new connectionManager();
       Statement st_mark=connection.getconnection().createStatement();
       ResultSet rs_mark=st_mark.executeQuery("select * from TBL_COURSE_REGISTRATION");
       while(rs_mark.next()){
           modulecode=rs_mark.getString("COURSE_CODE");
           term=rs_mark.getString("term");
           credithour=rs_mark.getString("CREDIT_HOURS");
           program=rs_mark.getString("COURSE_NAME");
       }
       String program_manager_name="Meseret",activeyear=null;
       Statement st_academicyear=connection.getconnection().createStatement();
       ResultSet rs_academicyear=st_academicyear.executeQuery("select * from tbl_setup where CURRENT_STATUS='Active'");
       while(rs_academicyear.next()){
           activeyear=rs_academicyear.getString("ACADAMIC_YEAR");
       }
       %>
      <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
                    <div class="form-group col-lg-4 container">
                      Module Title
                      
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
                        Registrar Office Name <input type="text" class="form-control" value="<%=program_manager_name%>" >
                    </div>
                                                                            

                    <div class="form-group col-lg-4">
                        Term<input type="text" class="form-control" value="<%=term%>" disabled> 
                        
                  </div>
                
            
            <div class="col-lg-9">
           <table id="table_view" class="display responsive nowrap" width="100%" cellspacing="0">
        <thead>
           <th>Student ID</th>
            <th>Student Name</th>
            <th>40%</th>
                <th>60%</th>
                    <th>100%</th>
                        </thead>
                        
          <script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
$(document).ready(function() {
    $('#table_view').DataTable();
} );
    </script> 
					</thead>
					<tbody>
                                            <% int mark_60=0,result=0;
                                                String studid=null,mark=null,id=null,
                                                        project=null,name=null,
                                                        finalexam=null,conductevaluation=null,activity=null,test1=null,attendance=null,mid=null;
               
                                            Statement st_approval=connection.getconnection().createStatement();
                                            ResultSet rs_approval=st_approval.executeQuery("select * from TBL_STUDENT_PROFILE");
                                            while(rs_approval.next()){
                                                studid=rs_approval.getString("STUD_ID");
                                                name=rs_approval.getString("STUD_FIRST_NAME");
                                            Statement st_student_mark=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark=st_student_mark.executeQuery("select  Distinct stud_id, MARK_40 from tbl_mark where STATUS='2' and stud_id='"+studid+"'");
                                            while(rs_student_mark.next()){
                                                activity=rs_student_mark.getString("MARK_40");
                                              
                                                id=rs_student_mark.getString("stud_id");
                                            } 
                                            Statement st_student_mark_project=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_project=st_student_mark_project.executeQuery("select  Distinct stud_id , mark_60 from tbl_mark where STATUS='2'and stud_id='"+studid+"'");
                                            while(rs_student_mark_project.next()){
                                                project=rs_student_mark_project.getString("mark_60");
                                              
                                                id=rs_student_mark_project.getString("stud_id");
                                            }
                                     Statement st_student_mark_final=connection.getconnection().createStatement();
                                            ResultSet rs_student_mark_final=st_student_mark_final.executeQuery("select  Distinct stud_id , total from tbl_mark where status='2'and stud_id='"+studid+"'");
                                            while(rs_student_mark_final.next()){
                                                finalexam=rs_student_mark_final.getString("total");
                                                      id=rs_student_mark_final.getString("stud_id");  
                                                     
                                            }%>
                                           
     <tr>        <input name="approvalname" type="hidden" value="<%=program_manager_name%>">
                 <td><input type="text" class="form-control"name="studid" value="<%=studid%>" readonly="readonly"></td>
                 <td><input type="text" class="form-control"  value="<%=name%>" readonly="readonly"></td>
                 <td><input type="text" class="form-control" style="width:60px;"  value="<%=finalexam%>"readonly="readonly"></td>
                 <td><input type="text" class="form-control" style="width:60px;"  value="<%=project%>" readonly="readonly"></td>
                 <td><input type="text" class="form-control" style="width:60px;"  value="<%=activity%>" readonly="readonly"></td>
             </tr>
            <%}%>
             </tr>
            
           </tbody>
           </table>
             <br>
             <div class="col-lg-2 pull-right">
                <input type="submit" value="Approved"class="btn btn-primary pull-left">             
                    </div>
             <input type="submit" value="Reject"class="btn btn-primary pull-left">
           
			                 </form>
                                       
                                       
                                      </div>
                         
