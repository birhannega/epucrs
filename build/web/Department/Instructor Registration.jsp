<%-- 
    Document   : Instructor Registration
    Created on : 27-Feb-2017, 13:22:06
    Author     : Efrem
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/jQuery.steps.css">
<style>
    section{
        overflow: scroll;
        background: #fff;
    }

</style>

<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/header.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px;"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
            <div class="col-lg-10"  >
                <div class="col-lg-12" >
                    <!-- <div class="row">
                         <div class="col-lg-12">-->
                    <!--<p class="text-primary page-header text-center"><strong>Instructor Registration</strong></p>-->
                    <p class="text-primary text-center"><strong>Instructor Registration</strong></p>

                    <div id="example-async" class="pull-right">

                        <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                        <h3>Instructor Profile</h3>
                        <section >
                            <form class="form-group " method="post" id="inst_reg" action="" >
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Instructor ID</span>
                                        <input type="text" name="instid"  class="form-control" id="instid" placeholder="Auto Inst ID">
                                    </div>
                                </div>
                                <div class="form-group col-lg-2">
                                    <div class="input-group">
                                        <!--<span class="input-group-addon">Search</span>-->
                                        <button type="submit" class="btn btn-info" id="instsearch">Search</button>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <!--<form name="form1" method="post" enctype="multipart/form-data" action="insertimage.jsp">-->

                                    <p>
                                        <input type="file" name="ImageFile" id="ImageFile" />
                                    </p>
                                    <p>
                                        <input type="submit" name="submit" value="submit" />
                                    </p>
                                    <!--</form>-->
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="insttitle" name="insttitle" required="required">
                                            <option>-select- title</option>
                                            <option>ኮሚሽነር</option><option>ዕ/መኮንን</option><option>ም/ኮማንደር</option>
                                            <option>ኮማንደር</option><option>ረ/ኮሚሽነር</option><option>ም/ኮሚሽነር</option>
                                            <option>ኢንስፔክተር</option><option>ረ/ኢንስፔክተር</option><option>ሳጅን</option>
                                            <option>ኢንስፔክተር</option><option>ኮንስታብል</option><option>ረ/ሳጅን</option><option>ም/ሳጅን</option><option>ዋ/ሳጅን</option>
                                            <option>ራ/ቴክ</option><option>ም/ኢንስፔክተር</option><option>ዋ/ኢንስፔክተርn </option><option>ኢንጂነርዶክተር</option><option>ም/ኮማንደር</option>
                                            <option>ወ/ሮ</option><option>ወ/ት</option><option>አቶ<option>ኮሚሽነር ጄኔራል</option><option>ም/ኮሚሽነር ጄኔራል</option>
                                            <option>ሲስተር</option><option>የጤና መኮንን</option><option>ጸሃፊ</option><option>ነርስ</option><option>ጤና መኮንን</option><option>ዋና ዳይሬክተር</option>
                                            <option>ሚድዋ<option>ዶክተር</option>
                                            <option>Mr</option><option>Ms</option><option>Phd</option><option>Doctor</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Name</span>
                                        <input type="text" name="firsname"  class="form-control" id="firstname" placeholder="Enter First Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Middle Name</span>
                                        <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Middle Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Last Name</span>
                                        <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Last Name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phone NO</span>
                                        <input type="text" name="phoneno"  class="form-control" id="phoneno" placeholder="Enter Phone NO">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Email</span>
                                        <input type="text" name="email"  class="form-control" id="email" placeholder="Enter Email">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Department</span>
                                        <input type="text" name="department"  class="form-control" id="department" placeholder="Enter Department">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Salary</span>
                                        <input type="text" name="salary"  class="form-control" id="firstname" placeholder="Enter salary">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Status</span>
                                        <select class="form-control" id="status" name="status" required="requiered">
                                            <option>Active</option>
                                            <option>Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Type</span>
                                        <select class="form-control" id="type" name="type" required="requiered">
                                            <option>-selct type</option>
                                            <option>Civil</option>
                                            <option>Military</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Responsibility</span>
                                        <input type="text" name="responsibility"  class="form-control" id="responsibility" placeholder="Enter Responsibility">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Description</span>
                                        <input type="text" name="description"  class="form-control" id="description" placeholder="Enter Description">
                                    </div>
                                </div>
                                <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save instructor info</strong></span></button>
                               
<!--                                <div class="form-group col-lg-12" > 
                                    <button type="submit" class="btn btn-primary" id="instbtnreg">Register</button>
                                </div>-->
                            </form>
                            <div class="">
                                <table class="table table-hover table-bordered table-responsive table-striped" id="tblinstprofile">
                                       <thead>
                                        <tr>
                                            <th>STAFF NAME</th>
                                            <th>DEPARTMENT</th>
                                            <th>PHONE</th>
                                            <th >E-MAIL</th>
                                            <th>DESCRIPTION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="appearance: hyperlink"><a href="InstructorDetail.jsp" >Dr.Lizi</a></td>
                                            <td>Bangalore</td>
                                            <td>560001</td>
                                            <td>560001</td>
                                            <td >560001</td>

                                        </tr>
                                        <tr>
                                            <td><a href="InstructorDetail.jsp" >Dr.kooper</a></td>
                                            <td>Mumbai</td>
                                            <td>400003</td>
                                            <td>400003</td>
                                            <td>400003</td>
                                        </tr>
                                        <tr>
                                            <td><a href="InstructorDetail.jsp" >Mr.kean</a></td>
                                            <td>Pune</td>
                                            <td>411027</td>
                                            <td>400003</td>
                                            <td>400003</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <!--</form>-->

                        </section>
                        <h3>Qualification</h3>

                        <section >
                            <form class="input-group" id="instedu_form" method="post" action="">
                                <div class="form-group"><label>Qualification</label></div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Degree</span>
                                        <input type="text" name="instfirstdegree"  class="form-control" id="firstdegree" placeholder="Enter First Degree">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Second Degree</span>
                                        <input type="text" name="instseconddegree"  class="form-control" id="seconddegree" placeholder="Enter Second Degree">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phd</span>
                                        <input type="text" name="instphd"  class="form-control" id="phddegree" placeholder="Enter Phd">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Certificates</span>
                                        <input type="text" name="instcertificates"  class="form-control" id="certificates" placeholder="List Certificates">
                                    </div>
                                </div>
                                <div class="form-group col-lg-12"> <label> Area of experties </label></div>
                                <div class="form-group col-lg-4 "> <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Lecture</div>
                                <div class="form-group col-lg-4 ">     <input  class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Government Office</div>
                                <div class="form-group col-lg-4 ">    <input  class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Private Office</div>
                                <div class="form-group col-lg-4 ">    <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Software</div>
                                <div class="form-group col-lg-4 ">   <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Network</div>
                                <div class="form-group col-lg-4 ">   <input class="checkbox" type="checkbox" id="studid" value="StudID" name="experiace">Maintenance
                                </div>


                                <div class="form-group col-lg-12" >                    
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></p>
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></p>
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Update</button></p>
                                    <p class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Delete</button></p>
                                </div>
                                <div class="">
                                    <table class="table table-hover table-bordered table-responsive">
                                        <caption>Academic Profile</caption>
                                        <thead>
                                            <tr>
                                                <th>STAFF NAME</th>
                                                <th>ROOM</th>
                                                <th>PHONE</th>
                                                <th >E-MAIL</th>
                                                <th>REMARK</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="appearance: hyperlink"><a href="InstructorDetail.jsp" >Dr.Lizi</a></td>
                                                <td>Bangalore</td>
                                                <td>560001</td>
                                                <td>560001</td>
                                                <td >560001</td>

                                            </tr>
                                            <tr>
                                                <td><a href="InstructorDetail.jsp" >Dr.kooper</a></td>
                                                <td>Mumbai</td>
                                                <td>400003</td>
                                                <td>400003</td>
                                                <td>400003</td>
                                            </tr>
                                            <tr>
                                                <td><a href="InstructorDetail.jsp" >Mr.kean</a></td>
                                                <td>Pune</td>
                                                <td>411027</td>
                                                <td>400003</td>
                                                <td>400003</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </section>
                    </div>


                    <!-- </div>
                 </div>-->
                </div>
            </div>
        </div>
    </div>
 <!--<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>-->
 <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>

    <script src="../bootstrap/DataTable/js/jquery.dataTables.js"></script>
<!--    <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>-->
     
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblinstprofile').DataTable();
        });
    </script>
    <script>
        $("#example-async").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slide"
        });
    </script>
   
    <script type="text/javascript">
        $("#inst_reg").validate({
            rules: {
                instid: {

                    required: true,
                    minlength: 5,
                    digits: !true,
                    maxlength: 30
                },
                insttitle: {
                    required: true
                },
                firsname: {
                    required: true
                },
                middlename:
                        {
                            required: true
                        },
                lastname: {
                    required: true
                },
                phoneno: {
                    required: true,
                    digits: true
                },
                email: {
                    required: true
                },
                department: {
                    required: true
                },
                salary: {
                    required: true,
                    digits: true
                },
                status:
                        {
                            required: true
                        },
                type: {
                    required: true
                },
                responsibility:
                        {
                            required: true
                        },
                description:
                        {
                            required: true
                        }
            }
        });
    </script>
    <script type="text/javascript">
        $("#instedu_form").validate({
            rules: {
                instfirstdegree: {
                    required: true
                },
                instseconddegree: {
                    required: true
                },
                instphd: {
                    required: true
                },
                instcertificates: {
                    required: true
                }
            }



        });
    </script>
</body>
</html>



