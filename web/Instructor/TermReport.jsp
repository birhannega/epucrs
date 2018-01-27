<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<%@include file="../common/head_banner.jsp" %>
<div class="row">
    <!-- uncomment code for absolute positioning tweek see top comment in css -->
    <!-- <div class="absolute-wrapper"> </div> -->
    <!-- Menu -->
    <div class="side-menu">

        <nav class="navbar navbar-default" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <!--                    <div class="navbar-header">
            <%--<%@include file="../common/depsideheader.jsp" %>--%>

        </div>-->

            <!-- Main Menu -->
            <div class="side-menu-container">
                <%@include file="InstructorSidebar.jsp" %>
            </div><!-- /.navbar-collapse -->
        </nav>

    </div>

    <!-- Main Content -->
    <div class="container-fluid">
        <div class="side-body">


            <div class="container-fluid">
                <h3 class="text-center page-header">List of Reports </h3>
                <div class="form-group col-lg-4">
                    <select name="term" id="test_type"  class="form-control"  onchange="showState(this.value)" >
                        <option value="">select Test Type</option>

                        <%
                            connectionManager con = new connectionManager();
                            Statement getdept = con.getconnection().createStatement();

                            String dep_name = null, depid = null;
                            ResultSet rs_dept = getdept.executeQuery("select distinct  term_id from tbl_Mark");

                            while (rs_dept.next()) {
                                dep_name = rs_dept.getString("term_id");
                        %>
                        <option value="<%=dep_name%>"><%=dep_name%></option>
                        <%
                            }
                        %>
                    </select>  

                </div>
                <div class="form-group col-lg-4">
                    <select class="form-control" name="bach" id="bach" onchange="academicYear(this.value)">
                        <option value=""> Select Bach of Student</option>
                        <%
                            String academicyear = null;
                            Statement st_bach = con.getconnection().createStatement();
                            ResultSet rs_bach = st_bach.executeQuery("select  distinct  ACADEMICYEAR from tbl_mark");
                            while (rs_bach.next()) {
                                academicyear = rs_bach.getString("ACADEMICYEAR");%>

                        <option value="<%=academicyear%>"><%=academicyear%></option>

                        <%
                            }%>
                    </select>
                </div>
                <div class="form-group col-lg-4">
                    <select class="form-control" name="program" id="program" onchange="Program(this.value)">
                        <option value="">select program</option>
                        <%String program = null;
                            Statement st_program = con.getconnection().createStatement();
                            ResultSet rs_program = st_program.executeQuery("select distinct program_id from tbl_mark");
                            while (rs_program.next()) {
                                program = rs_program.getString("program_id");
                        %><option value="<%=program%>"><%=program%></option>
                        <%
                            }%>
                    </select>
                </div>
            </div>

            <div class="container col-lg-12"  id="report">


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
                    var url = "getreport.jsp";
                    url += "?term=" + str;
                    xmlHttp.onreadystatechange = stateChange;
                    xmlHttp.open("GET", url, true);
                    xmlHttp.send(null);
                }
                var xmlHttp;
                function academicYear(str) {
                    if (typeof XMLHttpRequest != "undefined") {
                        xmlHttp = new XMLHttpRequest();
                    } else if (window.ActiveXObject) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (xmlHttp == null) {
                        alert("Browser does not support XMLHTTP Request")
                        return;
                    }
                    var url = "getbach.jsp";
                    url += "?bach=" + str;
                    xmlHttp.onreadystatechange = stateChange;
                    xmlHttp.open("GET", url, true);
                    xmlHttp.send(null);
                }
                var xmlHttp;
                function Program(str) {
                    if (typeof XMLHttpRequest != "undefined") {
                        xmlHttp = new XMLHttpRequest();
                    } else if (window.ActiveXObject) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (xmlHttp == null) {
                        alert("Browser does not support XMLHTTP Request")
                        return;
                    }
                    var url = "getprogram.jsp";
                    url += "?program=" + str;
                    xmlHttp.onreadystatechange = stateChange;
                    xmlHttp.open("GET", url, true);
                    xmlHttp.send(null);
                }
                function stateChange() {
                    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                        document.getElementById("report").innerHTML = xmlHttp.responseText
                    }
                }
                function State(str) {
                    if (typeof XMLHttpRequest != "undefined") {
                        xmlHttp = new XMLHttpRequest();
                    }
                }</script> 

