<%-- 
    Document   : CourseReport
    Created on : 04-Jan-2018, 05:57:58
    Author     : user
--%>
<%@page import="java.sql.Connection"%>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="../css/jQuery.steps.css"/>   
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<link href="../resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<%@include file="../common/head_banner.jsp" %>
<div class="row">
    <% connectionManager con = new connectionManager();
        Connection connection = con.getconnection();
        Statement stmt = connection.createStatement();
    %>
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
                <%@include file="ReportsSidebar.jsp" %>
            </div><!-- /.navbar-collapse -->
        </nav>

    </div>

    <!-- Main Content -->

    <div class="container-fluid">
        <div class="side-body">
             <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-info text-center" style="border-radius: 10px;">
                               <span class="fa fa-list fa-8x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                  
                                        String number_ = null;
                                        String query_no_ = "select count(program_id) from tbl_course_registration";
                                        ResultSet res_no_ = stmt.executeQuery(query_no_);
                                        if (res_no_.next()) {
                                            number_ = res_no_.getString(1);
                                            out.println(number_);
                                        }

                                    %>
                                </div>
                                <div class="text-capitalize text-center"><strong> Program Available </strong> </div>						
                            </div>		
                        </div>
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-info text-center" style="border-radius: 10px;">
                               <span class="fa fa-reorder fa-8x" ></span>
                                <div class="count fa fa-2x">
                                    <%                                     
                                        String number_of_stud = null;
                                        String query_no_student = "select count(course_code) from tbl_course_registration where course_status='ACTIVE'";
                                        ResultSet res_no_student = stmt.executeQuery(query_no_student);
                                        if (res_no_student.next()) {
                                            number_of_stud = res_no_student.getString(1);
                                            out.println(number_of_stud);
                                        }

                                    %>
                                </div>
                                <div class="text-capitalize text-center"><strong> Active Course </strong> </div>						
                            </div>		
                        </div>
            
            <div class="container-fluid">
            <h3 class="text-center page-header">List of Course </h3>
            <div class="form-group col-lg-6 has-success">  
                <span>Department</span>
                <select name="department" id="department"  class="form-control" onchange="showState(this.value)" >
                    <option value="">select department</option>
                    <%
//                                                    connectionManager connnmgr = new connectionManager();
//                                                    Connection con = connnmgr.getconnection();
//                                                    Statement getdept = con.createStatement();
                        String dep_name = null, depid = null;
                        ResultSet rs_dept = stmt.executeQuery("select * from TBL_DEPARTMENT");

                        while (rs_dept.next()) {
                            dep_name = rs_dept.getString("DEP_NAME");
                            depid = rs_dept.getString("DEP_ID");
                    %>
                    <option value="<%=depid%>"><%=dep_name%></option>
                    <%
                        }
                    %>

                </select>                          
            </div>

            <div class="form-group col-lg-6 has-success">  
                <span class="has-success">Program</span>

                <select name="program" id="program" class="form-control has-success" onchange="showStateCourse(this.value)">

                    <option value="">select program</option> 

                </select>
            </div>
            <div class="form-group col-lg-6 has-success">  
                <span class="has-success">Course Approach</span>

                <select name="crs_approach" id="crs_approach" class="form-control has-success" onchange="showTermCourse(this.value)">

                    <option value="">select course_approach</option> 

                </select>
            </div>
        </div>

        <div class="container col-lg-12"  id="report">




        </div>


        <!--            <div class="form-group col-lg-12" > 
                        <button type="submit" id="tnsaveinst" class="btn btn-success"><span class="fa fa-save"><strong>  Show info</strong></span></button>
        
                    </div>-->

    </div>
</div>
</div>
<script  type="text/javascript">

    var xmlHttp;
    function showState(str) {
        if (typeof XMLHttpRequest != "undefined") {
            xmlHttp = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlHttp == null) {
            alert("Browser does not support XMLHTTP Request")
            return;
        }
        var url = ".../common/program.jsp";
        url += "?department=" + str;
        xmlHttp.onreadystatechange = stateChange;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

    function stateChange() {
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
            document.getElementById("program").innerHTML = xmlHttp.responseText
        }
    }
</script>
<script  type="text/javascript">

    var xmlHttp;
    function showStateCourse(str) {
        if (typeof XMLHttpRequest != "undefined") {
            xmlHttp = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlHttp == null) {
            alert("Browser does not support XMLHTTP Request")
            return;
        }
        var url = "CourseApproachPopulate.jsp";
        url += "?program=" + str;
        xmlHttp.onreadystatechange = listcourse;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

    function listcourse() {
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
            document.getElementById("crs_approach").innerHTML = xmlHttp.responseText
        }
    }
    var xmlHttp;
    function showTermCourse(str) {
        if (typeof XMLHttpRequest != "undefined") {
            xmlHttp = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlHttp == null) {
            alert("Browser does not support XMLHTTP Request")
            return;
        }
        var url = "ShowTermReport.jsp";
        url += "?crs_approach=" + str;
        xmlHttp.onreadystatechange = listterm;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

    function listterm() {
        if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
            document.getElementById("report").innerHTML = xmlHttp.responseText
        }
    }
</script>

<script type="text/javascript">
    function myFunction() {
        // Declare variables
        var input, filter, ul, li, a, i;
        input = document.getElementById('myInput');
        filter = input.value.toUpperCase();
        ul = document.getElementById("myUL");
        li = ul.getElementsByTagName('li');

        // Loop through all list items, and hide those who don't match the search query
        for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        }
    }
</script>
