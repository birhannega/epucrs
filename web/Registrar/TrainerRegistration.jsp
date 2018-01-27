<%-- 
    Document   : Instructor Registration
    Created on : 27-Feb-2017, 13:22:06
    Author     : Efrem
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
           </head>
<body>
    
    <!--      include navigation bar start-->

    <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">

                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
<!--                    <div class="navbar-header">
                        <%--<%@include file="../common/depsideheader.jsp"%>--%>

                    </div>-->

                    <!-- Main Menu -->
                    <div class="side-menu-container">
                        <%@include file="sidemenu.jsp"%>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
               
                    <!-- <div class="row">
                         <div class="col-lg-12">-->
                    <p class="text-primary page-header text-center"><strong> Short Term Trainer profile Registration  </strong></p>
                    

                        <p class="text-success text-right"><strong> ${TrainerRegistered}
                 ${oop}</strong></p>
                  
                
                 
                        
                 <%
								request.getSession().setAttribute("TrainerRegistered", null);
									request.getSession().setAttribute("oops", null);
							%>
                                                        <br>                         
                        <section >
                            <form class="form-group " method="post" id="Trainer_reg" action="${pageContext.request.contextPath}//TrainerController">
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Birth Date</span>
                                        <input type="text" name="bdate"  id="bdate"class="form-control" placeholder="birthdate">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Experience</span>
                                        <input type="text" name="Experience"  class="form-control"id="Experience" placeholder="EXPERIENCE">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="title" name="title" required="required">
                                              <option>-select- title</option>
                                            <option>ኮሚሽነር</option><option>ዕ/መኮንን</option><option>ም/ኮማንደር</option>
                                            <option>ኮማንደር</option><option>ረ/ኮሚሽነር</option><option>ም/ኮሚሽነር</option>
                                            <option>ኢንስፔክተር</option><option>ረ/ኢንስፔክተር</option><option>ሳጅን</option>
                                            <option>ኢንስፔክተር</option><option>ኮንስታብል</option><option>ረ/ሳጅን</option><option>ም/ሳጅን</option><option>ዋ/ሳጅን</option>
                                            <option>ራ/ቴክ</option><option>ም/ኢንስፔክተር</option><option>Mr ዋ/ኢንስፔክተርn><option> Mr.ኢንጂነርዶክተር</option><option>ም/ኮማንደር</option>
                                            <option>ወ/ሮ</option><option>ወ/ት</option><option>አቶ<option>ኮሚሽነር ጄኔራል</option><option>ም/ኮሚሽነር ጄኔራል</option>
                                            <option>ሲስተር</option><option>የጤና መኮንን</option><option>ጸሃፊ</option><option>ነርስ</option><option>ጤና መኮንን</option><option>ዋና ዳይሬክተር</option>
                                            <option>ሚድዋ<option>ዶክተር</option>
                                            <option>Mr</option><option>Ms</option><option>Phd</option><option>Doctor</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Name</span>
                                        <input type="text" name="firstname"  class="form-control" id="firstname" placeholder="Enter First name">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Middle Name</span>
                                        <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Full name">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Last Name</span>
                                        <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Full name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Hired Date</span>
                                        <input type="text" name="hired_date"  class="form-control" id="hdate" placeholder="enterd Hired Date">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phone</span>
                                        <input type="text" name="tel"  class="form-control" id="tel" placeholder="Enter Phone">
                                    </div>
                                 </div><div class="form-group col-lg-4">
                                    <div class="input-group">
                                     
                                        <input type="submit"  class="form-control btn btn-primary" value="submit">
                                    </div>
                                 </div>
                            </form>
                             


                    <!-- </div>
                 </div>-->
                
            </div>
        </div>
    </div>
 <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#Trainer_reg").validate({
            
        rules:{
            bdate: {
                required:true
            },
            tel: {
                required:true
                
            },
            hired_date: {
                required:true
            },
            firstname: {required:true
            },
            middlename: {
                required:true
                
            },
            lastname: {
                required:true
            },Experience: {
                required:true
            }
            
        },
        messages: {
            "firstname":{ 
                required: 'enter firstname'
            }
        }
        });
     
        
    });
</script>
</boody>
</html>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script>
//$( "#bdate" ).datepicker({
//	inline: true,
//	showButtonPanel:true,
//	changeYear:true,
//	changeMonth:true,
//        dateFormat:'yy-dd-mm'
//}),
//        $( "#hdate" ).datepicker({
//	inline: true,
//	showButtonPanel:true,
//	changeYear:true,
//	changeMonth:true,
//        dateFormat:'yy-dd-mm'
//});


    $(function () {
        $("#bdate").datepicker({
            numberOfMonths: 2,
            onSelect: function (selected) {
                var dt = new Date(selected);
                dt.setDate(dt.getDate() + 6205);
                $("#hdate").datepicker("option", "minDate", dt);
            }
        });
        $("#hdate").datepicker({
            numberOfMonths: 2,
            onSelect: function (selected) {
                var dt = new Date(selected);
                dt.setDate(dt.getDate() - 6205);
                $("#bdate").datepicker("option", "maxDate", dt);
            }
        });
    });
    
</script>

