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
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
            <div class="col-lg-10">
                <div class="col-lg-12">

                    <p class="text-primary page-header text-center">${courseRegistered}</p>

                </div>


                <!-- Button trigger modal -->
                <button class="btn btn-primary btn-sm pull-right" data-toggle="modal" data-target="#myModal">
                    Add Course
                </button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">


                                <p class="text-primary text-center"><strong>Course Registration</strong></p>
                                <button type="button" class="close pull-right" 
                                        data-dismiss="modal" aria-hidden="true" style="color: midnightblue">
                                    &times;
                                </button>
                            </div>
                            <form name="applicationForm" role="form" class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//CourseServlet">

                                <div class="modal-body">
    <!--                                <form class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//CourseServlet">-->

                                    <div class="form-group col-lg-4">
                                        <!--<div class="input-group">-->
                                        <!--<span class="input-group-addon">Term</span>-->
                                        <span class="pull-center">Term</span>
                                        <!--Term-->
                                        <select class="form-control" id="term" name="term" required="required">
                                            <option value="">-select term-</option>
                                            <option value="1">Term1</option>
                                            <option value="2">Term2</option>
                                            <option value="3">Term3</option>
                                            <option value="4">Term4</option>
                                        </select>
                                        <!--</div>-->
                                    </div>

                                    <!--<div data-dte-e="input-control" class="DTE_Field_InputControl" style="display: block;">Term<input id="DTE_Field_first_name" type="text"></div>-->
                                    <div class="form-group col-lg-4">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Course Name</span>
                                        <input type="text" name="coursename"  class="form-control" id="coursename" placeholder="Enter Course Name">
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Date</span>
                                        <input class="form-control" id="datepicker2" name="date_registered" placeholder="Enter Date" type="date" required=""/>
                                        <!--                                            <span class="input-group-addon">
                                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                                    </span>-->
                                        <!--</div>-->
                                    </div>


                                    <div class="form-group col-lg-4">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Course Type</span>
                                        <input type="text" name="coursetype"  class="form-control" id="ct" placeholder="Enter Course Type">
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Credit Hour</span>
                                        <input type="text" name="creditH"  class="form-control" id="ch" placeholder="Enter Credit Hour">
                                        <!--</div>-->
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <!--<div class="input-group">-->
                                        <span class="pull-center">Pre Request</span>
                                        <!--Term-->
                                        <select class="form-control" id="prerequest" name="prerequest" required="required">
                                            <option value="">-select term-</option>
                                            <option value="1">Yes</option>
                                            <option value="2">No</option>

                                        </select>
                                        <!--</div>-->
                                    </div>

                                </div>
                                <!--</form>-->
                                <div class="modal-footer">
                                    <input type="button" class="btn" id="buttonref" value="Refresh"/>
                                    <button type="button" class="btn btn-warning" 
                                            data-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary" id="btnregister">
                                        Register
                                    </button>
                                </div>
                            </form>

                        </div><!-- /.modal-content -->
                    </div>
                </div><!-- /.modal -->

                <span class="text-primary">  <strong>List of available courses</strong></span>

                <script type="text/javascript">
                    $('#edit_id').click(function ()
                    {
                        $("#editing_form").css('visibility', "visible");
                    });
                </script>
                <span class="alert alert-success">  ${del}</span> 

                <table  class="table table-striped table-bordered table-hover"  id="tabledate">
                    <thead>
                        <tr>
                            <th>Course Code</th>
                            <th>Term</th>
                            <th>Course Name</th>
                            <th>Added Date</th>
                            <th>Course Type</th>
                            <th>Credit Hours</th>
                            <th>Has Pre Request</th>
                            <th><span class=" glyphicon glyphicon-edit">Edit</span></th>
                            <th ><span class="glyphicon glyphicon-remove">Delete</span></th>


                        </tr>
                    </thead>
                    <%
                        session.setAttribute("del", null);
                    %>

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
                            <td><%=rs_course.getString(7)%></td> 
                            <td>


                                <form action="" method="post">

                                    <input type="hidden" name="edit_id" value="<%=id%>"/>

                                    <button class="btn btn-warning" id="edit_id">Edit</button>
                                </form>

                            </td>

                            <td>
                                <form action="deletecourse.jsp" method="Post" >
                                    <input type="hidden" name="delete_id" value="<%=id%>"/>
                                    <button class="btn btn-danger" id="deleteid">Delete</button>
                                </form>


                            </td>
                            <!--                    <script type="text/javascript">
                                                    $('#deleteid').on('click', function () {
                                                        table
                                                                .row($(this).parents('tr'))
                                                                .remove()
                                                                .draw();
                                                    });
                                                </script>-->
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
                <strong></strong>
                <form action="" id="editing_form" method="post" style="visibility: hidden">

                    <input type="text" name="edit_id" value="<%%>"/>

                    <button class="btn btn-warning" id="edit_id">Edit</button>
                </form>


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
    <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<!--<script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>-->
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
    $(function () {

        $("#stud_reg").validate({
            rules: {

                coursename: {
                    required: true,
                    minlength: 8
                },
                coursetype:
                        {
                            required: true
                        },
                date_registered:
                        {
                            required: true
                        },
                creditH: {
                    required: true,
                    digits: true
                },
                prerequest: {
                    required: true
                },
                term:
                        {
                            required: true
                        }
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
<!--    <script type="text/javascript">
        $("#stud_reg" ).validate({
            rules: {
                coursename:
                        {
                            required: true,
                            minlength: 2,
                            digits: false,
                            maxlength: 30
                                    //            studmiddlename:"required",
                                    //            studentlastname:"required"

                        },
                coursetype:
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

    </script>-->

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

<!--    <script type="text/javascript">
    $(document).ready(function() {
    $("#btnregister").click(function(e) {
            e.preventdefault();
        $(function() {
            var form = 
            $("form[name='applicationForm']").validate({
                // Specify validation rules
                rules : {
                    Coursename : "required",
                    coursetype : "required"
                },
                messages  : {
                    Coursename : "Please enter your coursename",
                    coursetype : "Please enter your coursetype"
                },
                submitHandler  : function(form) {
                    form.submit();
                }
            });
        });
    });
});
</script>-->
</body>
</html>
