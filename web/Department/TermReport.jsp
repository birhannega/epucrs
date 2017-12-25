<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<div class="form-group col-lg-4">
    <select name="term" id="test_type"  class="form-control"  onchange="showState(this.value)" >
        <option value="">select Test Type</option>

        <%
            connectionManager con = new connectionManager();
            Statement getdept = con.getconnection().createStatement();

            String dep_name = null, depid = null;
            ResultSet rs_dept = getdept.executeQuery("select distinct  term from tbl_Mark");

            while (rs_dept.next()) {
                dep_name = rs_dept.getString("term");
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
                    String academicyear=null;
                 Statement st_bach=con.getconnection().createStatement();
                ResultSet rs_bach=st_bach.executeQuery("select  distinct  ACADEMICYEAR from tbl_mark");
                while(rs_bach.next()){
                    academicyear=rs_bach.getString("ACADEMICYEAR");%>
                    
                        <option value="<%=academicyear%>"><%=academicyear%></option>

                <%
}%>
            </select>
        </div>
            <div class="form-group col-lg-4">
                <select class="form-control" name="program" id="program" onchange="Program(this.value)">
                    <option value="">select program</option>
                    <%String  program=null;
                    Statement st_program=con.getconnection().createStatement();
                    ResultSet rs_program=st_program.executeQuery("select distinct program from tbl_mark");
                    while(rs_program.next()){
                        program=rs_program.getString("program");
                    %><option value="<%=program%>"><%=program%></option>
                    <%
}%>
                </select>
            </div>
<div class="container"  id="report">



</div>

<script  type="text/javascript">

    var xmlHttp;
    function showState(str) {
        if (typeof XMLHttpRequest !="undefined") {
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
        if (typeof XMLHttpRequest !="undefined") {
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
    }  var xmlHttp;
    function Program(str) {
        if (typeof XMLHttpRequest !="undefined") {
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
    function State(str){
        if(typeof XMLHttpRequest !="undefined"){
            xmlHttp=new XMLHttpRequest();
        }
    }</script> 

