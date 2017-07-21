<%-- 
    Document   : Course Registration LU
    Created on : 06-Mar-2017, 12:30:50
    Author     : Efrem
--%>

<%@page import="java.sql.*"%>

<%@page import="dbconnection.connectionManager"%>

<%@include file="../common/imports.jsp" %>

<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/header.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
            <div class="col-lg-10">
                <div class="col-lg-12">

                    <p class="text-primary page-header text-center">${courseRegistered}</p>






                </div>


                <!-- Button trigger modal -->
                <button class="btn btn-primary btn-sm pull-right" data-toggle="modal" 
                        data-target="#myModal">
                    Add Course
                </button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">


                                <p class="text-primary text-center"><strong>Course Registration</strong></p>
                            </div>
                            <form class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//CourseServlet">

                                <div class="modal-body">
    <!--                                <form class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//CourseServlet">-->

                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Term</span>
                                            <select class="form-control" id="term" name="term" required="required">
                                                <option>Term1</option>
                                                <option>Term2</option>
                                                <option>Term3</option>
                                                <option>Term4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Course Name</span>
                                            <input type="text" name="coursename"  class="form-control" id="firstname" placeholder="Enter Course Name">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Date</span>
                                            <input class="form-control" id="datepicker2" name="date_registered" placeholder="Enter Date" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>


                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Course Type</span>
                                            <input type="text" name="coursetype"  class="form-control" id="firstname" placeholder="Enter Course Type">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">Credit Hour</span>
                                            <input type="text" name="creditH"  class="form-control" id="firstname" placeholder="Enter Credit Hour">
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Pre Request</span>
                                        <select class="form-control" id="gender" name="prerequest" required="required">
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                    <button type="button" class="close" 
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>

                                    <!--</form>-->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" 
                                            data-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        Register
                                    </button>
                                </div>
                            </form>

                        </div><!-- /.modal-content -->
                    </div>
                </div><!-- /.modal -->

                <span class="text-primary">  <strong>List of available courses</strong></span>

                <table  class="table table-striped table-bordered table-hover"  id="tabledate">
                    <thead>
                        <tr>
                            <th>Term</th>
                            <th>Subject</th>
                            <th>Course Name</th>
                            <th>Credit Hour</th>
                            <th>Added Date</th>
                            <th>Has Pre Request</th>
                            <th >Edit</th>
                            <th >Delete</th>


                        </tr>
                    </thead>


                    <tbody>
                        <%
                            connectionManager dbconnection = new connectionManager();
                            Statement st_list_course = dbconnection.getconnection().createStatement();
                            String course_sql = "select * from TBL_COURSE_REGISTRATION";
                            ResultSet rs_course = st_list_course.executeQuery(course_sql);
                            while (rs_course.next()) {
                                String id = rs_course.getString(1);
                        %>
                        <tr>
<!--                            <td><%=rs_course.getString(1)%></td> -->
                            <td><%=id%></td> 
                            <td><%=rs_course.getString(2)%></td> 
                            <td><%=rs_course.getString(3)%></td> 
                            <td><%=rs_course.getString(4)%></td> 
                            <td><%=rs_course.getString(5)%></td> 
                            <td><%=rs_course.getString(6)%></td> 
                            <td>
                                <form action="" method="Get">
                                    <input type="hidden" name="edit_id" value="<%=id%>"/>

                                    <button class="btn btn-warning">Edit</button>
                                </form>


                            </td>
                            <td>
                                <form>
                                    <input type="hidden" name="delete_id" value="<%=id%>"/>
                                    <button class="btn btn-danger">Delete</button>
                                </form></td>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>



            </div>
        </div>
    </div>

    <%
        request.getSession().setAttribute("courseRegistered", null);
    %>

    <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
    <!--<script src="../jquery/jquery-1.10.2.min.js" type="text/javascript"/></script>-->
    <!--<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>-->
    <!--<script src="../bootstrap/DataTable/js/dataTables.bootstrap.min.js"></script>-->
    <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>

    <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
    <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        $().ready(function () {
    //                    var j = jQuery.noConflict();
            $('#tabledate').dataTable();
        });
        //
    </script>


    <script type="text/javascript">
        $("#stud_reg").validate({
            rules: {
                Coursename:
                        {
                            required: true,
                            minlength: 2,
                            digits: false,
                            maxlength: 30
                                    //            studmiddlename:"required",
                                    //            studentlastname:"required"

                        },
                sucoursetype:
                        {
                            required: true,
                            minlength: 2,
                            digits: false,
                            maxlength: 30
                                    //            studmiddlename:"required",
                                    //            studentlastname:"required"

                        },
                creditH: {
                    required: true,
                    digits: true
                },
                prerequest:
                        {
                            required: true

                        },
                date_registered:
                        {
                            required: true
                        },
                term:{
                    equired: true
                }
            }
        });

    </script>

    <script type="text/javascript">
        $("#date_registered").datepicker({
            changeMonth: true,
            changeYear: true
                    //dateFormat: 'yyyy-mm-dd'
                    //format:'yyyy-mm-dd'

        });

        $('input[type=date]').datepicker({
            dateFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true

        });

    </script>
    <!--<script>
                $('#stud_reg').submit(function(e) {
                    $('#messages').removeClass('hide').addClass('alert alert-success alert-dismissible').slideDown().show();
                    $('#messages_content').html('<h4>MESSAGE HERE</h4>');
                    $('#modal').modal('show');
                    e.preventDefault();
                });
            </script>	-->
</body>
</html>
