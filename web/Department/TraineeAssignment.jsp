<%-- 
    Document   : Instructor Registration
    Created on : 27-Feb-2017, 13:22:06
    Author     : Efrem
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/jQuery.steps.css"
      <%@include file="../common/imports.jsp" %>
      <body>
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
                    <p class="text-primary page-header text-center"><strong>Trainer Assignment </strong></p>
                    <div id="example-async" class="pull-right">

                        <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                 ${TrainerRegistered}
                 ${oop}
                 <%
								request.getSession().setAttribute("TrainerRegistered", null);
									request.getSession().setAttribute("oops", null);
							%>
                        <section >
                            <form class="form-group " method="post" id="Trainer_reg" action="${pageContext.request.contextPath}//TrainerController">
                             
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Title</span>
                                        <select class="form-control" id="title" name="title" required="required">
                                            <option value="">-select title-</option>
                                            <option value="Commissioner">Commissioner</option>
                                            <option value="assCommissioner">Ass/Commissioner</option><option value="">Deputy Commissioner</option>
                                            <option value="Commander">Commander</option><option value="">Ass/Commander</option><option value="">Deputy Commander</option>
                                            <option value="">Ass/Commander</option>
                                            <option value="">Inspector</option><option value=""><option value="">Deputy Inspector</option>
                                            <option value="">Sergeant</option><option value="">Ass/Sergeant</option><option value="">Deputy Sergeant</option>
                                            <option value="">Constable</option><option value="">Nominee Officer</option>
                                            <option value="">Commissioner General</option><option value="">Deputy Commissioner General</option>
                                            <option value="">Deputy Inspector</option><option value="">Engineer Doctor</option>
                                            <option value="">Sister</option><option value="">Health Officer</option><option value="">Nurse</option><option value="">Mid Wife</option>
                                            <option value="">Secretary</option><option value="">Director</option><option value="">Head Director</option>
                                            <option value="">Ra/Tech</option>
<!--                                              <option>-select- title</option>
                                            <option>ኮሚሽነር</option><option>ዕ/መኮንን</option><option>ም/ኮማንደር</option>
                                            <option>ኮማንደር</option><option>ረ/ኮሚሽነር</option><option>ም/ኮሚሽነር</option>
                                            <option>ኢንስፔክተር</option><option>ረ/ኢንስፔክተር</option><option>ሳጅን</option>
                                            <option>ኢንስፔክተር</option><option>ኮንስታብል</option><option>ረ/ሳጅን</option><option>ም/ሳጅን</option><option>ዋ/ሳጅን</option>
                                            <option>ራ/ቴክ</option><option>ም/ኢንስፔክተር</option><option>Mr ዋ/ኢንስፔክተርn><option> Mr.ኢንጂነርዶክተር</option><option>ም/ኮማንደር</option>
                                            <option>ወ/ሮ</option><option>ወ/ት</option><option>አቶ<option>ኮሚሽነር ጄኔራል</option><option>ም/ኮሚሽነር ጄኔራል</option>
                                            <option>ሲስተር</option><option>የጤና መኮንን</option><option>ጸሃፊ</option><option>ነርስ</option><option>ጤና መኮንን</option><option>ዋና ዳይሬክተር</option>
                                            <option>ሚድዋ<option>ዶክተር</option>
                                            <option>Mr</option><option>Ms</option><option>Phd</option><option>Doctor</option>-->

                                        </select>
                                    </div>
                                </div>

                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Trainee Full Name</span>
                                      <select class="form-control" id="title" name="title" required="required">
                                            <option value="">-select name-</option>
                                            <option value="Commissioner">Meseret</option>
                                            <option value="assCommissioner">Mohamed</option>
                                             <option value="Commissioner">Teshome</option>
                                            <option value="assCommissioner">brhan</option>
                                             <option value="Commissioner">seya</option>
                                            <option value="assCommissioner">efrem</option>
                                           </select>
                                    </div>
                                </div> 
                               
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Training Type</span>
                                         <select class="form-control" id="title" name="title" required="required">
                                            <option value="">-select training-</option>
                                            <option value="Commissioner">Short Term</option>
                                            <option value="assCommissioner">Long Term</option>
                                           </select>
                                    </div>
                                 </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Assignment Date</span>
                                       <input type="text" name="date3"  class="form-control" id="date3" placeholder="Enter Date">
                                    </div>
                                </div>
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Training Given From</span>
                                        <input type="text" name="date1"  class="form-control" id="date1" placeholder="Enter Date">
                                    </div>
                                </div> 
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Training Given To</span>
                                       <input type="text" name="date2"  class="form-control" id="date2" placeholder="Enter Date">
                                    </div>
                                </div> 
                                <div class="form-group col-lg-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Amount of Trainer</span>
                                        <input type="amount" name="middlename"  class="form-control" id="middlename" placeholder="Enter amount triner">
                                    </div>
                                </div> 
                                <div class="form-group col-lg-4">
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
        $("#Trainer_reg").validate({
            
        rules:{
            bdate: {
                required:true
            },
            tel: {
                required:true
            },
            hired_date: {
                required:true
            },
            firstname: {required:true
            },
            middlename: {
                required:true
                
            },
            lastname: {
                required:true
            },Experience: {
                required:true
            }
            
        },
        messages: {
            "firstname":{ 
                required: 'enter firstname'
            }
        }
        });
     
        
    });
</script>
</boody>
</html>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script>
$( "#date1" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
        dateFormat:'yy-dd-mm'
}),
        $( "#date2" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
        dateFormat:'yy-dd-mm'
}),
   $( "#date3" ).datepicker({
	inline: true,
	showButtonPanel:true,
	changeYear:true,
	changeMonth:true,
        dateFormat:'yy-dd-mm'
});

</script>
