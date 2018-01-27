<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery-ui.js" type="text/javascript"></script>
<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
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
                    <p class="text-primary page-header text-center"><strong> Short Term Training Course Registration </strong></p>
                    <div id="example-async" class="pull-right">

                        
                 ${registerd}
                 ${oop}
                 <%
								request.getSession().setAttribute("registerd", null);
									request.getSession().setAttribute("oop", null);
							%>
                        <section >
                            <form class="form-group " method="post" id="Trainer_reg" action="${pageContext.request.contextPath}/TainingCourse_Registration">
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">CREDIT HOUR</span>
                                        <input type="text" name="credit_hour"  id="credit_hour"class="form-control" placeholder="Enter credit_hour">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">COURSE_NAME</span>
                                        <input type="text" name="COURSE_NAME"  class="form-control" placeholder="Enter COURSE_NAME">
                                    </div>
                                </div>
                                 <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">TITLE</span>
                                        <input type="text" name="TITLE"  class="form-control" id="TITLE" placeholder="Enter TITLE">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">PRE_REQUEST</span>
                                        <input type="text" name="PRE_REQUEST"  class="form-control" id="PRE_REQUEST" placeholder="Enter PRE_REQUEST">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Course_type</span>
                                        <input type="text" name="Course_type"  class="form-control" id="Course_type" placeholder="Enter Course_type">
                                    </div>
                                </div>
<!--                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Hired Date</span>
                                        <input type="text" name="hired_date"  class="form-control" id="hdate" placeholder="enterd Hired Date">
                                    </div>
                                </div>-->
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Course_code</span>
                                        <input type="text" name="Course_code"  class="form-control" id="Corse_code" placeholder="Enter Corse_code">
                                    </div>
                                 </div><div class="form-group col-lg-4">
                                    <div class="input-group">
                                     
                                        <input type="submit"  class="form-control btn btn-primary  pull-right" value="submit">
                                    </div>
                                 </div>
                            </form>
                             


                    <!-- </div>
                 </div>-->
                </div>
            </div>
        </div>
    </div>
 </body>
</html>
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function (){
        $("#Trainer_reg").validate({
            rules: {
                credit_hour: {
                    required:true
                },
                COURSE_NAME: {
                    required:true
                },
                TITLE: {
                    required:true
                },
                PRE_REQUEST: {
                    required:true
                },
                Course_type: {
                    required:true
                },
                Course_code: {
                    required:true
                }
            }
        });
    });
</script>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script>
$( "#bdate" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
        dateFormat:'yy-dd-mm'
}),
        $( "#hdate" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
        dateFormat:'yy-dd-mm'
});


</script>
