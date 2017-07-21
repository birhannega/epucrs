<%-- 
    Document   : SUbmissionMark
    Created on : Jan 26, 2017, 2:30:11 AM
    Author     : seid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"type="text/css"href="../bootstrap/css/bootstrap.css">
                <link rel="stylesheet"type="text/css"href="../bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="resources/jquery/jquery.validate.js"></script>
    <link type="text/css" rel="stylesheet" title="currentStyle" href=../resources/css/demo_table.css />
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/jQuery.steps.css"
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="../common/imports.jsp"%>
         <div class="container-fluid"style="margin-top: 5px;">
             <%@include file="../common/TeacherHeader.jsp" %></div>
    <div class="span12"style="margin-top: -20px;">
        <div class="span12">
                        <div class="col-lg-2" id="sidebar">
                            <%@include file="../common/TeachersSidebar.jsp"%></div></div></div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery.bdt.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	$('#mark').bdt(
			{
			ordering:true,
			scrollY:300,
			paging:false
                      
			});

})
</script>
        <title>Exam Result Submission</title>
    </head>
    <body>
        <h3 class="page-header text-center  col-lg-8"style="margin-top: 0px;">Ethiopia Police University College<br>Exam Result Submitting Form</h3>
        
                <form class="form-inline container"action=""mehod="post"name="formtable">
                    <div class="container form-inline">
                        <% 
                            String mtitle=null,mcode=null,program=null,year=null,term=null,crs=null;
                       %><label>Module Title&nbsp;<input type="text"class="form-control"value="<% out.println(mtitle);%>"></label>
                        <label>Module Code<input type="text"value="<% out.println(mcode);%>"class="form-control"></label>
                        <label>CHrs<input type="text" class="form-control" value="<% out.println(crs);%>"></label>
                        <label>Program&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" value="<% out.println(program);%>"></label>

                                                                        <label>Year&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" value="<% out.println(year);%>"></label>

                                                                                                <label>Term<input type="text" class="form-control" value="<% out.println(term);%>"></label>

                    </div>
                                                                                                <br>
                                                                                                <div class="col-lg-offset-2"style="margin-top: -280px;">                                                               
                    <table class="table table-bordered "id="mark">
                        <th>No</th>
                        <th>Stud.ID</th>
                        <th>Student Name</th>
                        <th>60%</th>
                        <th>40%</th>
                        <th> Result :100%</th>
                        <th>Remark</th>
                        <th>Action</th>
                   
                    <tbody>
                                  
                             <tr><td>1</td>
                            <td>R/2549/05</td>
                            <td>Seid Nur </td>
                                                    <td> 
                                                    
                                                        <% 
                                                       
                                                        %>
                                                        
            <input type="text" id="Text1_1" name="mark_60"  class="form-control"onKeyUp="add_number(1)">
            </td>
                            <td><input type="text" id="Text2_1"  name="mark_40" class="form-control" onKeyUp="add_number(1)"></td>
                            <td>  <lable id="txtresult_1" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                            <td></td>  
                            <td><input type="submit" value="submit"class="btn btn-primary"></td>
                        </tr>      
                        <tr><td>2</td>
                            <td>R/2550/05</td>
                            <td>Birhan Nega </td>
                                                 <td> 
                                                     <input type="text" id="Text1_2" name="mark_60"  class="form-control"onKeyUp="add_number(2)">
            </td>
                            <td><input type="text" id="Text2_2" name="mark_40"class="form-control"onKeyUp="add_number(2)"></td>
                            <td>  <lable id="txtresult_2" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                            <td></td>  
                            <td><input type="submit"value="submit"class="btn btn-primary"></td>
                        </tr>   <tr><td>3</td>
                            <td>R/2551/05</td>
                            <td>Efrem Mulu</td>
                                                        <td> 
            <input type="text" id="Text1_3" name="mark_60"  class="form-control"onKeyUp="add_number(3)">
            </td>
                            <td><input type="text" id="Text2_3" name="mark_40"class="form-control"onKeyUp="add_number(3)"></td>
                            <td>  <lable id="txtresult_3" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>      <td></td>  
                            <td><input type="submit" value="submit"class="btn btn-primary"></td>
                        </tr>   <tr><td>4</td>
                            <td>R/2552/05</td>
                            <td>Abebaw </td>
                            <td> 
            <input type="text" id="Text1_4" name="mark_60"class="form-control"onKeyUp="add_number(4)">
            </td>
                            <td><input type="text" id="Text2_4" name="mark_40"class="form-control"onKeyUp="add_number(4)"></td>
                            <td>  <lable id="txtresult_4" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                            <td></td>  
                            <td><input type="submit"value="submit"class="btn btn-primary"></td>
                        </tr>   <tr><td>5</td>
                            <td>R/2553/05</td>
                            <td>Demse Yilma </td>
                                                <td> 
            <input type="text" id="Text1_5" name="mark_60"class="form-control"onKeyUp="add_number(5)">
            </td>
                            <td><input type="text" id="Text2_5" name="mark_40"class="form-control"onKeyUp="add_number(5)"></td>
                            <td>  <lable id="txtresult_5" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                            <td></td>  
                            <td><input type="submit"value="submit"class="btn btn-primary"></td>
                        </tr>   <tr><td>7</td>
                            <td>R/2554/05</td>
                            <td>Daniel Taddele </td>
                                             <td> 
            <input type="text" id="Text1_6" name="mark_60"class="form-control"onKeyUp="add_number(6)">
            </td>
                            <td ><input type="text" id="Text2_6" name="mark_40"class="form-control"onKeyUp="add_number(6)"></td>
                            <td>  <lable id="txtresult_6" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                            <td></td>  
                            <td><input type="submit"value="submit"class="btn btn-primary"></td>
                        </tr>   <tr><td>8</td>
                            <td>R/2555/05</td>
                            <td>Jemila mohammed </td>
                            <td> 
            <input type="text" id="Text1_7" name="mark_60"class="form-control"onKeyUp="add_number(7)">
            </td>
                            <td><input type="text" id="Text2_7" name="mark_40"class="form-control"onKeyUp="add_number(7)"></td>
                            <td>  <lable id="txtresult_7" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                            <td></td>  
                            <td><input type="submit"value="submit"class="btn btn-primary"></td>
                        </tr>   <tr><td>9</td>
                            <td>R/2556/05</td>
                            <td>wude </td>
                                                        <td> 
            <input type="text" id="Text1_8" name="mark_60"class="form-control"onKeyUp="add_number(8)">
            </td>
                            <td><input type="text" id="Text2_8" name="mark_40"class="form-control"onKeyUp="add_number(8)"></td>
                            <td>  <lable id="txtresult_8" name="mark_100" style="background: #E1E1E1; border:1px #ADADAD solid;padding:3px 5px 3px 5px;"></lable></td>   
                       </td>
                            <td></td>  
                              <td><input type="submit"value="submit"class="btn btn-primary"></td>
                        </tr>   
                    </tbody>
                    </table>

        </form>
                                                                                              
         <script type="text/javascript">
             
             var id;
       function add_number(id) {
           var first_number = parseInt(document.getElementById("Text1_"+id.toString()).value);
            var second_number = parseInt(document.getElementById("Text2_"+id.toString()).value);
            var result = first_number + second_number;
        document.getElementById("txtresult_"+id.toString()).innerHTML = result;  
           }    
       </script>
                                                        </div>
                                                        <style>
                                                            .col-lg-offset-2{
                                                                margin-top: -25px;
                                                            }
                                                        </style>
         <br>
        <div class="navbar-fixed-bottom well  text-center"style="margin-bottom:0px; padding-bottom:0px;">Federal police university college</div>
    </body>
</html>
