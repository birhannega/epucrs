<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<link rel="stylesheet" href="../css/jQuery.steps.css"/>   
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    
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
                   
                    
        
            ${inserted}
            ${existed}
            ${oop}
            <%request.getSession().setAttribute("inserted",null);
            request.getSession().setAttribute("oop",null);
            String teacherid=null;%><br>
            
            <div class="form-group col-lg-4">
                <form action="" method="post">
                    <select name="department" id="department" class="form-control" onchange="showState(this.value)" >
                        <option value="">select department</option>  
          
                    <%
                    String COURSE_CODE=null,dpt_name=null,program=null,dpt_id=null;
                    connectionManager dbcon=new connectionManager();
                    String dpid=null,stid=null;
                    Statement st_course_assignment=dbcon.getconnection().createStatement();
                    // session for stafid where ACADEMIC_STAFF_ID=sessionid;
                    ResultSet rs_course_assignment=st_course_assignment.executeQuery("select * from TBL_COURSEASSIGNMENT");
                    while(rs_course_assignment.next()){
                        COURSE_CODE=rs_course_assignment.getString("COURSE_CODE");
                   
                    Statement st_select_department=dbcon.getconnection().createStatement();
                    ResultSet rs_select_department=st_select_department.executeQuery("select *from TBL_COURSE_REGISTRATION,TBL_DEPARTMENT where TBL_COURSE_REGISTRATION.DEP_id=TBL_DEPARTMENT.DEP_id and COURSE_CODE='"+COURSE_CODE+"'");
                    while(rs_select_department.next()){
                    dpt_id=rs_select_department.getString("DEP_id");
                    dpt_name=rs_select_department.getString("DEP_name");
                %>
                    <option value="<%=dpt_id%>"><%=dpt_name%></option>
                    <%}}%>
                    </select>
                    </div>
                    <div class="form-group col-lg-4">
                    <select name="program" id="program" class="form-control">
                     <option value="">select program</option> 
                     
                                  
                                    
                  <script  type="text/javascript">  
      var xmlHttp;
      function showState(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="program.jsp";
      url +="?department=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("program").innerHTML=xmlHttp.responseText   
      }   
      }
      </script> 
                  </select>                                            </div>
            <div class="form-group col-lg-3">
                <select name="course" id="course" class="form-control">
                    <option value="">Select Course</option>
                     
                    <%
                        // session ACADEMIC_STAFF_ID=sessionid;
                        String course_code=null,course_name=null,term=null;
                    Statement select_course=dbcon.getconnection().createStatement();
                    ResultSet rs_select_course=select_course.executeQuery("select * from TBL_COURSEASSIGNMENT");
                    
                    while(rs_select_course.next()){
                        course_code=rs_select_course.getString("COURSE_CODE");
             
              
                    %>
                           <option>
                       
                         <%=course_code%>
                        
                           <%}%>
                            </option>
            </select>
       
            </div>
           

           
     <div class="form-group col-lg-2">
         <select name="term" class="form-control">
     <%     // filtter term
                   Statement st_term=dbcon.getconnection().createStatement();
                   ResultSet rs_term=st_term.executeQuery("select * from LU_TERM,TBL_ACADEMIC_PROGRAM where TBL_ACADEMIC_PROGRAM.program_id=lu_term.program_id");
                    while(rs_term.next()){
                        term=rs_term.getString("term_name");
                        %>
                        <option>
                        <%=term%>
                        
                        <%  }%>
                        </option>
         </select>
     </div>
            <div class="form-group col-lg-3">
                <select class="form-control"name="class" id="class">
                    <option value="null">select class</option>
                    <% // what is seqno=section number then this is filtter from TBL_COURSEASSIGNMENT;
                        for (int j=1;j<=10;j++){%>
                   
                          
                             <option>Room <%=j%></option>
                
<%}%>
    </select>
            </div>
            </div>

            <div id="testadd">
             <select class="form-control col-lg-2" required name="testtype" id="test"style="width: 120px;">
                                               <option value="">select Test Type</option>
						<option value="project">Project(10%)</option>
						<option value="activity">Activity(10%)</option>
						<option value="test1">Test 1(10%)</option>
                                                <option value="Attendance">Attendance(5%)</option>
						<option value="mid">Mid Exam(20 %)</option>
						<option value="final">Final (40 %)</option>
						<option value="conductevaluation">Conduct  evaluation  (5 %)</option>
					</select>
                </div><div id="result">
					<button class="btn btn-primary">choose test</button>
				</form>
			</div>
			<%int min=0,max=0;
if(request.getParameter("testtype")==null)
{
	%>
			
			<%}
else
{
	String testtype=request.getParameter("testtype");
	if(testtype.equals("project")||testtype.equals("activity")||testtype.equals("test1"))
	{
		min=1;
		max=10;
	}
	else if (testtype.equals("Attendance")||testtype.equals("conductevaluation"))
	{
		min=1;
		max=5;
	}
	else if (testtype.equals("mid"))
	{
		min=1;
		max=20;
	}
	else if  (testtype.equals("final")){
		min=1;
		max=40;
	}
	
		
%>
            </div>
            <div class="col-lg-offset-3 col-md-8">
            <table class="table  table-condensed" id="mark">

					<thead>
						<tr>
							<th>Test Type</th>
							<th>Student ID</th>
							<th>First Name</th>
                                                        <th>Last Name</th>
							<th>Mark</th>
							</tr>
					</thead>
					<tbody>
                                            
                            <%
                                // this get from session of teacher_id;
                                Statement st_teacher=dbcon.getconnection().createStatement();
                            ResultSet rs_teacher=st_teacher.executeQuery("select * from TBL_ACADEMIC_STAFF_REG");
                            while(rs_teacher.next()){
                                teacherid=rs_teacher.getString("ACADEMIC_STAFF_ID");
                                
                            }
                            String id=null,firstname=null,middlename=null,teacher_id=null; int i=0;
                            Statement st_mark_insertion=dbcon.getconnection().createStatement();
                            // get for session teacher_class assign
                            ResultSet rs_mark_insertion=st_mark_insertion.executeQuery("select *from TBL_STUDENT_PROFILE_DATA_TABLE");
                            while(rs_mark_insertion.next()){i++;
                                id=rs_mark_insertion.getString("STUD_ID");
                                firstname=rs_mark_insertion.getString("STUD_FIRST_NAME");
                                  middlename=rs_mark_insertion.getString("STUD_MIDDLE_NAME");
                                  
                            %>
                                                  <%!
   DateFormat year = new SimpleDateFormat("yyyy-MM-E");
   String now = year.format(new Date());
   
  
%> 

     <input type="hidden"value="<%=now %>"name="date">

                            <tr>
				<form method="post"
			       action="${pageContext.request.contextPath}/markInsertion" id="mark" name="mark" onsubmit="return valiatemark(this)">
				<td><%=request.getParameter("testtype")%>
                                 <input name="department" type="hidden"value="<%=request.getParameter("department")%>"> 
                                 <input name="program"type="hidden"value="<%=request.getParameter("program")%>"> 
                                 <input name="course"type="hidden"value="<%=request.getParameter("course")%>">
                                  <input name="teacherid" type="hidden" value="<%=teacherid%>"> 
                                    <input name="class" type="hidden" value="<%=request.getParameter("class")%>"> 
                                    <input name="studid" type="hidden" value="<%=id%>"> 
                                    <input name="term" type="hidden" value="<%=request.getParameter("term")%>"> 
                                    <input name="test" type="hidden" value="<%=request.getParameter("testtype")%>">
                                   
                                   <input name="date" type="hidden" value="<%=request.getParameter("date")%>"></td>
								<td>
									<div>
										<%= id%>
									</div>
								</td>
                                                                <td><%= firstname%></td><td><%=middlename%></td>
								<td><input type="number" class="form-control"
									name="mark" style="width: 150px" required="required"
									min="<%=min %>" max="<%=max%>"></td>
                                                                      </tr><%}%>
								<td><button type="submit"
								class="btn btn-primary fa fa-save" value="save mark">submit</button>
							</form>
                      
    <%}%>
                    </tbody>
                </table>
            </div>
        </div>

                    	<script type="text/javascript">
$(document).ready(function()
		{
$("#mark").bdt();	
});
</script>

		</div>
	</div>
	<script type="text/javascript"
		src="../resources/jquery/jquery.validate.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.bdt.js"></script>

        <script type="text/javascript">
  $(function() {
    $("#testadd").hide();
    $("#test").click(function() {
        $("#testadd").show();
    });
</script>