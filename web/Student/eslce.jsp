<%-- 
    Document   : eslce
    Created on : Oct 13, 2017, 10:07:56 AM
    Author     : luv2codeit
--%>
 <%
                if (session.getAttribute("experience") == null) {
                 
                        response.sendRedirect("experience.jsp");
                }else
                {
               
                    
            %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
       
        
        <title>ESLCE</title>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
           
            <div class="alert alert-info"><h3>ESLCE information</h3>
                <p>
                    <strong>
                        In ESLCE write five or seven subjects with best Grades obtained. Maths and English MUST BE INCLUDED. (grade 10/ Grade 12 result)
                    </strong>
                </p>
            </div>
 ${experience}
            
            <div class="form-group ">
                <form class="form-inline" method="POST"  >
                    <label>choose the maximum Grade you accomplished
                        </label>
                    <select class="form-control" name="gradeaccomplished">
                        <option value="">choose your Grade</option>
                        <option>10</option>
                        <option>12</option>
                    </select>
                    <button type="submit" class="btn btn-primary">choose</button>
                </form>
            </div>
            <%
            if(request.getParameter("gradeaccomplished")!=null)
            {
                String type=null;
                if(request.getParameter("gradeaccomplished").equalsIgnoreCase("10"))
                {
                    type="text";
                }else if(request.getParameter("gradeaccomplished").equalsIgnoreCase("12"))
                {
                    type="number";
                }
                
            %>
                <div class="form-group">
                <form class="form-group" method="POST" action="${pageContext.request.contextPath}/STUD_ESLCE">

                   
                    <div class="form-group col-lg-4">
                        <label>Mandatory subject </label>
                        <input name="mainnsub1" id="subject1" class="form-control" readonly="" value="English" />
                         
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="result_eng" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input type="text" data-type="date" name="Eng_year" class="form-control"/>
                    </div>
                        <div class="form-group col-lg-4">
                        <label>Mandatory Subject </label>
                        <input name="mainsub2" id="subject1" value="Mathematics" readonly="" class="form-control" />
                         
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="result_am" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input type="text" data-type="date" name="Am_year" class="form-control"/>
                    </div>
                        <div class="form-group col-lg-4">
                        <label>choose Subject </label>
                        <input type="text" name="subject1" id="subject" class="form-control" />
                         
                        </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="res_subject1" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input type="text" data-type="date" name="sub1_year" class="form-control"/>
                    </div>
                             <div class="form-group col-lg-4">
                        <label>choose Subject </label>
                        <input type="text" name="subject2" id="subject2" class="form-control" />
                         
                        </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="res_subject2" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input type="text" data-type="date" name="sub2_year" class="form-control"/>
                    </div>     <div class="form-group col-lg-4">
                        <label>choose Subject </label>
                        <input type="text" name="subject3" id="subject3" class="form-control" />
                         
                        </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="res_subject3" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input  type="text" data-type="date" name="sub3_year" class="form-control"/>
                    </div>
                             <div class="form-group col-lg-4">
                        <label>choose Subject </label>
                        <input type="text" name="subject4" id="subject4" class="form-control" />
                         
                        </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="res_subject4" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input type="text"  data-type="date"  name="sub4_year" class="form-control"/>
                    </div>
                             <div class="form-group col-lg-4">
                        <label>choose Subject </label>
                        <input type="text" name="subject5" id="subject" class="form-control" />
                         
                        </div>
                    <div class="form-group col-lg-4">
                        <label>Grade obtained </label>
                        <input type="<%=type%>" name="res_subject5" class="form-control"/>
                       
                    </div>
                    <div class="form-group col-lg-4">
                        <label>Year taken </label>
                        <input type="text"  data-type="date" name="sub5_year" class="form-control"/>
                    </div>
                     
                             
                        
                    <div class="form-group col-lg-4">
                        <input type="hidden" name="grade" value="<%=request.getParameter("gradeaccomplished")%>"/>
                         <input type="hidden" name="stud_id" value="<%=session.getAttribute("studentId")%>"/>
                        <input type="submit" class="btn btn-primary" value="Register Eslce result"/>
                    </div>
                </form> 
            </div>
           <% }else
{
%>
<div class="alert alert-info">
    You should select Grade to proceed
</div>
<%
}
            
            %>
            
            


        </div>
        <%
            }
           
        %>
 <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript">

$(document).ready(function (){
    $('input[data-type=date]').datepicker({
        changeYear:true,
        inline:true,
        changeMonth:true
    });
    
var subjects = [
	"Mathematics",
	"English",
	"physics",
	"chemistry",
	"Biology",
	"History",
	"Geography",
        "civics",
        "Guragigna",
	"Economics",
	"Accounting",
        "Amharic",
	"AfanOromo",
	"Tigrigna",
	"Afarigna"];
   $( "input[type=text]" ).autocomplete({
	source: subjects
});

});
        </script>
    </body>
</html>
