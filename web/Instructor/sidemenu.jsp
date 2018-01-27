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
                    EPUC <span class="badge"> Instructor</span>
                </a>
            </div>      
        </div>
    </div>
    <!-- Main Menu -->
    <div class="side-menu-container">
        <ul class="nav navbar-nav">

            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl">
                    <span class="glyphicon glyphicon-book"></span> Course Management  <span class="caret"></span>
                </a>


                <div id="dropdown-lvl" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">

                            <li><a href="CourseRegistration.jsp"><span class="fa fa-book"></span> my courses</a></li>
                            <li><a href="CourseListInstructor.jsp"><span class="fa fa-pencil"></span> course preference</a></li>
                        </ul>
                    </div>
                </div>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv2">
                    <span class="fa fa-female"></span> Student Mark Management  <span class="caret"></span>
                </a>

                <div id="dropdown-lv2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="LuTerm.jsp"><span class="glyphicon glyphicon-print"></span>Term registration</a></li>
                        </ul>
                    </div>
                </div>
            </li>   
           
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv6">
                    <span class="fa fa-pie-chart"></span> Report Management  <span class="caret"></span>
                </a>

                <div id="dropdown-lv6" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="CourseReport.jsp"><span class="glyphicon glyphicon-retweet"></span>My Course  </a></li>
                            <li><a href="TermReport.jsp"><span class="glyphicon glyphicon-retweet"></span> view Roaster </a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-book"></span> Student data </a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>
        </ul>
    </div>
</nav>