<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Add-user</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
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
                        <%@include file="../common/depsidebar.jsp" %>
                    </div><!-- /.navbar-collapse -->
                </nav>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">

                    <%--<%@include file="adduser_form.jsp" %>--%>
                    ${ClassReg}
                    ${ClassNotReg}
                    <p class="page-header text-primary text-center">Class and Course Re-Assign</p>
     <form class="form-group " method="post" id="instrAssign" action="${pageContext.request.contextPath}//CourseAssignment">
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon" style="color: #007fff">Search By</span>
                                            <select name="testdrop" class="form-control" id="testdrop"  required="required">
                                                <option>-select criteria-</option>
                                                <option>Instructor_ID</option>
                                                <option>Instructor_Name</option>
                                            </select>

                                        </div>
                                    </div>
                                    <!--<form role="search">-->
                                    <div class="form-group col-lg-8">
                                        <div class="input-group col-lg-4">
                                            <input type="text" class="form-control" placeholder="Search">
                                            <div class="input-group-btn">
                                                <button type="submit" class="btn btn-default">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!--</form>--> 


                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Select Instructor</span>
                                            <select class="form-control" id="selectinstr" name="selectinstr" required="required">
                                                <option value="-1">-select instructor-</option>
                                                <%
                                                    try {
                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                        String lis_inst_sql = "select staff_id, FIRST_NAME ||  ' ' ||  MIDDLE_NAME  || ' ' || LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG";

                                                        ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_list_inst.next()) {
                                                        String id = rs_list_inst.getString("FULL_NAME");
                                                        //cid;
%>
                                                <option><%=id%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Assigned Date</span>
                                            <input class="form-control" id="dateassigned" name="dateassigned" placeholder="Enter Assigned Date" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Course</span>
                                            <select class="form-control" id="course" name="course" required="required">
                                                <option value="-1">-select course-</option>
                                                <%
                                                    try {
                                                        connectionManager dbconnection = new connectionManager();
                                                        Statement st_course = dbconnection.getconnection().createStatement();
                                                        String crs_sql = "select COURSE_NAME from TBL_COURSE_REGISTRATION";

                                                        ResultSet rs_cours = st_course.executeQuery(crs_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_cours.next()) {
                                                        String id = rs_cours.getString("COURSE_NAME");
                                                        //cid;
%>
                                                <option><%=id%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Credit Hour</span>
                                            <input type="text" name="creditH"  class="form-control" id="creditH" placeholder="Enter Credit Hour">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Modified Date</span>
                                            <input class="form-control" id="datemodifiedby" name="datemodifiedby" placeholder="Enter Modified Date" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Modified By</span>
                                            <input type="text" name="modifiedby"  id="modifiedby" class="form-control" id="modifiedby" placeholder="Enter Modifier">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Period</span>
                                            <input type="text" name="period"  class="form-control" id="period" placeholder="Enter Modifier">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Previous Instructor</span>
                                            <input type="text" name="previousinstructor"  class="form-control" id="previousinstructor" placeholder="Enter Previous Instructor">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-12" > 
                                        <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save info</strong></span></button>

                                    </div>
                                </form>
                                <div class="list-group col-lg-4">
                                    <a href="#" class="list-group-item active">
                                        Subject Info/Total Course
                                        <span class="badge">6</span>
                                    </a>
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                                </div>
                                <div class="list-group col-lg-4">
                                    <a href="#" class="list-group-item active">
                                       Course Assign<span class="badge">7</span>
                                    </a>
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                                </div>
                                <div class="list-group col-lg-4">
                                    <a href="#" class="list-group-item active">
                                        Period Schedule<span class="badge">3</span>
                                    </a>
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                                </div>
                    <%    request.getSession().setAttribute("ClassReg", null);
                        request.getSession().setAttribute("ClassNotReg", null);
                    %>
                </div>  <!--body end-->
                <!--test tab-->
                <script type="text/javascript">
$(document).ready(function(){
	$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
		localStorage.setItem('activeTab', $(e.target).attr('href'));
	});
	var activeTab = localStorage.getItem('activeTab');
	if(activeTab){
		$('#myTab a[href="' + activeTab + '"]').tab('show');
	}
});
</script>
<style type="text/css">
	.bs-example{
		margin: 20px;
	}
</style>
</head>
<body>
<div class="bs-example">
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a data-toggle="tab" href="#sectionA">Section A</a></li>
        <li><a data-toggle="tab" href="#sectionB">Section B</a></li>
        <li><a data-toggle="tab" href="#sectionC">Section C</a></li>
    </ul>
    <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
            <h3>Section A</h3>
            <p>Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui. Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth.</p>
        </div>
        <div id="sectionB" class="tab-pane fade">
            <h3>Section B</h3>
             <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">Police Management</span>
                                        <input class="form-control" id="polcemngmtupdate" name="polcemngmtupdate" placeholder="Select Polce Management"  required="" value="">

                                        <!--</div>-->
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-sm-6">
                                        <button type="submit" id="saveinstexp" class="btn btn-warning">
                                            <span class="fa fa-save"><strong> Update Academic Staff</strong></span></button>
                                    </div>     
        </div>
        <div id="sectionC" class="tab-pane fade">
            <h3>Section C</h3>
            <p>Vestibulum nec erat eu nulla rhoncus fringilla ut non neque. Vivamus nibh urna, ornare id gravida ut, mollis a magna. Aliquam porttitor condimentum nisi, eu viverra ipsum porta ut. Nam hendrerit bibendum turpis, sed molestie mi fermentum id. Aenean volutpat velit sem. Sed consequat ante in rutrum convallis. Nunc facilisis leo at faucibus adipiscing.</p>
        </div>
    </div>
</div>
            </div>
        </div>

        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
                    $('#search').removeClass('in').addClass('collapse').slideUp(200);

                    /// uncomment code for absolute positioning tweek see top comment in css
                    //$('.absolute-wrapper').toggleClass('slide-in');

                });

                // Remove menu for searching
                $('#search-trigger').click(function () {
                    $('.navbar-nav').removeClass('slide-in');
                    $('.side-body').removeClass('body-slide-in');

                    /// uncomment code for absolute positioning tweek see top comment in css
                    //$('.absolute-wrapper').removeClass('slide-in');

                });
            });
        </script>
        <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
    $("#dateassigned").datepicker({
        changeMonth: true,
        changeYear: true,
       dateFormat: 'yy-mm-dd'

    });
    $("#datemodifiedby").datepicker({
        changeMonth: true,
        changeYear: true,
       dateFormat: 'yy-mm-dd'

    });
    
</script>   
    </body>
</html>
