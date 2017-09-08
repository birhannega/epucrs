<%-- 
    Document   : Probatiion
    Created on : Sep 5, 2017, 10:50:36 PM
    Author     : seid
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Probation</title>
              <%@include file="../common/imports.jsp" %>
              <style type="text/css">
                  .error{
                      color: red;
                  }
                  
              </style>
                  
    </head>
    <body>
        <div class="container-fluid" style="margin-top: -5px;">
        <%@include file="../common/department_nav.jsp" %>
        </div>
        <div class="col-lg-2">
            <%@include file="../common/department_sidebar.jsp" %>
        </div>
        ${registerd}
        <%
            request.getSession().setAttribute("registerd", null);
            request.getSession().setAttribute("not", null);
        %>
        <form action="${pageContext.request.contextPath}/ProbationServlet" method="post" name="probation" id="probation">
            <%!
   DateFormat year = new SimpleDateFormat("yyyy-MM-E");
   String now = year.format(new Date());
   
  
%> 

     <input type="hidden"value="<%=now %>"name="date">
     <b> <%=now%></b>
       <div class="col-md-9 col-sm-9 col-xs-9">
        <div class="form-group col-lg-4">
            Trainer Name<input tyup="text" name="trainer_name" id="trainer_name" class="form-control">
        </div>
            <div class="form-group col-lg-4">
                Department<input type="text" name="department" id="department" class="form-control">
            </div>
            <div class="form-group col-lg-4">
                Pervious Result<input type="text" class="form-control" name="pervious_result" id="pervious_result">
            </div>
            <div class="form-group col-lg-4">
            Student Status<select name="current_status" id="current_status" class="form-control">
                <option value=""> Select Student Status </option>
                    <option>Farewell </option>
                <option>Farewell Reception</option></select>
            </div>
            <div class="form-group col-lg-4">
                Expected Result<input type="text" name="expected_result" id="expected_result" class="form-control">
            </div>
            <div class="form-group col-lg-4">
                Department Manager name<input type="text" name="Manager_name" id="Manager_name" class="form-control">
            </div>
            <div class="form-group col-lg-4">
                Registrar Manager name<input type="text" name="Registrar_manager_name" id="Registrar_manager_name" class="form-control">
            </div>
         <div class="form-group col-lg-4 pull-right">
     <input type="submit" value="submit" class="btn btn-primary">
         </div>
       </div>
        </form>
    </body>
</html>
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
        jQuery.validator.addMethod("lettersonly", function(value, element) {
  return this.optional(element) || /^[a-z]+$/i.test(value);
}, "Letters only please");
jQuery.validator.addMethod("letterswithspace", function(value, element) {
    return this.optional(element) || /^[a-z\s]+$/i.test(value);
}, "letters only");
    $(document).ready(function (){
      $("#probation").validate({
        
          rules:{
              expected_result:{
             
                  required:true,
                   digits:true,
                  minlength:1,
                  maxlength:2
              },
              Manager_name: {
                  letterswithspace:true,
                 required:true 
                 
              },
              Registrar_manager_name: {
                  required:true
              },
              current_status:{
                  required:true
                 
              },
              pervious_result: {
                  required:true,
                  digits:true,
                  minlength:1,
                  maxlength:2
              },
              trainer_name:{
                  required:true,
                  letterswithspace:true
              },
              department: {
                  required:true,
                  lettersonly:true
                  
              }
          },
          messages :{
              trainer_name:{
                  required:"Enter Trainer Name"
              },
              department :{
                  required:"Enter Department"
              },
              pervious_result:{
                  required:"Enter Pervious Result"
              },
              current_status:{
                  required:"Select Student Status"
              },
              expected_result:{
                  required:"Enter Expected Result"
              },
              Manager_name:{
                  required:"Enter Department Manager Name"
              },
              Registrar_manager_name:{
                  required:"Enter Registrar Manager Name"
              }
          }
      }); 
    });
   
       
</script>
