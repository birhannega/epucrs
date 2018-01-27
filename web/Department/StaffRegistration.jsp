<%@page import="java.sql.SQLException"%>
<%@page import="java.lang.ClassNotFoundException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
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
        <%
            connectionManager dbconnection = new connectionManager();
            Statement stmt = dbconnection.getconnection().createStatement();
        %>
        <!--        <style>
                    .accordion-toggle {cursor: pointer;}
                    .accordion-content {display: none;}
                    .accordion-content.default {display: block;}
                </style>-->
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

                    <ul class="nav nav-tabs" id="myTab">

                        <li class="active"><a data-toggle="tab" href="#sectionA"><span class="glyphicon glyphicon-user">AcademicStaffProfile</span></a></li>

                        <li><a data-toggle="tab" href="#sectionB"><span class="glyphicon glyphicon-user glyphicon-user"></span>EditAcademicStaffprofile<span class="glyphicon glyphicon-pencil"></span></a></li>

                        <li><a data-toggle="tab" href="#sectionC"><span class="glyphicon glyphicon-user glyphicon-camera"></span>EditPhoto<span class="glyphicon glyphicon-user glyphicon-pencil"></span></a></li>

                        <li><a data-toggle="tab" href="#sectionD"><span class="glyphicon glyphicon-user glyphicon-user"></span>AddExperiance<span class="glyphicon glyphicon-user glyphicon-check"></span></a></li>

                    </ul>
                    <!--<div id="tabs-1">-->
                    <div class="tab-content">

                        <div id="sectionA" class="tab-pane fade in active">
                            <br>
                            ${instreg}
                            ${instNotreg}
                            <!--<span class="glyphicon glyphicon-list"><h4 class="accordion-toggle">Instructor Profile</h4></span>-->

                            <form class="form-group " method="POST" enctype="multipart/form-data" id="stud_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet">

                                <!--<div class="form-group col-lg-12">Instructor Id:<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled id="instid" name="instid" value=""></div>--> 
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <input  type="file" name="ImageFile" id="ImageFile" />
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Instructor ID</span>
                                        <input type="text" name="instid"  class="form-control" id="instid" value="inst_100" placeholder="Enter Instructor ID!">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">

                                    <div class="input-group">
                                        <span class="input-group-addon" >Title</span>
                                        <select class="form-control" id="insttitle" name="insttitle" >
                                            <option value="">-select title-</option>
                                            <option value="Commissioner">Commissioner</option>
                                            <option value="assCommissioner">Ass/Commissioner</option><option value="Deputy Commissioner">Deputy Commissioner</option>
                                            <option value="Commander">Commander</option><option value="Ass/Commander">Ass/Commander</option><option value="Deputy Commander">Deputy Commander</option>
                                            <option value="Ass/Commander">Ass/Commander</option>
                                            <option value="Inspector">Inspector</option><option value="Deputy Inspector">Deputy Inspector</option>
                                            <option value="Sergeant">Sergeant</option><option value="">Ass/Sergeant</option><option value="">Deputy Sergeant</option>
                                            <option value="">Constable</option><option value="">Nominee Officer</option>
                                            <option value="">Commissioner General</option><option value="">Deputy Commissioner General</option>
                                            <option value="">Deputy Inspector</option><option value="">Engineer Doctor</option>
                                            <option value="">Sister</option><option value="">Health Officer</option><option value="">Nurse</option><option value="">Mid Wife</option>
                                            <option value="">Secretary</option><option value="">Director</option><option value="">Head Director</option>
                                            <option value="">Ra/Tech</option>
                                            <option value="33">Mr</option><option value="34">Ms</option><option value="35">Phd</option><option value="36">Doctor</option>
                                        </select>
                                    </div>
                                </div>   
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Name</span>
                                        <input type="text" name="firstname"  class="form-control" id="firstname" placeholder="Enter First Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Middle Name</span>
                                        <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Middle Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Last Name</span>
                                        <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Last Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phone NO</span>
                                        <input type="text" name="phoneno"  class="form-control" id="phoneno" placeholder="Enter Phone NO">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Email</span>
                                        <input type="text" name="email"  class="form-control" id="email" placeholder="Enter Email">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Department</span>
                                        <select class="form-control" id="department" name="department" required="required">
                                            <option value="">-select department-</option>
                                            <%
                                                try {
//                                                    connectionManager dbconnection = new connectionManager();
//                                                    Statement st_program = dbconnection.getconnection().createStatement();
                                                    String qury = "select * from lu_dep";

                                                    ResultSet rs_program = stmt.executeQuery(qury);

                                            %>
                                            //                                                                        
                                            <%    while (rs_program.next()) {
                                                    String id = rs_program.getString("dep_name");
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
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Status</span>
                                        <select class="form-control" id="status" name="status" required="requiered">
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Type</span>
                                        <select class="form-control" id="insttype" name="insttype" required="requiered">
                                            <option value="">-select type-</option>
                                            <option value="Civil">Civil</option>
                                            <option value="Military">Military</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Responsibility</span>
                                        <select class="form-control" id="responsibility" name="responsibility" required="required">
                                            <option value="">-select responsibility-</option>
                                            <%
                                                try {
//                                                    connectionManager dbconnection = new connectionManager();
//                                                    Statement st_program = dbconnection.getconnection().createStatement();
                                                    String program_sql = "select * from lu_responsibility";

                                                    ResultSet rs_program = stmt.executeQuery(program_sql);

                                            %>
                                            //                                                                        
                                            <%    while (rs_program.next()) {
                                                    String id = rs_program.getString("resp_name");
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
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Hired Date</span>
                                        <input class="form-control" id="hirddate" name="hirddate" placeholder="Enter Assigned Date" type="date" required=""/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Police Science</span>
                                        <select class="form-control" id="policemngmt" name="policemngmt" required="requiered">
                                            <option value="">-select PS type-</option>
                                            <option value="Yes">Yes</option>
                                            <option value="No">No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon">Description</span>
                                        <textarea type="text" name="description"  class="form-control" id="description" placeholder="Enter Description"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <button type="submit" id="tnsaveinst" class="btn btn-primary">
                                        <span class="fa fa-save"><strong>  Save staff info</strong></span></button>
                                </div>
                            </form>
                        
                 

                            <%
                                session.setAttribute("instreg", null);
                                session.setAttribute("instNotreg", null);
                            %>
                        </div>
                        <!--</div>-->
                        <!--<div id="tabs-2">-->
                        <div id="sectionB" class="tab-pane fade">
                            <br>
                            ${staffinfoUpdate}
                            ${staffinfoNotUpdate}
                            ${del}
                            <%
                                if (request.getParameter("action") != null && request.getParameter("id") != null) {
                                    String action = request.getParameter("action");
                                    String id = request.getParameter("id");
                                    if (action.equalsIgnoreCase("delete")) {
                                        //Alert="";
                                        ResultSet rs_delete_update = stmt.executeQuery("delete from TBL_ACADEMIC_STAFF_REG where ACADEMIC_STAFF_ID='" + id + "'");
                                        //                                if (rs_delete_update.next()) {

                            %>    

                            <% } else if (action.equalsIgnoreCase("edit")) {

                                ResultSet rs_edit_update = stmt.executeQuery("select * from TBL_ACADEMIC_STAFF_REG where ACADEMIC_STAFF_ID='" + id + "'");
                                if (rs_edit_update.next()) {


                            %>


                            <!--<div class="container-fluid">-->

                            <form class="form-group " role="form" method="post" id="instrAssign"  action="${pageContext.request.contextPath}//StaffRegUpdateServlet">
                                <div class="form-group col-lg-4 has-success">
                                    <span class="" style="font-weight: bolder">Instructor ID</span>
                                    <input class="form-control" name="acdstaffid" id="acdstaffid" value="<%=rs_edit_update.getString("ACADEMIC_STAFF_ID")%>"  readonly>
                                </div>

                                <div class="form-group col-lg-4 has-success has-feedback">
                                    <!--<div class="form-group">-->
                                    <span class="" style="font-weight: bolder">Profile Photo</span>

                                    <input class="form-control" type="text" name="ImageFile" id="ImageFile" value="<%=rs_edit_update.getString("IMAGE")%>"/>

                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <span class="" style="font-weight: bolder">Instructor Title</span>
                                    <input class="form-control" name="insttitleupdate" id="insttitleupdate" value="<%=rs_edit_update.getString("Title")%>" >
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Instructor First Name</span>
                                    <input class="form-control" value="<%=rs_edit_update.getString("First_Name")%>" name="instnameupdate">
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Instructor Middle Name</span>
                                    <input class="form-control" value="<%=rs_edit_update.getString("MIDDLE_NAME")%>" name="instMiddlenameupdate" >
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Instructor Last Name</span>
                                    <input class="form-control" value="<%=rs_edit_update.getString("LAST_NAME")%>" name="instLastnameupdate" >
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Phone No</span>
                                    <input class="form-control" value="<%=rs_edit_update.getString("Phone")%>" name="phonenoupdate">
                                    <!--</div>-->
                                </div>

                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">E-mail</span>
                                    <input class="form-control" id="emailupdate" name="emailupdate" placeholder="Enter E-mail"  required="" value="<%=rs_edit_update.getString("E_MAIL")%>">
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">

                                    <span class="" style="font-weight: bolder">Department</span>
                                    <input class="form-control" name="departmentupdate" value="<%=rs_edit_update.getString("Department")%>">

                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Status</span>
                                    <!--<input class="form-control" value="<%=rs_edit_update.getString("STATUS")%>" name="statusupdate" >-->
                                    <select class="form-control" id="statusupdate" name="statusupdate">
                                        <option class="" value="<%=rs_edit_update.getString("STATUS")%>"><%=rs_edit_update.getString("STATUS")%></option>
                                    <!--<input class="form-control" id="staftypeupdate" name="staftypeupdate" placeholder="Enter Staff Type"  required="" value="<%=rs_edit_update.getString("STAFF_TYPE")%>">-->
                                        <option value="">-select status-</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">STAFF_TYPE</span>
                                    <select class="form-control" name="staftype" id="staftype">
                                        <option class="" value="<%=rs_edit_update.getString("STAFF_TYPE")%>"><%=rs_edit_update.getString("STAFF_TYPE")%></option>
                                    <!--<input class="form-control" id="staftypeupdate" name="staftypeupdate" placeholder="Enter Staff Type"  required="" value="<%=rs_edit_update.getString("STAFF_TYPE")%>">-->
                                        <option value="">-select type</option>
                                        <option value="Military">Active</option>
                                        <option value="Civil">Inactive</option>
                                    </select>
                                    <!--</div>-->
                                </div>

                                <div class="form-group col-lg-4 has-success">
                                    <span class="" style="font-weight: bolder">Responsibility</span>
                                    <input class="form-control" name="responsibilityupdate" value="<%=rs_edit_update.getString("RESPONSIBILITY")%>" >
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Hired Date</span>
                                    <input class="form-control" value="<%=rs_edit_update.getString("HIRED_DATE")%>" name="hireddateupdate" id="hireddateupdate">
                                    <!--</div>-->
                                </div>

                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Police Management</span>
                                    <input class="form-control" id="polcemngmtupdate" name="polcemngmtupdate" placeholder="Select Polce Management"  required="" value="<%=rs_edit_update.getString("POLICE_MANAGEMENT")%>">

                                    <!--</div>-->
                                </div>
                                <div class="form-group col-lg-4 has-success">
                                    <!--<div class="input-group">-->
                                    <span class="" style="font-weight: bolder">Description</span>
                                    <textarea class="form-control" id="descriptionupdate" name="descriptionupdate" placeholder="Enter description"  required="" ><%=rs_edit_update.getString("DESCRIPTION")%> </textarea>

                                    <!--</div>-->
                                </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <button type="submit" id="saveinstexp" class="btn btn-warning">
                                        <span class="fa fa-save"><strong> Update Academic Staff</strong></span></button>
                                </div>
                            </form>

                            <!--</div>-->

                            <%}
                                    }
                                }
                            %>
                            <%
                                session.setAttribute("del", null);
                                session.setAttribute("staffinfoUpdate", null);
                                session.setAttribute("staffinfoNotUpdate", null);
                            %>
                            <table  class="table table-striped table-bordered table-hover "  id="tabledata">
                                <thead>
                                    <tr>
                                        <th>Instructor TITLE</th>
                                        <th>Instructor NAME</th>
                                        <th>DEPARTMENT</th>
                                        <th>PHONE</th>
                                        <th>STATUS</th>
                                        <th>POLICE MANAGEMENT</th>
                                        <!--<th>IMAGE</th>-->
                                        <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                                        <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                                    </tr>
                                </thead>


                                <tbody>
                                    <%
                                        //                                        connectionManager dbconnection = new connectionManager();
                                        //                                        Statement st_list_course = dbconnection.getconnection().createStatement();
                                        String course_sql = "select  ACADEMIC_STAFF_ID,Title, First_Name || ' '|| Middle_Name || ' '|| LAST_NAME as FULL_NAME,department,Phone, STATUS ,POLICE_MANAGEMENT,IMAGE from TBL_ACADEMIC_STAFF_REG ";

                                        ResultSet rs_acdstaff = stmt.executeQuery(course_sql);
                                        while (rs_acdstaff.next()) {
                                            String id = rs_acdstaff.getString(1);
                                    %>
                                    <tr>
                                        <td><%=rs_acdstaff.getString(2)%></td> 
                                        <td><%=rs_acdstaff.getString(3)%></td> 
                                        <td><%=rs_acdstaff.getString(4)%></td> 
                                        <td><%=rs_acdstaff.getString(5)%></td> 
                                        <td><%=rs_acdstaff.getString(6)%></td> 
                                        <td><%=rs_acdstaff.getString(7)%></td>
                                         <!--<td><%=rs_acdstaff.getString(8)%></td>-->
                                        <td>
                                            <form action="" method="post">
                                                <input type="hidden" name="action" value="edit"/>
                                                <input type="hidden" name="id" id="edit_id" value="<%=rs_acdstaff.getString(1)%>"/>

                                                <button class="btn btn-warning glyphicon glyphicon-edit" id="editid">Edit</button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="" class="form-group" method="Post" >
                                                <input type="hidden" name="action" value="delete"/>
                                                <input type="hidden" name="id" id="delete_id" value="<%=rs_acdstaff.getString(1)%>"/>

                                                <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid" onclick="return getData()">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>
                            <strong></strong>

                        </div>
                        <div id="sectionC" class="tab-pane fade">

                            <form class="form-group">

                                <br>
                                <div class="input-group col-lg-4">
                                    <!--<label class="form-control">Search By ID:</label>--> 
                                    <input  type="text" name="staffidimage" id="staffidimage" placeholder="Enter Stud ID!" class="form-control">
                                    <div class="input-group-btn">
                                        <!--<input type="submit" value="search"/>-->
                                        <button type="submit" class="btn btn-default">
                                            <span class="glyphicon glyphicon-search">Search</span>
                                        </button>
                                        <!--<span class="glyphicon glyphicon-search"></span>-->
                                    </div>
                                </div>
                                <%
                                    String sid = request.getParameter("staffidimage");

                                    if (sid == null || sid == "") {
                                        //                                        out.println("Enter correct id");
                                        //                                         out.println("<img width='100' height='50' src=displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
                                    } else {

                                        connectionManager con = new connectionManager();
                                        PreparedStatement ps = con.getconnection().prepareStatement("select * from TBL_ACADEMIC_STAFF_REG where ACADEMIC_STAFF_ID='" + sid + "'");
                                        ResultSet rs = ps.executeQuery();
                                        //                            out.println("<h3>Students</h3>");
                                        while (rs.next()) {
                                            //                   out.println("<h3>" + rs.getString("ACADEMIC_STAFF_ID") + "</h3>");
                                            //                    out.println("<img width='100' height='50' src=../displayphoto?name=" +  rs.getString("ACADEMIC_STAFF_ID")+"></img>");
                                %>

                                <div class="col-lg-6"> <p class="page-header"><%=rs.getString("FIRST_NAME")%></p>
                                    <% out.println("<img width=100' height='100' src=../displayphoto?name=" + rs.getString("ACADEMIC_STAFF_ID") + "></img>");%> 

                                    <%  }

                                    %>

                                </div>
                            </form>
                            <form class="form-group" method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}//UpdatestaffImage">

                                <input type="hidden" name="displayimageid" id="displayimageid" value="<%=request.getParameter("staffidimage")%>">

                                <!--<div class="form-group col-lg-4 has-success has-feedback">-->
                                <div class=" col-lg-8 input-group">
                                    <input type="file" name="Imageupdate" id="Imageupdate" />
                                </div>
                                <div class="col-lg-8">
                                    <input type="submit" value="update" class="btn btn-warning"/>
                                </div>

                                <%}%> 
                            </form>

                        </div>



                        <!--                    </div>-->
                        <!--<div id="tabs-3">-->
                        <div id="sectionD" class="tab-pane fade">
                            <br>
                            <!--<h3>Section C</h3>-->
                            ${academicexpRegistered}
                            ${academicexpNotRegistered}
                            <form class="form-group " method="post" id="staffexpform" action="${pageContext.request.contextPath}/AcademicExperianceServlet">
                               <div <div class="table table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Qualification</th>
                                            <th>Area of Expertise</th>
                                            <th>Organization Type</th>
                                            <th>Organization Name</th>
                                            <th>Total Experience</th>
                                            <th>From</th>
                                            <th>To</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td> 
                                                <select class="form-control" id="qualification" name="qualification" required="required">
                                                    <option value="">-select Qualification-</option>
                                                    <option value="Diploma">Diploma</option>
                                                    <option value="BSC Dgree">BSC Dgree</option>
                                                    <option value="MSC">MSC</option>
                                                    <option value="PHD">PHD</option>
                                                    <option value="CERTIFICATE">CERTIFICATE</option>
                                                    <option value="LEVEL1">LEVEL1</option>
                                                    <option value="LEVEL2">LEVEL2</option>
                                                    <option value="LEVEL3">LEVEL3</option>
                                                    <option value="LEVEL4">LEVEL4</option>
                                                </select>
                                            </td>
                                            <th scope="row"><select class="form-control" id="expctgry" name="expctgry" required="required">
                                                    <option value="">-select category-</option>
                                                    <option value="Lecture">Lecture</option>
                                                    <option value="Lecture">Assistant Lecture</option>
                                                    <option value="IT">IT</option>
                                                    <option value="Software">Software</option>
                                                    <option value="Maintenance">Maintenance</option>
                                                    <option value="Management">Management</option>
                                                    <option value="Finance">Finance</option>
                                                    <option value="Health">Health</option>
                                                    <option value="Accounting">Accounting</option>
                                                </select></th>

                                            <td> 
                                                <select class="form-control" id="officetype" name="officetype" required="required">
                                                    <option value="">-select Office-</option>
                                                    <option value="Government Office">Government Office</option>
                                                    <option value="Private Office">Private Office</option>
                                                </select>
                                            </td>
                                            <td><input type="text" id="orgname" name="orgname" placeholder="Enter org name"></td>
                                            <td><input type="text" id="totalexp" name="totalexp" placeholder="Enter total exp"></td>
                                            <td class="col-lg-2">
                                                <div class="input-group">
                                                    <div class="input-group">
                                                        <input class="form-control " id="datefrom_lect_from" name="datefrom_exp_from" placeholder="Enter  Date" type="date" required=""/>
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="col-lg-2">
                                                <div class="input-group">
                                                    <input class="form-control " id="datefrom_lect_to" name="datefrom_exp_to" placeholder="Enter  Date" type="date" required=""/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                                   </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <button type="submit" id="saveinstexp" class="btn btn-primary">
                                        <span class="fa fa-save"><strong>  Save Instructor Expertise</strong></span></button>
                                </div>
                            </form> 
                            <p class="page-header"></p>

                            <%
                                session.setAttribute("academicexpRegistered", null);
                                session.setAttribute("academicexpNotRegistered", null);
                            %>

                            <!--update exp able-->
                            <%
                                if (request.getParameter("action") != null && request.getParameter("id") != null) {
                                    String action = request.getParameter("action");
                                    String id = request.getParameter("id");
                                    if (action.equalsIgnoreCase("delete")) {
                                        //Alert="";
                                        ResultSet rs_delete_update = stmt.executeQuery("delete from TBL_ACADEMIC_EXPERTISE where SEQNO_ACADEMIC_EXPERTIES='" + id + "'");
                                        //                                if (rs_delete_update.next()) {

                            %>    

                            <% } else if (action.equalsIgnoreCase("edit")) {

                                ResultSet rs_update = stmt.executeQuery("select * from TBL_ACADEMIC_EXPERTISE where SEQNO_ACADEMIC_EXPERTIES='" + id + "'");
                                if (rs_update.next()) {


                            %>


                            <div class="form-group">

                                <form class="form-group " role="form" method="post" id="instrAssign"  action="${pageContext.request.contextPath}//StaffExperianceUpdateServlet">
                                    <div class="form-group col-lg-4 has-success">
                                        <span class="" style="font-weight: bolder">Instructor ID</span>
                                        <input class="form-control" name="acdstaffid" id="acdstaffid" value="<%=rs_update.getString("ACADEMIC_STAFF_ID")%>"  >
                                    </div>


                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <!--<div class="form-group">-->
                                        <span class="" style="font-weight: bolder">INSTEXP ID</span>

                                        <input class="form-control" type="text" name="expid" id="expid" value="<%=rs_update.getString("INSTEXP_ID")%>" readonly=""/>

                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">QUALIFICATION</span>
                                        <!--<input class="form-control" value="<%=rs_update.getString("QUALIFICATION")%>" name="orgtype">-->
                                        <select class="form-control" id="editqualification" name="editqualification" required="required">
                                            <option value="<%=rs_update.getString("ORG_TYPE")%>"><%=rs_update.getString("ORG_TYPE")%></option>
                                            <option value="">-select qualification-</option>
                                            <option value="Diploma">Diploma</option>
                                            <option value="BSC Dgree">BSC Dgree</option>
                                            <option value="MSC">MSC</option>
                                            <option value="PHD">PHD</option>
                                            <option value="CERTIFICATE">CERTIFICATE</option>
                                            <option value="LEVEL1">LEVEL1</option>
                                            <option value="LEVEL2">LEVEL2</option>
                                            <option value="LEVEL3">LEVEL3</option>
                                            <option value="LEVEL4">LEVEL4</option>
                                        </select>
                                        <!--</div>-->
                                    </div>

                                    <div class="form-group col-lg-4 has-success">
                                        <span class="" style="font-weight: bolder">AREA_EXPERTISE</span>
                                        <!--<input class="form-control" name="areaexp" id="areaexp" value="<%=rs_update.getString("AREA_EXPERTISE")%>" >-->


                                        <select class="form-control" id="expctgry" name="expctgry" required="required"  >

                                            <option value="<%=rs_update.getString("AREA_EXPERTISE")%>"><%=rs_update.getString("AREA_EXPERTISE")%></option>
                                            <option value="Lecture">Lecture</option>
                                            <option value="IT">IT</option>
                                            <option value="Software">Software</option>
                                            <option value="Maintenance">Maintenance</option>
                                            <option value="Management">Management</option>
                                            <option value="Finance">Finance</option>
                                            <option value="Health">Health</option>
                                            <option value="Accounting">Accounting</option> 
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">ORG_TYPE</span>
                                        <!--<input class="form-control" value="<%=rs_update.getString("ORG_TYPE")%>" name="orgtype">-->
                                        <select class="form-control" id="orgtype" name="orgtype" required="required">
                                            <option value="<%=rs_update.getString("ORG_TYPE")%>"><%=rs_update.getString("ORG_TYPE")%></option>
                                            <option value="Government Office">Government Office</option>
                                            <option value="Private Office">Private Office</option>
                                        </select>
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">ORG_NAME</span>
                                        <input class="form-control" value="<%=rs_update.getString("ORG_NAME")%>" name="orgname" >
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">TOTAL_EXPERTISE</span>
                                        <input class="form-control" value="<%=rs_update.getString("TOTAL_EXPERTISE")%>" name="totalexp" >
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">DATE_FROM</span>
                                        <input class="form-control" value="<%=rs_update.getString("DATE_FROM")%>" name="datefrom">
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">DATE_TO</span>
                                        <input class="form-control" value="<%=rs_update.getString("DATE_TO")%>" name="dateto">
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4 has-success">
                                        <!--<div class="input-group">-->
                                        <span class="" style="font-weight: bolder">Seq No</span>
                                        <input class="form-control" value="<%=rs_update.getString("SEQNO_ACADEMIC_EXPERTIES")%>" name="seqno" >
                                        <!--</div>-->
                                    </div> 
                                    <div class="col-lg-12 col-md-6 col-sm-6">
                                        <button type="submit" id="saveinstexp" class="btn btn-warning">
                                            <span class="fa fa-save"><strong> Update Staff Exp</strong></span></button>
                                    </div>
                                </form>
                                <%}
                                        }
                                    }
                                %>
                                <div class="table table-responsive">
                                    <table  class="table table-striped table-bordered table-hover "  id="tabledata1">
                                        <thead>
                                            <tr>
                                                <th>Staff ID</th>
                                                <th>Area of Expertise</th>
                                                <th>Organization Type</th>
                                                <th>Organization Name</th>
                                                <th>Total Experience</th>
                                                <th>From</th>
                                                <th>To</th>
                                                 <th>Qualification</th>
                                                <th><span class=" glyphicon glyphicon-edit" style="color: #ffcc00">Edit</span></th>
                                                <th ><span class="glyphicon glyphicon-remove" style="color: tomato">Delete</span></th>


                                            </tr>
                                        </thead>


                                        <tbody>
                                            <%
                                                //                                        connectionManager dbconnection = new connectionManager();
                                                //                                        Statement st_list_course = dbconnection.getconnection().createStatement();
                                                String crs_sql = "select * from TBL_ACADEMIC_EXPERTISE ";

                                                ResultSet _acdstaff = stmt.executeQuery(crs_sql);
                                                while (_acdstaff.next()) {
                                                    String id = _acdstaff.getString(1);
                                            %>
                                            <tr>
                                                <td><%=_acdstaff.getString(1)%></td> 
                                                <!--<td><%=id%></td>--> 
                                                <!--<td><%=_acdstaff.getString(2)%></td>--> 
                                                <td><%=_acdstaff.getString(3)%></td> 
                                                <td><%=_acdstaff.getString(4)%></td> 
                                                <td><%=_acdstaff.getString(5)%></td> 
                                                <td><%=_acdstaff.getString(6)%></td> 
                                                <td><%=_acdstaff.getString(7)%></td>
                                                <td><%=_acdstaff.getString(8)%></td>
                                                <td><%=_acdstaff.getString(9)%></td>
                                                <td>
                                                    <form action="" method="post">
                                                        <input type="hidden" name="action" value="edit"/>
                                                        <input type="hidden" name="id" id="edit_id" value="<%=_acdstaff.getString(10)%>"/>

                                                        <button class="btn btn-warning glyphicon glyphicon-edit" id="editid">Edit</button>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form action="" class="form-group" method="Post" >
                                                        <input type="hidden" name="action" value="delete"/>
                                                        <input type="hidden" name="id" id="delete_id" value="<%=_acdstaff.getString(10)%>"/>

                                                        <button class="btn btn-danger glyphicon glyphicon-trash" id="deleteid" onclick="return getData()">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--</div>-->
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
            <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
            <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
            <link href="../resources/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
            <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

            <script type="text/javascript">
                $().ready(function () {
                    //                    var j = jQuery.noConflict();
                    $('#tabledata').dataTable();
                });
                //

            </script> 
            <script type="text/javascript">
                $().ready(function () {
                    //                    var j = jQuery.noConflict();
                    $('#tabledata1').dataTable();
                });
                //

            </script> 
            <!--    <script>
                    $(function () {
                        $("#tabs").tabs();
                    });
                </script>-->

            <script type="text/javascript">
                $(function () {

                    $("#stud_reg").validate({
                        rules: {
                            insttitle: {
                                required: true
                            },
                            firstname: {
                                required: true
                            },
                            middlename: {
                                required: true

                            },
                            lastname:
                                    {
                                        required: true
                                    },
                            phoneno:
                                    {
                                        required: true
                                    },
                            email: {
                                required: true,
                               email: true
                            },
                            department: {
                                required: true
                            },

                            status:
                                    {
                                        required: true
                                    },
                            insttype: {
                                required: true
                            },
                            responsibility: {
                                required: true
                            },
                            description:
                                    {
                                        required: true
                                    },
                              file:
                                    {      
                                        required: true
//                                        accept: "*/pdf"
                                       },

                        },
                        messages: {
                            coursename: {
                                required: "Please enter some data",
                                minlength: "Your data must be at least 8 characters"
                            },
                            coursetype: "Please provide CourseType",
                            date_registered: "Please provide Date",
                            creditH: {
                                required: "Please enter some data",
                                digits: "Please provide Number"
                            },
                            prerequest: "Please Select Pre-Request",
                            term: "Please Select Term"

                        }
                    });
                });
            </script>
                  <script type="text/javascript">
                $(function () {

                    $("#staffexpform").validate({
                        rules: {
                            qualification: {
                                required: true
                            },
                           expctgry:{
                               required: true
                           },
                           officetype:{
                               
                           },
                           orgname:{
                                required: true
                           },
                           totalexp:{
                               required: true 
                           },
                           datefrom_exp_from:{
                                required: true
                           },
                           datefrom_exp_to:{
                                required: true
                           }
                       }
                   });
               });
                   
                     </script>
            <script type="text/javascript">
                $("#date_registered").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
                            //dateFormat: 'yyyy-mm-dd'
                            //format:'yyyy-mm-dd'

                });
                $("#hireddateupdate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
                            //dateFormat: 'yyyy-mm-dd'
                            //format:'yyyy-mm-dd'

                });

                $('input[type=date]').datepicker({
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true

                });
            </script>
            <!--        <script type="text/javascript">
                        $(document).ready(function ($) {
                            $('#accordion').find('.accordion-toggle').click(function () {
            
                                //Expand or collapse this panel
                                $(this).next().slideToggle('fast');
            
                                //Hide the other panels
                                $(".accordion-content").not($(this).next()).slideUp('fast');
            
                            });
                        });
                    </script>-->

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
            <!--script tab-->
            <script type="text/javascript">

                $(document).ready(function () {

                    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                        localStorage.setItem('activeTab', $(e.target).attr('href'));

                    });

                    var activeTab = localStorage.getItem('activeTab');

                    if (activeTab) {

                        $('#myTab a[href="' + activeTab + '"]').tab('show');

                    }

                });

            </script>

    </body>
</html>
