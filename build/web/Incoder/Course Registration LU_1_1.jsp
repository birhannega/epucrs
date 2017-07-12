<%-- 
    Document   : Course Registration LU
    Created on : 06-Mar-2017, 12:30:50
    Author     : Efrem
--%>


      <%@include file="../common/imports.jsp" %>
      <link  rel="stylesheet" href="../bootstrap/DataTable/css/dataTables.bootstrap.min.css">
<link  rel="stylesheet" href="../bootstrap/DataTable/css/jquery.dataTables.min.css">
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
                    <p class="text-primary page-header text-center"><strong>Course Registration</strong></p>


                    <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                    <p class="text-right"> <a href="View Profile.jsp" ><span style="color: #0055b3">View Profile|</span></a><a href="View Profile.jsp"><span style="color: #0055b3">Logout</span></a></p>


                </div>

                <h2>To Add a New Course</h2>
                <div class="form-group col-lg-4">
                    <div class="input-group">
                        <span class="input-group-addon">Term</span>
                        <select class="form-control" id="gender" name="term" required="required">
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
                    <div class='input-group date' id='datetimepicker1'>
                        <span class="input-group-addon">Date</span>
                        <input type='date' class="form-control" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>

                <div class="form-group col-lg-4">
                    <div class="input-group">
                        <span class="input-group-addon">Subject</span>
                        <input type="text" name="subject"  class="form-control" id="firstname" placeholder="Enter Subject">
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
                <div class="form-group col-lg-12" > 
                    <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></div>

                    <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></div>
                    <div class="form-group col-lg-6">    </div>
                </div>

                </form>
                <!-- Button trigger modal -->
                <button class="btn btn-primary btn-lg" data-toggle="modal" 
                        data-target="#myModal">
                    Add Course
                </button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="col-lg-12">

                                    <p class="text-primary page-header text-center"><strong>Course Registration</strong></p>


                                    <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                                    <p class="text-right"> <a href="View Profile.jsp" ><span style="color: #0055b3">View Profile|</span></a><a href="View Profile.jsp"><span style="color: #0055b3">Logout</span></a></p>

                                    <form class="form-group " method="post" id="stud_reg" action="">

                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">Term</span>
                                                <select class="form-control" id="gender" name="term" required="required">
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
                                            <div class='input-group date' id='datetimepicker1'>
                                                <span class="input-group-addon">Date</span>
                                                <input type='date' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>


                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">Subject</span>
                                                <input type="text" name="subject"  class="form-control" id="firstname" placeholder="Enter Subject">
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

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" 
                                            data-dismiss="modal">Close
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        Submit changes
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->

                    </div>
                </div>
                <h1>datatable</h1>
                <table  class="table table-striped table-bordered table-hover"  id="tabledate">
                    <thead>
                        <tr>
                            <th>Term</th>
                            <th>Subject</th>
                            <th>Course Name</th>
                            <th>Credit Hour</th>
                            <th>Added Date</th>
                            <th>Has Pre Request</th>

                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Term</th>
                            <th>Subject</th>
                            <th>Course Name</th>
                            <th>Credit Hour</th>
                            <th>Added Date</th>
                            <th>Has Pre Request</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>Term1</td>
                            <td>ICT</td>
                            <td>System Architect</td>
                            <td>6</td>
                            <td>2011/04/25</td>
                            <td>YES</td>
                        </tr>
                        <tr>
                            <td>Term2</td>
                            <td>Law</td>
                            <td>Constitution</td>
                            <td>8</td>
                            <td>2011/07/25</td>
                            <td>YES</td>
                        </tr>
                        <tr>
                            <td>Term3</td>
                            <td>Midwifery</td>
                            <td>Safety</td>
                            <td>4</td>
                            <td>2009/01/12</td>
                            <td>YES</td>
                        </tr>
                        <tr>
                            <td>Term4</td>
                            <td>Management</td>
                            <td>Leadership</td>
                            <td>3</td>
                            <td>2012/03/29</td>
                            <td>NO</td>
                        </tr>

                    </tbody>
                </table>

                <div class="form-group col-lg-12" > 
                    <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></div>
                    <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></div>
                    <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Update</button></div>
                    <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Delete</button></div>
                </div>
            </div>
            <script type="text/javascript" src="../jquery/jquery-1.10.2.min.js"></script>
            <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>


            <script src="../bootstrap/DataTable/js/dataTables.bootstrap.min.js"></script>
            <script src="../bootstrap/DataTable/js/jquery.dataTables.min.js"></script>

            <script type="text/javascript">

                $('#tabledate').dataTable();

                $(function () {
                    $('#datetimepicker1').datetimepicker();

                });
            </script>