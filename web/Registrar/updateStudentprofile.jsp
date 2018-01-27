<!DOCTYPE html>
<html>
    <head>
        <title>student badge</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--css-->
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
     

    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">
                <%@include file="sidemenu.jsp" %>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <%@include file="editStudentform.jsp" %>
                </div>
            </div>
        </div>
                   <!--java scripts-->
        <script src="../resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
                });
            });
        </script>
        
    </body>
</html>
