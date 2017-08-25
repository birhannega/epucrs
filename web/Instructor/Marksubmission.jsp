<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<link rel="stylesheet" href="../css/jQuery.steps.css"/>   
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<%@include file="../common/imports.jsp" %>
<div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/incoder_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -5px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/incoder_sidebar.jsp" %>
            </div>
            ${inserted}
            ${oop};
            <%request.getSession().setAttribute("inserted",null);
            request.getSession().setAttribute("oop",null);%><br>
            
            <div class="form-group col-lg-4">
                <select name="department" id="department" class="form-control" onchange="showState(this.value)" 
                        <option value="">select department</option>  
                    <option value="">select department</option>
                    <%
                        String dpt_id=null,dpt_name=null;
                    connectionManager dbcon=new connectionManager();
                    Statement st_select_department=dbcon.getconnection().createStatement();
                    ResultSet rs_select_department=st_select_department.executeQuery("select *from TBL_DEPARTMENT");
                    
                    while(rs_select_department.next()){
                        dpt_id=rs_select_department.getString("DEP_id");
                        dpt_name=rs_select_department.getString("DEP_name");%>
                    
                     <option value="<%=dpt_id%>"><%=dpt_name%></option>
                                                                                          <%
}%>
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
      var url="Mark.jsp";
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
            <div class="form-group col-lg-2">
                <select name="course" id="course" class="form-control">
                        <option value="">select course</option>
                    <%
                        String course_code=null,course_name=null,term=null;
                    Statement select_course=dbcon.getconnection().createStatement();
                    ResultSet rs_select_course=select_course.executeQuery("select *from TBL_COURSE_REGISTRATION1");
                    
                    while(rs_select_course.next()){
                        course_code=rs_select_course.getString("COURSE_CODE");
                        course_name=rs_select_course.getString("COURSE_NAME");%>
                    
                     <option value="<%=course_code%>"><%=course_name%></option>
                 
                           <%}%>
            </select>
       
            </div>
            <div class="form-group col-lg-2">
                <select class="form-control"name="class" id="class">
                    <option value="null">select class</option>
                       <option>A</option>
                          <option>B</option>
                             <option>C</option>
                </select>
            </div>
            <div id="testadd">
            <form action=""method="post">
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
            <div class="container col-lg-9">
            <table class="table  table-condensed" id="mark">

					<thead>
						<tr>
							<th>Test Type</th>
							<th>Student ID</th>
							<th>First Name</th>
                                                        <th>Last Name</th>
							<th>Mark</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
                            <%String id=null,firstname=null,middlename=null,teacher_id=null; int i=0;
                          
                            Statement st_mark_insertion=dbcon.getconnection().createStatement();
                            ResultSet rs_mark_insertion=st_mark_insertion.executeQuery("select *from TBL_STUDENT_PROFILE");
                            while(rs_mark_insertion.next()){i++;
                                id=rs_mark_insertion.getString("STUD_ID");
                                firstname=rs_mark_insertion.getString("STUD_FIRST_NAME");
                                  middlename=rs_mark_insertion.getString("STUD_MIDDLE_NAME");
                            %>
                                
                            	<tr>
				<form method="post"
			       action="${pageContext.request.contextPath}/markInsertion" id="mark" name="mark" onsubmit="return valiatemark(this)">
				<td><%=request.getParameter("testtype")%>
                                    <input name="teacherid" type="hidden" value="<%=00/2009%>"> 
                                    <input name="subid" type="hidden" value="<%=12%>"> 
                                    <input name="studid" type="hidden" value="<%=12%>"> 
                                    <input name="branch" type="hidden" value="<%= 12%>"> 
                                    <input name="test" type="hidden" value="<%=request.getParameter("testtype")%>">
                                    <input name="section" type="hidden" value="<%= 12%>"> 
                                    <input name="grade" type="hidden" value="<%=10%>"></td>
								<td>
									<div>
										<%= id%>
									</div>
								</td>
                                                                <td><%= firstname%></td><td><%=middlename%></td>
								<td><input type="number" class="form-control"
									name="obtainedMark" style="width: 150px" required="required"
									min="<%=min %>" max="<%=max%>"></td>
								<td><button type="submit"
										class="btn btn-primary fa fa-save" value="save mark"></button>
							</form>
                        </tr>
    <%}}%>
                    </tbody>
                </table>
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