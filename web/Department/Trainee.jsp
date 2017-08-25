<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/jQuery.steps.css"
      <%@include file="../common/imports.jsp" %>
      <body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
      
                <div class="col-lg-9">
                    <!-- <div class="row">
                         <div class="col-lg-12">-->
                    <p class="text-primary page-header text-center"><strong> Short Term trainee profile Registration  </strong></p>
                    <div id="example-async" class="pull-right">
                           ${TraineeRegistered}
                           ${oop}
                                              <section>

                           <% request.getSession().setAttribute("TraineeRegistered",null);
                           request.getSession().setAttribute("oop",null);%>
                            <form class="form-group " method="post" id="Trainee_reg" name="Trainee_reg" action="${pageContext.request.contextPath}//TraineeController">
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Birth Date</span>
                                        <input type="text" name="bdate"  id="bdate"class="form-control" placeholder="birthdate">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Department</span>
                                        <input type="text" name="dpt"  class="form-control" placeholder="Department">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="title" name="title" required="required">
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
                                        <span class="input-group-addon">First Name</span>
                                        <input type="text" name="firstname"  class="form-control" id="firstname" placeholder="Enter First name">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Middle Name</span>
                                        <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Full name">
                                    </div>
                                </div> <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Last Name</span>
                                        <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Full name">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">End Date</span>
                                        <input type="text" name="end_date"  class="form-control" id="end_date" placeholder="enterd End_date">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Start Date</span>
                                        <input type="text" name="start_date"  class="form-control" id="start_date" placeholder="Enter Start_Date">
                                    </div>
                                 </div>      <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">phone</span>
                                        <input type="text" name="tel"  class="form-control" id="firstname" placeholder="Enter Phone">
                                    </div>
                                 </div>      <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Term</span>
                                        <select class="form-control" name="term"><option>Short Term</option>
                                            <option>Long Term</option></select>
                                    </div>
                                 </div><div class="form-group col-lg-4">
                                    <div class="input-group">
                                     
                                        <input type="submit"  class="form-control btn btn-primary" value="submit">
                                    </div>
                                 </div>
                            </form>
                             


                    <!-- </div>
                 </div>-->
                </div>
            </div>
        </div>
    </div>
 <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function(){
       $("#Trainee_reg").validate({
           rules: {
               firstname: {
                   required:true
               },
               lastname: {
                   required:true
               },
               bdate: {
                   required:true
               },
               middlename: {
                   required:true
               }
           }
       });  
    });
   
       
     
    </script>

</body>
</html>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script>
$( "#bdate" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true
}),
        $( "#end_date" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true
}),
        $("#start_date").datepicker({
            inline: true,
    showButtonPanel:true,
    changeYear:true,
    changeMonth:true
        });


</script>
