<%-- 
    Document   : Course Registration LU
    Created on : 06-Mar-2017, 12:30:50
    Author     : Efrem
--%>

<link rel="stylesheet" href="../css/jQuery.steps.css"
      <%@include file="../common/imports.jsp" %>
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
                    <p class="text-primary page-header text-center"><strong>Course Assign to Instructor</strong></p>


                    <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                    <p class="text-right"> <a href="View Profile.jsp" ><span style="color: #0055b3">View Profile|</span></a><a href="View Profile.jsp"><span style="color: #0055b3">Logout</span></a></p>

                    <form class="form-group " method="post" id="stud_reg" action="">

                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Select Instructor</span>
                                <select class="form-control" id="gender" name="select intr" required="required">
                                    <option>Tamru Fantu</option>
                                    <option>Abreham Kebede</option>
                                    <option>Gemechu Taye</option>
                                    <option>G/medhn Bahta</option>
                                </select>
                            </div>
                        </div>
                        
                          <div class="form-group col-lg-4">
                            <div class='input-group date' id='datetimepicker1'>
                                <span class="input-group-addon">Assigned Date</span>
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
                                <span class="input-group-addon">Course</span>
                                <input type="text" name="corse"  class="form-control" id="firstname" placeholder="Enter Course">
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Credit Hour</span>
                                <input type="text" name="creditH"  class="form-control" id="firstname" placeholder="Enter Credit Hour">
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class='input-group date' id='datetimepicker1'>
                                <span class="input-group-addon">Modified Date</span>
                                <input type='date' class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Modified By</span>
                                <input type="text" name="modifiedby"  class="form-control" id="firstname" placeholder="Enter Modifier">
                            </div>
                        </div>
                         <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Period</span>
                                <input type="text" name="modifiedby"  class="form-control" id="firstname" placeholder="Enter Modifier">
                            </div>
                        </div>
                         <div class="form-group col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Previous Instructor</span>
                                <input type="text" name="previousinstructor"  class="form-control" id="firstname" placeholder="Enter Previous Instructor">
                            </div>
                        </div>
                          <div class="form-group col-lg-12" > 
                            <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></div>
                            <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></div>
                            <div class="form-group col-lg-6">    </div>
                        </div>
                        <table id="tblcourseass" class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                   <th>Instructor Name</th>
                                    <th>Assigned Date</th>
                                   <th>Subject</th>
                                    <th>Course Name</th>
                                    <th>Credit Hour</th>
                                     <th>Modified Date</th>
                                     <th>Modified By</th>
                                     <th>Period</th>
                                     <th>Previous Instructor</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Instructor Name</th>
                                    <th>Assigned Date</th>
                                   <th>Subject</th>
                                    <th>Course Name</th>
                                    <th>Credit Hour</th>
                                     <th>Modified Date</th>
                                     <th>Modified By</th>
                                     <th>Period</th>
                                     <th>Previous Instructor</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td>Tamru Fantu</td>
                                    <td>2009/07/29</td>
                                    <td>ICT</td>
                                    <td>System Architect</td>
                                    <td>6</td>
                                    <td>2011/04/25</td>
                                    <td>Mr Tadese Asefa</td>
                                    <td>2 days a week</td>
                                    <td>Gemechu Alemu</td>
                                </tr>
                                <tr>
                                    <td>Abreham Kebede</td>
                                    <td>2009/07/29</td>
                                    <td>Law</td>
                                    <td>Constitution</td>
                                    <td>8</td>
                                    <td>2011/07/25</td>
                                    <td>Ms Asnakech </td>
                                    <td>4 days a week</td>
                                    <td>Gemechu Alemu</td>
                                </tr>
                                                                                       
                            </tbody>
                        </table>
                        <div class="form-group col-lg-12" > 
                            <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></div>
                            <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></div>
                            <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Update</button></div>
                            <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Delete</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
            <script src="../bootstrap/DataTable/js/dataTables.bootstrap.min.js"></script>
            <script src="../bootstrap/DataTable/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(function () {
        $('#datetimepicker1').datetimepicker();
        });
        $('#tblcourseass').dataTable();
    </script>
    