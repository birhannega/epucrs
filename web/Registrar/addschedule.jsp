<!DOCTYPE html>
<html>
    <head>
        <title>Add-schedule</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <script src="../resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
          <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
          <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
          <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
      
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

                <%@include file="sidemenu.jsp" %>
            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
  
    ${event_edited}

                    <%@include file="addevent_form.jsp" %>

                </div>
            </div>
        </div>
                    
                    <%
                        session.setAttribute("event_edited", null);
                    %>
                    
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
    </body>
</html>
