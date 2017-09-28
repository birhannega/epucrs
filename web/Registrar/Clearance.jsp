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
                    <p class="text-primary page-header text-center"><strong>Clearance Form</strong></p>

                    <!--<div id="example-async" class="pull-right">-->
                    <div class="container col-lg-12">

                        <!-- <h5><strong>??????  ???  ??????  ???  ??? ??  ?????  ?????  ??????  ?????  ??</strong></h5>-->
                        <form  class="form-group col-lg-12" method="POST" action="${pageContext.request.contextPath}/ClearanceServlet">
                            ${ClearaceRegistered}
                            ${ClearaceNotRegistered}

                            <!--                            <div class="form-group col-lg-4">
                                                            <label id="am" style="font-family: serif">Search Criteria</label>
                                                            <div>
                                                                <label id="am" style="font-family: serif">Gender</label>
                                                                <input type="radio" id="studid" value="StudID" name="Criteria">By Stud ID 
                                                                <input type="radio" id="studName" value="StudName" name="Criteria">By Stud Name
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-lg-4">
                                                            <lebel id="am" style="font-family: serif">Search</lebel>
                                                            <div class="input-group col-lg-10">
                                                                <input class="form-control" placeholder="Enter Search Criteria" required="" type="search"/>
                                                                <span class="input-group-addon btn-info glyphicon glyphicon-search"></span>
                                                            </div>
                                                        </div> -->

                            <!--</form>-->
                            <div class="form-group col-lg-4">
                                <lebel id="am" style="font-family: serif">Full Name</lebel>
                                <div class="input-group col-lg-10">
                                    <input class="form-control" name="fullname" placeholder="Enter Full Name" type="text" required=""/>
                                    <!--<span class="input-group-addon" style="font-family: ebrima"> ????? </span>-->
                                </div>
                            </div>  
                            <div class="form-group col-lg-4">
                                <lebel id="am" style="font-family: serif">Directorate</lebel>
                                <div class="input-group col-lg-10">
                                    <select class="form-control" id="directorate" name="directorate" required="required">
                                        <option value="-1">-select instructor-</option>
                                        <%
                                            try {
                                                connectionManager dbconnection = new connectionManager();
                                                Statement st_lis_inst = dbconnection.getconnection().createStatement();
                                                String lis_inst_sql = "select dep_name from lu_dep";

                                                ResultSet rs_list_inst = st_lis_inst.executeQuery(lis_inst_sql);

                                        %>
                                        //                                                                        
                                        <%    while (rs_list_inst.next()) {
                                                String depname = rs_list_inst.getString("dep_name");
                                                //cid;
                                        %>
                                        <option><%=depname%></option>
                                        <% } %>
                                        <!--</select>-->
                                        <%
                                            } catch (Exception e) {
                                                out.println("wrong selection!" + e);
                                            }
                                        %>
                                    </select>
                                    <!--<input class="form-control" name="departement" placeholder="Enter Department" type="text" required=""/>-->

                                </div> 
                            </div> 
                            <div class="form-group col-lg-4">
                                <lebel id="am" style="font-family: serif">Start Date</lebel>
                                <div class="input-group col-lg-10">
                                    <!--<input class="form-control" placeholder="Ensert Start Date" name="" type="text" required=""/>-->
                                    <input class="form-control" id="dpstartdate" placeholder="This field is required." name="dpstartdate" required="" >
                                    <!--<span class="input-group-addon"   style="font-family: ebrima"> PickDate </span>-->
                                    <span class="input-group-addon glyphicon glyphicon-calendar"></span>
                                    <!--<input type="text" class="form-control"  aria-describedby="sizing-addon1">-->
                                </div>
                            </div> 
                            <div class="form-group col-lg-4">
                                <lebel id="am" style="font-family: serif">Department</lebel>
                                <div class="input-group col-lg-10">
                                    <select class="form-control" id="departmentlearn" name="departmentlearn" required="required">
                                         <option value="-1">-select department-</option>
                                        <option value="Crime Prevention">Crime Prevention</option>
                                        <option value="Crime Investigation">Crime Investigation</option>
                                        <option value="Police University Collage-1">Police University Collage</option>
                                        <option value="Indoctrination">Indoctrination</option>
                                        <option value="Civil Human Resources">Civil Human Resources</option>
                                        <option value="Hospital">Hospital</option>
                                        </select>
                                    <!--<input class="form-control" name="school" placeholder="This field is required." type="text" required=""/>-->

                                </div>
                            </div> 
                            <div class="form-group col-lg-4">
                                <lebel id="am" style="font-family: serif">Ended Date</lebel>
                                <div class="input-group col-lg-10">
                                    <input class="form-control" id="enddate" name="enddate" placeholder="This field is required." required="">
                                    <!--<span class="input-group-addon" style="font-family: ebrima">Date</span>-->
                                    <!--<span class=" input-group-addon fa fa-calendar-o"></span>-->
                                    <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                </div>
                            </div> 

                            <div class="form-group col-lg-4">
                                <div class="input-group col-lg-10">
                                    <lebel id="am" style="font-family: serif">Reason</lebel>
                                    <select name="reason" class="form-control" id="reason"  required="required">
                                        <option>-select criteria-</option>
                                        <option>Sickness</option>
                                        <option>Dropping</option>
                                        <option>Withdraw</option>
                                        <option>Graduation</option>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group col-lg-12" > 
                                <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save</strong></span></button>

                            </div>
                        </form>
                        <%
                            session.setAttribute("ClearaceRegistered", null);
                            session.setAttribute("ClearaceNotRegistered", null);
                        %>
                    </div>

                    <div class="form-group col-lg-11">
                        ${ClearaceAllRegistered}
                        ${ClearaceAllNotRegistered}
                        <form class="form-group"  method="POST" action="${pageContext.request.contextPath}/ClearanceApprovalServlet">
                        <lebel id="am" style="font-family: serif">Cleared Department</lebel>
                        <div class="table ">
                            <table class="table table-condensed table-bordered table-responsive">
                                <div class="form-group">
                                    <label ></label>
                                </div>
                                <!-- On cells (`td` or `th`) -->
                                <tr class="active" >
                                    <td class="active col-lg-1">R.No</td>
                                    <td class="success col-lg-2">Department</td>
                                    <td class="warning col-lg-2">Manager Name and Rank</td>
                                    <td class="danger col-lg-2">Date</td>
                                    <td class="info col-lg-2">Remark</td>
                                    <td class="info col-lg-2">Approval Step</td>
                                </tr>      

                                <tr class="active">
                                    <td class="active">1</td>
                                    <td class="success col-lg-2">Program Manager Confirmation</td>
                                    <td class="success">
                                        <input class="form-control" id="pmname" name="pmname" type="text">
                                    </td>
                                    <td class="success">
                                        <div class="input-group">
                                            <input class="form-control" id="dateprgmgr" name="dateprgmgr" placeholder="Enter End Date" required="" type="text"/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div>
                                    </td>
                                    <td class="success"><input class="form-control" id="pmremark" type="text"></td>    
                                    <td class="success col-lg-2"><button type="submit" class="btn btn-primary" id="">Approve</button>    
                                </tr>
                                <tr class="active">
                                    <td class="active">2</td>
                                    <td class="success">Store Department Division</td>
                                    <td class="success"><input class="form-control" id="sddname" name="sddname" type="text">
                                    </td>
                                    <td class="success"><div class="input-group">
                                            <input class="form-control" id="datesdd" name="datesdd" placeholder="Enter End Date"  type="text" required=""/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div></td>
                                    <td class="success"><input class="form-control" id="sddremark" name="sddremark" type="text"></td>

                                </tr>
                                <tr class="active">
                                    <td class="active">3</td>
                                    <td class="success">Finance Division Manager</td>
                                    <td class="success"><input class="form-control" id="fdmname" name="fdmname"type="text"></td>
                                    <td class="success"><div class="input-group">
                                            <input class="form-control" id="datefdm" name="datefdm" placeholder="Enter End Date" type="text" required=""/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div></td>
                                    <td class="success"><input class="form-control" id="fdmremark" name="fdmremark" type="text"></td>
                                </tr>
                                <tr class="active">
                                    <td class="active">4</td>
                                    <td class="success">Stationary Distribution Manager</td>
                                    <td class="success"><input class="form-control" id="sdmname" name="sdmname" type="text"></td>
                                    <td class="success"><div class="input-group">
                                            <input class="form-control" id="datesdm" name="datesdm" placeholder="Enter End Date"  required="" type="text"/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div></td>
                                    <td class="success"><input class="form-control" id="sdmremark" name="sdmremark" type="text"></td>
                                </tr>
                                <tr class="active">
                                    <td class="active">5</td>
                                    <td class="success">Library Manager</td>
                                    <td class="success"><input class="form-control" id="lmname" name="lmname" type="text"></td>
                                    <td class="success"><div class="input-group">
                                            <input class="form-control" id="datelm" name="datelm" placeholder="Enter End Date" required="" type="text"/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div></td>
                                    <td class="success"><input class="form-control" id="lmremark" name="lmremark" type="text"></td>
                                </tr>
                                <tr class="active">
                                    <td class="active">6</td>
                                    <td class="success">General Store Manager</td>
                                    <td class="success"><input class="form-control" id="gsmname" name="gsmname" type="text"></td>
                                    <td class="success"><div class="input-group">
                                            <input class="form-control" id="dategsm" name="dategsm" placeholder="Enter End Date" type="text"  required=""/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div></td>
                                    <td class="success"><input class="form-control" id="gsmremark" name="gsmremark" type="text"></td>
                                </tr>
                                <tr class="active"><br>
                                <td class="active">7</td>
                                <td class="success">Police Tactic and Sport Division</td>
                                <td class="success"><input class="form-control" id="ptname" name="ptname"></td>
                                <td class="success"><div class="input-group">
                                        <input class="form-control" id="datepolicetct" name="datepolicetct" placeholder="Enter End Date" type="text" required=""/>
                                        <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                    </div></td>                                          
                                <td class="success"><input class="form-control" id="ptremark" name="ptremark" type="text"></td>
                                </tr>
                                <tr class="active">
                                    <td class="active">8</td>
                                    <td class="success">Registrar Mastebaberya</td>
                                    <td class="success"><input class="form-control" id="rmname" name="rmname" type="text" ></td>
                                    <td class="success">
                                        <div class="input-group">
                                            <input class="form-control" id="daterm" name="daterm" placeholder="Enter End Date" type="text" required=""/>
                                            <span class=" input-group-addon glyphicon glyphicon-calendar"></span>
                                        </div></td>
                                    <td class="success"><input class="form-control" id="rmremark"  name="rmremark" type="text"></td>
                                    <!--<button type="submit" class="btn navbar-btn btn-info">Approve</button>-->

                                </tr>


                            </table>
                        </div>
                         <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></div>

                        </form>
                        <%
                            session.setAttribute("ClearaceAllRegistered", null);
                            session.setAttribute("ClearaceAllNotRegistered", null);
                        %>
                    </div> 
                   
                    <!--                    </div> -->
                </div><!--end of body-->
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
        <script src="../resources/jquery/jquery.validate.min.js" type="text/javascript"></script>
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>


        <script>
            $("#example-async").steps({
                headerTag: "h3",
                bodyTag: "section",
                transitionEffect: "slide"
            });
            // datepicker2.g
        </script>
        <script type="text/javascript">

            $('#tabledate').dataTable({
                changeMonth: true
            });

        </script>

        <script type="text/javascript">

            $("#dpstartdate").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#enddate").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });

            $("#dateprgmgr").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#datesdd").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#datefdm").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#datesdm").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#datelm").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#dategsm").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#datepolicetct").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
            $("#daterm").datepicker({
                dateFormat: 'yy-mm-dd',
                changeMonth: true,
                changeYear: true

            });
         
//            $('input[type=date]').datepicker({
//                dateFormat: 'dd/mm/yy',
//                changeMonth: true,
//                changeYear: true
//                                 });
            $("#stud_reg").validate({
                rules: {
                    fullname:
                            {
                                required: true,
                                minlength: 2,
                                digits: false,
                                maxlength: 30
                                        //            studmiddlename:"required",
                                        //            studentlastname:"required"

                            },
                    departement:
                            {
                                required: true,
                                minlength: 2,
                                digits: false,
                                maxlength: 30
                                        //            studmiddlename:"required",
                                        //            studentlastname:"required"

                            }

                }
            });


        </script>
        <!--        <script>
                    $('#submit').on('click', function () {
                        var valid = true,
                                message = '';
        
                        $('form input').each(function () {
                            var $this = $(this);
        
                            if (!$this.val()) {
                                var inputName = $this.attr('name');
                                valid = false;
                                message += 'Please enter your ' + inputName + '\n';
                            }
                        });
        
                        if (!valid) {
                            alert(message);
                        }
                    });
                </script>-->
    </body>
</html>
