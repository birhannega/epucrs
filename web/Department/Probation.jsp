   <%@ page import="java.text.*,java.util.*" session="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="../jquery/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
<!--      <script type="text/javascript" src="resources/jquery/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/jquery/jquery.validate.js"></script>-->

      
  
        <title></title>
     
    </head>
<!--    <style type="text/css">
        *{
            border:1px solid red;
           
        }
    </style>-->

      <%@include file="../common/imports.jsp" %>
      <body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px;">
        <%@include file="../common/header.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
    <body>
        <form class="form-inline container" name="form1"action=""method="post" onsubmit="return checkForm(this);">
                    <div class=" col-lg-offset-8"style="margin-top:30px;">

<%!
   DateFormat year = new SimpleDateFormat("yyyy-MM-E");
   String now = year.format(new Date());
   
  
%> <input type="hidden"value="<%=now %>"name="date">
<b>:<u class="form-control pull-right"disabled><%= now %></u></b></div>
              <div class="container col-lg-of-3"style="margin-top: 10px;">
        <h2 class="container text-center "><u>በኢት/ፖ/ዩ/ኮሌጅ የረጅስትራር ማስተባበሪያ</u></h2>
        <div class="container text-center"style="margin-top: -359px;">
         <h3 class="col-lg-offset-2 text-center"><u>በአመክሮ(probation)የሚቆዩ ሰልጣኞችን ማስፈረሚያ ፎርም</u></h3>
        
        
        <div class="form-inline  col-lg-4">
            <label class=" form-inline">&ensp;የሰልጣኙ ስም:-&ensp;&ensp;<input type="text"name="stud_name"class="form-control"></label>
        </div>
        
        <div class="col-lg-4">
        <label class="form-inline"> 
            የት/ት ክፍለ:- &ensp;&ensp;&ensp;&ensp;<input type="text"name="dpt"class="form-control"> </label></div>
         
        <div class=" col-lg-4 ">
            <label class="form-inline">&ensp;&ensp;&ensp;ያለው  ውጤት:-<input type="text"name="result"class="form-control"></label>
        </div>
        <br>
    
        <div class=" col-lg-4">
            <label class="form-inline">ተርም  ስታተስ &ensp;&ensp;&ensp;</label>
            <select  class="form-control container"name="status">
                <option>&ensp;--የተማሪውን ስታተስ ምረጥ---</option>
                <option>ስንብት</option>
            <option>ስንብት በመልሶ ቅበላ </option>
           </select>
        </div>
        <br>
        <br><br>
        <div class="col-lg-4 form-inline">   
            <label class="form-inline">ማንጣት ያለበት-&ensp;&ensp;<input type="text"name="promise"class="form-control"></label></div>
<!--       <div class="form-group col-lg-3">
           <label class="container form-inline">ስም :<input type="text"name="stud_name "class="form-control"></label></div>
           <div class="form-group col-lg-3">
               <label class="form-inline container">ፊርማ :<input type="text"name="signiture"class="form-control"></label></div>
           <br>
              <br>
-->                
           <div class="col-lg-4">
               <label class="container form-inline">የማናጀር ስም :-<input type="text"name="aprovalname"class="form-control"></label></div>
<!--           <div class="col-lg-offset-3">
              <label class="container form-inline">ፊርማ:-<input type="text"name="aprovalsign"class="form-control"></label>
           </div>
              <label class="form-inline  col-lg-offset-2"><u>የረጅስትራር ማስተባበሪያ ኃላፊ </u></label>-->
              <br>
             
              <div class=" col-lg-4 form-inline"><label>ሬጅስተር ኃላፊ :-&ensp;&ensp;&ensp;<input type="text"class="form-control"name="rworkername"></label></div>
              <input type="submit"value="submit"class="btn-primary"style="margin-right: 10%">
             
       
            
              
        </div>
        
                   </div>
                              
        <br>

<script type="text/javascript">
			function checkForm(form) {
				if (form.stud_name.value ==="") {
					alert("error: first name can't be empty");
					form.stud_name.focus();
					return false;

				}
				re = /^[A-Za-z]+$/;
				if (!re.test(form.stud_name.value)) {
					alert("Error: first name must contain only letters");
					form.stud_name.focus();
					return false;
				}
				
				
			}
		</script>

    </div></div>
    </body>
</html>
