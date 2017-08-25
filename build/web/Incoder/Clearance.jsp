<!DOCTYPE html>
<link rel="stylesheet" href="../css/jQuery.steps.css">
<%@include file="../common/imports.jsp" %>

<body>

    <!--      include navigation bar start-->
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <!--      include side bar end-->

            <!--      main content starts-->
            <div class="col-lg-10">
                <div class="col-lg-12" >

                    <div class="row">
                        <div class="col-lg-12">
                            <p class="text-primary page-header text-center"><strong>Clearance Form</strong></p>
                            <div class="pull-right">
                            </div>
                            <div id="example-async" class="pull-right">
                                <div class="container">

                                    <!-- <h5><strong>የኢትዮጵያ  ፖሊስ  ዩኒቨርሲቲ  ኮሌጅ  የልዩ ልዩ  ሰልጣኞች  የንብረት  ማስረከብያ  ማረጋገጫ  ቅፅ</strong></h5>-->
                                    <form action="" class=" col-lg-12">

                                        <div class="form-group col-lg-4">
                                            <label id="am" style="font-family: serif">Search Criteria</label>
                                            <div>
                                                <!--<label id="am" style="font-family: serif">Gender</label>-->
                                                <input type="radio" id="studid" value="StudID" name="Criteria">By Stud ID 
                                                <input type="radio" id="studName" value="StudName" name="Criteria">By Stud Name
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <lebel id="am" style="font-family: serif">Search</lebel>
                                            <div class="input-group col-lg-10">
                                                <input class="form-control" placeholder="Enter Search Criteria" required="" type="search"/>
                                                <span class="input-group-addon btn-info glyphicon glyphicon-search"></span>
                                            </div>
                                        </div> 

                                        <!--</form>-->
                                        <div class="form-group col-lg-4">
                                            <lebel id="am" style="font-family: serif">Full Name</lebel>
                                            <div class="input-group col-lg-10">
                                                <input class="form-control" name="fullname" placeholder="Enter Full Name" type="text" required=""/>
                                                <!--<span class="input-group-addon" style="font-family: ebrima"> በአማርኛ </span>-->
                                            </div>
                                        </div>  
                                        <div class="form-group col-lg-4">
                                            <lebel id="am" style="font-family: serif">Department</lebel>
                                            <div class="input-group col-lg-10">
                                                <input class="form-control" name="departement" placeholder="Enter Department" type="text" required=""/>
                                                <!--<span class="input-group-addon" style="font-family: ebrima"> በአማርኛ </span>-->
                                            </div> 
                                        </div> 
                                        <div class="form-group col-lg-3">
                                            <lebel id="am" style="font-family: serif">Start Date</lebel>
                                            <div class="input-group col-lg-10">
                                                <!--<input class="form-control" placeholder="Ensert Start Date" name="" type="text" required=""/>-->
                                                <input class="form-control" id="datepicker1" placeholder="This field is required." name="date" required="" type="date">
                                                <!--<span class="input-group-addon"   style="font-family: ebrima"> PickDate </span>-->
                                                <span class="input-group-addon glyphicon glyphicon-calendar"></span>
                                                <!--<input type="text" class="form-control"  aria-describedby="sizing-addon1">-->
                                            </div>
                                        </div> 
                                        <div class="form-group col-lg-4">
                                            <lebel id="am" style="font-family: serif">School</lebel>
                                            <div class="input-group col-lg-10">
                                                <input class="form-control" name="school" placeholder="This field is required." type="text" required=""/>
                                                <!--<span class="input-group-addon" style="font-family: ebrima"> በአማርኛ </span>-->
                                            </div>
                                        </div> 
                                        <div class="form-group col-lg-4">
                                            <lebel id="am" style="font-family: serif">Ended Date</lebel>
                                            <div class="input-group col-lg-10">
                                                <input class="form-control" id="datepicker2" name="enddate" placeholder="This field is required." type="date" required=""/>
                                                <!--<span class="input-group-addon" style="font-family: ebrima">Date</span>-->
                                                <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                            </div>
                                        </div> 
                                        <!--<div class="form-group col-lg-4">
                                            <lebel id="am" style="font-family: serif">Reason</lebel>
                                            <div class="input-group">
                                                <input class="form-control" name="" required=""/>
                                        <!--<span class="input-group-addon" style="font-family: ebrima"> በአማርኛ </span>-->
                                        <!-- </div>
                                        </div> -->

                                        <div class="form-group col-lg-3">
                                            <lebel id="am" style="font-family: serif">Reason</lebel>
                                            <div class="dropdown">
                                                <button class="btn btn-default dropdown-toggle col-xs-10" type="button" id="dropdownMenu1" 
                                                        data-toggle="dropdown" aria-haspopup="true" name="reason" aria-expanded="true">
                                                    -Select One-
                                                    <span class="col-lg-12"></span>
                                                    <!--<span class="caret"></span>-->
                                                </button>
                                                <ul class="dropdown-menu col-xs-9" aria-labelledby="dropdownMenu1" >
                                                    <li><a href="#">Sickness</a></li>
                                                    <li><a href="#">Dropping</a></li>
                                                    <li><a href="#">Withdraw</a></li>
                                                    <li><a href="#">Graduation</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <input type="button" id="submit" value="Submit" name="submit" /></div>
                                        <div class="form-group col-lg-12">
                                            <div class="col-lg-11"<lebel id="am" style="font-family: serif">Cleared Department</lebel></div>
                                            <div class="col-lg-2">
                                                <label >R.No</label>
                                            </div>
                                            <div class="col-lg-2">
                                                <label >Department</label>
                                            </div>
                                            <div class="col-lg-3">
                                                <label >Manager Name and Rank</label>
                                            </div>
                                            <div class="col-lg-2">
                                                <label >Date</label>
                                            </div>
                                            <div class="col-lg-3">
                                                <label >Remark</label>
                                            </div>

                                            <div class="col-lg-2">
                                                <label >1</label>
                                            </div>
                                            <div class="col-lg-2">
                                                <label >Degree Manager Confirmation</label>
                                            </div>
                                            <div class="col-lg-3">
                                                <input></input>
                                            </div>
                                            <div class="input-group col-lg-2">
                                                <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                <!--<span class="input-group-addon" style="font-family: ebrima">Date</span>-->
                                                <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                            </div>
                                            <div class="col-lg-2">
                                                <input></input>
                                            </div>
                                        </div> 

                                </div>

                                <div class="form-group col-lg-11">
                                    <lebel id="am" style="font-family: serif">Cleared Department</lebel>
                                    <div class="table ">
                                        <table class="table table-condensed table-bordered">
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
                                            </tr>      

                                            <tr class="active">
                                                <td class="active">1</td>
                                                <td class="success col-lg-2">Degree Manager Confirmation</td>
                                                <td class="success">
                                                    <input class="form-control" id=""></td>
                                                <td class="success">
                                                    <div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>

                                                    </div>
                                                </td>
                                                <td class="success"><input class="form-control" id=""></td>     
                                            </tr>
                                            <tr class="active">
                                                <td class="active">2</td>
                                                <td class="success">Store Department Division</td>
                                                <td class="success"><input class="form-control" id="" >
                                                </td>
                                                <td class="success"><div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                    </div></td>
                                                <td class="success"><input class="form-control" id=""></td>

                                            </tr>
                                            <tr class="active">
                                                <td class="active">3</td>
                                                <td class="success">Finance Division Manager</td>
                                                <td class="success"><input class="form-control" id="" ></td>
                                                <td class="success"><div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                    </div></td>
                                                <td class="success"><input class="form-control" id=""></td>
                                            </tr>
                                            <tr class="active">
                                                <td class="active">4</td>
                                                <td class="success">Stationary Mastebaberya</td>
                                                <td class="success"><input class="form-control" id="" ></td>
                                                <td class="success"><div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                    </div></td>
                                                <td class="success"><input class="form-control" id=""></td>
                                            </tr>
                                            <tr class="active">
                                                <td class="active">5</td>
                                                <td class="success">Library Manager</td>
                                                <td class="success"><input class="form-control" id="" ></td>
                                                <td class="success"><div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                    </div></td>
                                                <td class="success"><input class="form-control" id=""></td>
                                            </tr>
                                            <tr class="active">
                                                <td class="active">6</td>
                                                <td class="success">General Store Manager</td>
                                                <td class="success"><input class="form-control" id="" ></td>
                                                <td class="success"><div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                    </div></td>
                                                <td class="success"><input class="form-control" id=""></td>
                                            </tr>
                                            <tr class="active"><br>
                                            <td class="active">7</td>
                                            <td class="success">Police Tactic and Sport Division</td>
                                            <td class="success"><input class="form-control" id="" ></td>
                                            <td class="success"><div class="input-group">
                                                    <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                    <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                </div></td>                                          
                                            <td class="success"><input class="form-control" id=""></td>
                                            </tr>
                                            <tr class="active">
                                                <td class="active">8</td>
                                                <td class="success">Registrar Mastebaberya</td>
                                                <td class="success"><input class="form-control" id="" ></td>
                                                <td class="success">
                                                    <div class="input-group">
                                                        <input class="form-control" id="datepicker2" name="" placeholder="Enter End Date" type="date" required=""/>
                                                        <span class=" input-group-addon fa fa-calendar-minus-o"></span>
                                                    </div></td>
                                                <td class="success"><input class="form-control" id=""></td>
                                                <!--<button type="submit" class="btn navbar-btn btn-info">Approve</button>-->

                                            </tr>


                                        </table>
                                    </div>
                                </div> 
                                <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">New</button></div>
                                <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Save</button></div>
                                <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Update</button></div>
                                <div class="container col-lg-3"> <button type="submit" class="btn navbar-btn btn-info">Delete</button></div>
                                </form>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="row">








    </div>

<!--      main content ends-->
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
    $("#datepicker2").datepicker({
        changeMonth: true,
        changeYear: true

    });
    $('input[type=date]').datepicker({
        dateFormat: 'dd/mm/yy',
        changeMonth: true,
        changeYear: true
//            numberOfMonths: 1,
//            buttonImage: 'contact/calendar/calendar.gif',
//            buttonImageOnly: true

    });
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
<script>
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
</script>
<style>
    section
    {
        background: #ffffff;
    }
</style>
</html>
