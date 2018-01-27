<!DOCTYPE html>
<html>
    <head>
        <title>Registrar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row" style="margin-top: -15px">
            <!-- side Menu -->
            <div class="side-menu">
                <%@include file="sidemenu.jsp" %>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <%@include file="somedata.jsp" %>
                </div>
            </div>
        </div>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
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
