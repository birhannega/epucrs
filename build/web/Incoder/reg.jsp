<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="../css/jQuery.steps.css"
    </head>


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
                <%@include file="../common/sidbar2.jsp" %>
            </div>
            <!--      include side bar end-->

            <!--      main content starts-->
            <div class="col-lg-10">
                <div class="col-lg-12" >
                    <%@include file="sample.jsp" %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
           
            