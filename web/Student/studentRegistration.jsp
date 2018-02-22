<%@page import="java.text.SimpleDateFormat"%>
<%
//if(session.getAttribute("type")=null)
//{
//response.sendRedirect("Start.jsp");
//}else
//{
%>

<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student registration form</title>
        <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        
    </head>

    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>

        <div class="container">
            <div class="row">

                <%
                    //Get currennt date
                    java.util.Date currentDate = new java.util.Date();
                    //
                    //format date
                    SimpleDateFormat dateformat = new SimpleDateFormat("yy-dd-M");
                    String today = dateformat.format(currentDate);

                    //out.println("Today is "+today);
                    //
                    java.util.Date Currentutilstartdate = dateformat.parse(today);
                    //out.println("Today util is "+today);
                    connectionManager db_con = new connectionManager();
                    Connection con = db_con.getconnection();
                    Statement st_date = con.createStatement();
                    String sql = "select * from TBl_schedule where SCHEDULE_ID=0 ";
                    ResultSet resultSet = st_date.executeQuery(sql);
                    if (resultSet.next()) {
                        java.util.Date dbstartdate = resultSet.getDate("start_date");
                        java.util.Date dbenddate = resultSet.getDate("end_date");
//                        String dbendate = dateformat.format(dbenddate);
//                        String dbstartate = dateformat.format(dbstartdate);
                        // out.println("start Date: " + dbstartdate);
                        if (Currentutilstartdate.compareTo(dbstartdate) >= 0 && Currentutilstartdate.compareTo(dbenddate) <= 0) {
                            String notification = null;
                            if (Currentutilstartdate.compareTo(dbstartdate) == 0) {
                                notification = "<div class='alert alert-success'>Registration starts today</div>";
                            } else if (Currentutilstartdate.compareTo(dbenddate) == 0) {
                                notification = "<div class='alert alert-warning'>Registration ends today</div>";
                            } else {
                                notification = "<div class='alert alert-info'><strong>Registration is open between " + dbstartdate + " and " + dbenddate + "</strong> </div>";
                            }
                %>
                <div id="form">
                    <%
                        out.println(notification);
                    %>
                    <h3 class="text-capitalize">personal info</h3><hr>
                    <form class="form-group" method="Post" action="${pageContext.request.contextPath}/StudentController" id="personalinfo" >
                        <div class="form-group col-sm-4">
                            <label for="Department"> Select department </label>
                            <select name="department" id="department"  class="form-control" onchange="showprogram(this.value)" >
                                <option value="">select department</option>

                                <%
                                    Connection connection = db_con.getconnection();
                                    Statement getdept = db_con.getconnection().createStatement();

                                    String dep_name = null, depid = null;
                                    ResultSet rs_dept = getdept.executeQuery("select * from TBL_DEPARTMENT");

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
                        <div class="form-group col-sm-4">
                            <label>Specify program</label>
                            <select name="program" id="program" class="form-control">
                                <option value="">select program</option> 
                            </select>
                        </div>
                        <div class="form-group col-sm-4">

                            <label>First Name</label>

                            <input type="text" name="studentfirstname"  class="form-control" id="studfirstname" placeholder="Enter first name">
                        </div>
                        <div class="form-group col-sm-4">
                            <label> Middle Name</label>
                            <input type="text" name="studmiddlename" class="form-control" id="studmiddlename" placeholder="Enter Middle name"></div>


                        <div class="form-group col-sm-4">
                            <label> Last Name</label>

                            <input type="tetx" class="form-control" name="studlastname" id="lastname" placeholder="Enter Last name">
                        </div>
                        <div class="form-group col-sm-4">

                            <label> Birth Date</label>
                            <input data-type="date" type="text" class="form-control" name="studbdate" id="studbdate" placeholder="Enter birthdate">
                        </div>
                        <div class="form-group col-sm-4">

                            <label> Nationality</label>
                            <input type="text" name="studnationality" id="country" value="Ethiopia" class="form-control">

                        </div>

                        <div class="form-group col-sm-4">

                            <label>Gender</label>
                            <select  name="studgender" id="studgender" class="form-control" >
                                <option value="">select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-4">
                            <label>  Region</label>
                            <input type="text" class="form-control" name="studbirthregion" id="BRegion" >
                        </div>
                        <div class="form-group col-sm-4">
                            <label>  zone</label>

                            <input type="text" class="form-control" name="studBirthzone" id="Bzone" >
                        </div>
                        <div class="form-group col-sm-4">
                            <label> Wereda</label>
                            <input type="text" class="form-control" name="StudBirthwereda" id="Bwereda" >
                        </div>
                        <div class="form-group col-sm-4">

                            <label> Town(kebele)</label>
                            <input type="text" class="form-control" name="studBirthkebele" id="Bkebele" >
                        </div>
                        <div class="col-lg-12" >
                            <strong><span class="text-uppercase text-muted text-info"><span class="fa fa-home " ></span> Home Address</span></strong>

                        </div>

                        <div class="form-group col-sm-3">

                            <label>  Region</label>
                            <input type="text" class="form-control" name="StudHomeRegion" id="HRegion" >
                        </div>

                        <div class="form-group col-sm-3">

                            <label> zone</label>
                            <input type="text" class="form-control" name="studHomezone" id="Hzone" >
                        </div>
                        <div class="form-group col-sm-3">

                            <label> Wereda</label>
                            <input type="text" class="form-control" name="studHomewereda" id="Hwereda" >
                        </div>
                        <div class="form-group col-sm-3">

                            <label> Town(kebele)</label>
                            <input type="text" class="form-control" name="studHomekebele" id="Hkebele" >
                        </div>  
                        <div class="col-lg-12" >
                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-podcast " ></span> police commission </p></strong>
                        </div>
                                <div class="form-group col-lg-4">
                            <label>  Police commission</label>
                            <input type="text" class="form-control" name="studpcomission" id="pcSector" >
                        </div>
                        <div class="form-group col-lg-4">
                            <label>  sector</label>
                            <input type="text" class="form-control" name="studpcSector" id="pcSector" >
                        </div>
                        <div class="form-group col-lg-4">
                            <label> Mobile</label>
                            <input type="text" class="form-control" name="studpcMobile" id="pcMobile" >
                        </div>
                        <div class="col-lg-12" >
                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user" ></span> Person to be contacted in state of emergency </p></strong>
                        </div>
                        <div class="form-group col-lg-6">
                            <label>  Name</label>
                            <input type="text" class="form-control" name="studcpname" id="cpname" >
                        </div>
                        <div class="form-group col-lg-6">
                            <label> Tel.</label>
                            <input type="text" class="form-control" name="studcptel" id="cptel" >
                        </div>
                        <div class="form-group col-lg-6">
                            <label> Mobile</label>
                            <input type="tel" class="form-control" name="studcpmobile" id="cpmobile" >
                        </div>
                        <div class="form-group col-lg-6">

                            <label> relationship</label>

                            <input type="text" class="form-control" name="studcprelation" id="cprelation" >
                        </div>
                        <div class="form-group col-lg-6">
                            <label> Address</label>
                            <input type="text" class="form-control" name="studcpaddress" id="cpaddress" >
                        </div>
                        <div class="form-group col-lg-6">
                            <label> religion</label>
                            <input type="text" class="form-control" name="studcpreligion" id="cpreligion" >
                        </div>

                        <div class="form-group col-sm-4">
                            <br>
                            <button class=" btn btn-primary"><strong> Save personal info</strong></button>
                        </div>
                    </form>
                </div>
                                <% } else if(Currentutilstartdate.after(dbenddate)){
                %>
                                    <div class="container">
                                        <div class="">
                                            <h1 class="text text-danger"> <span class="fa fa-times-circle"></span> Time is up! <a href="${pageContext.request.contextPath}"><button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-log-in"> </span> <strong> Back to Login </strong></button></a>
<br></h1>
                                            
                                        </div>
                                        <div class="alert alert-warning">

                                            Registration at this time is not allowed

                                        </div> 
                                        <p class="text-info">
                                            The registration period for this academic year was between <strong> <%=dbstartdate%> and <%=dbenddate%>.</strong>
                                        </p>
                                    </div>
                         <%
                        }else if(Currentutilstartdate.before(dbstartdate)){
 %>
                                    <div class="container">
                                        
                                        <div class="">
                                            <h4 class="text text-danger"> <span class="fa fa-times-circle"></span> registration not yet started</h4>
                                        </div>
                                        <div class="alert alert-warning">


                                            Registration at this time is not allowed</span>

                                        </div> 
                                        <p class="text-info">
                                            The registration period for this academic year was between <%=dbstartdate%> and <%=dbenddate%>.
                                        </p>
                                    </div>
                         <%

}
                      } else {
                        out.print("<div class='alert alert-danger'>schedule is not defined</div>");
                    }
                %>



            </div> </div>
<script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../resources/js/getprogram.js" type="text/javascript"></script>

        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
        <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <style rel="stylesheet">
            .error{
                color: red;
            }
        </style>
        <script type="text/javascript">

                                $(document).ready(function ()
                                {
                                    $('#studbdate').datepicker({
                                        changeYear: true,
                                        changeMonth: true,
                                        inline: true
                                    });
                                    $("#personalinfo").validate({
                                        rules: {
                                            department: {
                                                required: true
                                            },
                                            program: {
                                                required: true
                                            },
                                            studentfirstname: {
                                                required: true
                                            },
                                            studmiddlename: {
                                                required: true
                                            },
                                            studlastname: {
                                                required: true
                                            },
                                            studbdate: {
                                                required: true
                                            },
                                            studgender: {
                                                required: true
                                            },
                                            studnationality: {
                                                required: true
                                            },
                                            studbirthregion: {
                                                required: true
                                            },
                                            studBirthzone: {
                                                required: true
                                            },
                                            StudBirthwereda: {
                                                required: true
                                            },
                                            studBirthkebele: {
                                                required: true
                                            },
                                            studcpname: {
                                                required: true
                                            },
                                            studcptel: {
                                                required: true
                                            },
                                            studcpmobile: {
                                                required: true
                                            },
                                            StudHomeRegion: {
                                                required: true
                                            },
                                            studHomezone: {
                                                required: true
                                            },
                                            studcprelation: {
                                                required: true
                                            },
                                            studHomewereda: {
                                                required: true
                                            },
                                            studpcMobile: {
                                                required: true
                                            },
                                            studpcSector: {
                                                required: true
                                            },
                                            studcpaddress: {
                                                required: true
                                            },
                                            studcpreligion: {
                                                required: true
                                            }
                                        }
                                    });

                                });
        </script>

    </body>
</html>