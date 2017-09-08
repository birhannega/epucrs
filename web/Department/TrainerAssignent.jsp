<%-- 
    Document   : TrainerAssignent
    Created on : Sep 4, 2017, 8:44:03 PM
    Author     : seid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainer  Assignment</title>
        <%@include file="../common/imports.jsp" %>
    </head>
    <body>
        <div class="container-fluid" style="margin-top: -5px;">
            <%@include file="../common/department_nav.jsp" %>
        </div>
        <div class="container">
            <form action="" method="post">
                <div class="form-group col-lg-6">
                <select class="form-control"><option>-- Select Teacher--</option>
                <option>Efrem Mulu</option>
                <option>Mohammed </option>
                <option>Meseret</option></select>
                </div>
                <div class="form-group col-lg-6">
                    <select class="form-control">
                        <option>-- Select Department--</option>
                                  <option>Computer Science</option>
                                            <option>Health</option>
                                                      <option>Economics</option>
                                                                <option>Civic</option>
                                                                          <option>Management</option>
                    </select>
                    
                </div>
                <div class="form-group col-lg-6">
                    <select class="form-control">
                   <option>--select Section--</option>
                    <option>Group A</option>
                    <option>Group B</option>
                    <option>Group C</option>
                    <option>Group D</option>
                    <option>Group E</option></select>
                </div>
                <div class="form-group col-lg-6">
                    <input type="text" name="assign_date"class="form-control" id="assignment_start_date" placeholder="Enter Assigmnet date">
                </div>
                <div class="form-group col-lg-6">
                    <input type="text" name="assign_end_date" class="form-control" id="assignment_end_date" placeholder="Enter Assignment End Date">
                </div>
                <div class="form-group col-lg-6">
                    <input type="text" name="total" class="form-control" placeholder="Enter Total student">
                </div>
            </form>
        </div>
    </body>
</html>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script>
//$( "#bdate" ).datepicker({
//	inline: true,
//	showButtonPanel:true,
//	changeYear:true,
//	changeMonth:true,
//        dateFormat:'yy-dd-mm'
//}),
//        $( "#hdate" ).datepicker({
//	inline: true,
//	showButtonPanel:true,
//	changeYear:true,
//	changeMonth:true,
//        dateFormat:'yy-dd-mm'
//});


    $(function () {
        $("#assignment_start_date").datepicker({
            numberOfMonths: 2,
            onSelect: function (selected) {
                var dt = new Date(selected);
                dt.setDate(dt.getDate() + 90);
                $("#assignment_start_date").datepicker("option", "minDate", dt);
            }
        });
        $("#assignment_start_date").datepicker({
            numberOfMonths: 2,
            onSelect: function (selected) {
                var dt = new Date(selected);
                dt.setDate(dt.getDate() - 90);
               $("#assignment_start_date").datepicker("option", "maxDate", dt);
            }
        });
    });
    
</script>