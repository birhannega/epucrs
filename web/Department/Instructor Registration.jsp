<%-- 
    Document   : Instructor Registration
    Created on : 27-Feb-2017, 13:22:06
    Author     : Efrem
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/jQuery.steps.css"
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
                    <!-- <div class="row">
                         <div class="col-lg-12">-->
                    <p class="text-primary page-header text-center"><strong>Instructor Registration</strong></p>
                    <div id="example-async" class="pull-right">

                        <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                           <h3>Instructor Profile</h3>
                        <section >
                            <form class="form-group " method="post" id="stud_reg" action="">
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Instructor ID</span>
                                        <input type="text" name="instructorID"  class="form-control" id="firstname" placeholder="Auto Inst ID">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="gender" name="gender" required="required">
                                            <option>-select- title</option>
                                            <option>ኮሚሽነር</option><option>ዕ/መኮንን</option><option>ም/ኮማንደር</option>
                                            <option>ኮማንደር</option><option>ረ/ኮሚሽነር</option><option>ም/ኮሚሽነር</option>
                                            <option>ኢንስፔክተር</option><option>ረ/ኢንስፔክተር</option><option>ሳጅን</option>
                                            <option>ኢንስፔክተር</option><option>ኮንስታብል</option><option>ረ/ሳጅን</option><option>ም/ሳጅን</option><option>ዋ/ሳጅን</option>
                                            <option>ራ/ቴክ</option><option>ም/ኢንስፔክተር</option><option>Mr ዋ/ኢንስፔክተርn><option> Mr.ኢንጂነርዶክተር</option><option>ም/ኮማንደር</option>
                                            <option>ወ/ሮ</option><option>ወ/ት</option><option>አቶ<option>ኮሚሽነር ጄኔራል</option><option>ም/ኮሚሽነር ጄኔራል</option>
                                            <option>ሲስተር</option><option>የጤና መኮንን</option><option>ጸሃፊ</option><option>ነርስ</option><option>ጤና መኮንን</option><option>ዋና ዳይሬክተር</option>
                                            <option>ሚድዋ<option>ዶክተር</option>
                                            <option>Mr</option><option>Ms</option><option>Phd</option><option>Doctor</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Full Name</span>
                                        <input type="text" name="fulltname"  class="form-control" id="firstname" placeholder="Enter Full name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phone NO</span>
                                        <input type="text" name="phoneno"  class="form-control" id="firstname" placeholder="Enter Phone NO">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Email</span>
                                        <input type="text" name="Email"  class="form-control" id="firstname" placeholder="Enter Email">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Department</span>
                                        <input type="text" name="department"  class="form-control" id="firstname" placeholder="Enter Department">
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
                                        <span class="input-group-addon">Membership</span>
                                        <select class="form-control" id="status" name="membership" required="requiered">
                                            <option>Internal</option>
                                            <option>External</option>
                                        </select>

                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Description</span>
                                        <input type="text" name="description"  class="form-control" id="firstname" placeholder="Enter Description">
                                    </div>
                                </div>
                                <div class="form-group col-lg-12" > 
                                     <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </form>
                        </section>
                        <h3>Qualification</h3>

                        <section >
                            <form class="input-group">
                                <div class="form-group"><label>Qualification</label></div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">First Degree</span>
                                        <input type="text" name="firstdegree"  class="form-control" id="firstname" placeholder="Enter First Degree">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Second Degree</span>
                                        <input type="text" name="seconddegree"  class="form-control" id="firstname" placeholder="Enter Second Degree">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Phd</span>
                                        <input type="text" name="phddegree"  class="form-control" id="firstname" placeholder="Enter Phd">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Certificates</span>
                                        <input type="text" name="Certificates"  class="form-control" id="firstname" placeholder="List Certificates">
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
                        </section>
                    </div>



                    <!-- </div>
                 </div>-->
                </div>
            </div>
        </div>
    </div>

</body>
</html>

<script>
    $("#example-async").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slide"
    });
</script>