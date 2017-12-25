<!DOCTYPE html>
<html>
    <head>
        <title>students page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/registrar-side-menu.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">
                <%@include file="studentsidemenu.jsp" %>
            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
             <div class="col-lg-4 pull-right">
                         <img  class="img img-thumbnail" src="../images/kooper.JPG"alt="profile picture"/>
                   </div>
                   <div class="col-lg-8 ">
                       <table class="table table-hover">
                           <thead>
                               <tr>
                                   <td colspan="3" class="bg-info">Short summary of your profile
                                   </td></tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <th>Name</th>
                                   <td>Efrem Mulu </td>
                               </tr>
                                <tr>
                                   <th>Age</th>
                                   <td>26 </td>
                               </tr>
                                <tr>
                                   <th>Department</th>
                                   <td>it </td>
                               </tr>
                                <tr>
                                   <th>program:</th>
                                   <td> </td>
                               </tr>
                                <tr>
                                   <th>Round</th>
                                   <td></td>
                               </tr>
                               <tr>
                                   <th>Round</th>
                                   <td></td>
                               </tr>
                               <tr>
                                   <th>Round</th>
                                   <td></td>
                               </tr>
                               <tr>
                                   <th>Round</th>
                                   <td></td>
                               </tr>
                           </tbody>
                       </table>
                         
                       <table class="table table-condensed">
                           <thead>
                               <tr>
                                   
                               </tr>
                           </thead>
                       </table>
                    </div>

                </div>
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
    </body>
</html>
