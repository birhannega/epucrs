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
        <div class="row">
            <!-- Header image -->
            <%@include file="../common/head_banner.jsp" %>

            <!-- side Menu -->
            <div class="side-menu">
                <%@include file="sidemenu.jsp" %>
            </div>
            <!-- Main Content -->
            <div class="side-body">
                <div class="container-fluid">
                    <div id="chartContainer" style="height: 300px; width: 100%;">
                    </div>
                </div>
            </div>
            <!-- Main Content ends-->
        </div>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../resources/js/jquery.canvasjs.min.js.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
                });
            });
        </script>

        <script type="text/javascript">
            window.onload = function () {
                var chart = new CanvasJS.Chart("chartContainer",
                        {
                            theme: "light1", // "light1", "dark1", "dark2"
                            title: {
                                text: "Ethiopian Federal police commission/xy Directorate Reports"
                            },
                            data: [
                                {
                                    type: "column",
                                    dataPoints: [
                                        {x: 10, y: 71},
                                        {x: 20, y: 55},
                                        {x: 30, y: 50},
                                        {x: 40, y: 65},
                                        {x: 50, y: 95},
                                        {x: 60, y: 68},
                                        {x: 70, y: 28},
                                        {x: 80, y: 34},
                                        {x: 90, y: 14}
                                    ]
                                }
                            ]
                        });

                chart.render();
            };
        </script>
    </body>
</html>
