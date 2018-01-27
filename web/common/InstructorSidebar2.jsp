<!DOCTYPE html>
<html>
    <head>
        <title>students page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/css/sidebarcss1111.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
    </head>
    
    <body>
<!--        <div class="container-fluid">-->
        <%@include file="../common/head_banner.jsp" %>
        <!--</div>-->
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu container" style="margin: 1">

                <nav class="navbar navbar-default" role="navigation">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <div class="brand-wrapper">
                            <!-- Hamburger -->
                            <button type="button" class="navbar-toggle">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                            <!-- Brand -->
                            <div class="brand-name-wrapper">
                                <a class="navbar-brand" href="index.jsp">
                                    EPUC/Student page
                                </a>
                            </div>

                            <!-- Search -->
                            <a data-toggle="collapse" href="#search" class="btn btn-default" id="search-trigger">
                                <span class="glyphicon glyphicon-search"></span>
                            </a>

                            <!-- Search body -->
                            <div id="search" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <form class="navbar-form" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-default "><span class="glyphicon glyphicon-ok"></span></button>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Main Menu -->
                    <div class="side-menu-container">
                        <ul class="nav navbar-nav">

                            <li><a href="result.jsp"><span class="glyphicon glyphicon-blackboard"></span> Check Result</a></li>
                            <li class="active"><a href="history.jsp"><span class="glyphicon glyphicon-book"></span> view History</a></li>
                              <li class="active"><a href="probation.jsp"><span class="glyphicon glyphicon-question-sign"></span>Request Probation</a></li>
                               <li class="active"><a href="complain.jsp"><span class="glyphicon glyphicon-pushpin"></span>submit complain</a></li>
                            <!-- Dropdown-->
                            <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl1">
                                    <span class="glyphicon glyphicon-user"></span> My Profile  <span class="caret"></span>
                                </a>

                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            
                                            <li><a href="profile.jsp"><span class="glyphicon glyphicon-eye-open"></span> View profile</a></li>
                                            <li><a href="changepassword.jsp"><span class="glyphicon glyphicon-retweet"></span> change Password</a></li>
                                       
                                        </ul>
                                    </div>
                                </div>
                            </li>

                            
                            
                            
                            
                            
                            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>

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
