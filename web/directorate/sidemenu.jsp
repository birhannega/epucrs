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
                    EPUC <span class="badge">Directorate</span>
                </a>
            </div>
        </div>
    </div>
    <!-- Main Menu -->
    <div class="side-menu-container">
        <ul class="nav navbar-nav">
            <li class="active"><a href="Academic_schedule.jsp"><span class="fa fa-calendar"></span> Academic year</a></li>
          
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl1">
                    <span class="fa fa-book"></span> College Management  <span class="caret"></span>
                </a>
                <div id="dropdown-lvl1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><span class="glyphicon glyphicon-book"></span> courses in college </a></li>
                            <li><a href="#"><span class=" glyphicon glyphicon-dashboard"></span>courses by departments</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl3">
                    <span class="glyphicon glyphicon-grain"></span> Student related reports  <span class="caret"></span>
                </a>
                <div id="dropdown-lvl3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">

                            <li><a href="#"><span class="glyphicon glyphicon-tower"></span> Top Rated students</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-arrow-down"></span>under performing students </a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-apple"></span> Above Average students </a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> view students by Gender </a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-duplicate"></span> view students by Department </a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-education"></span> view students by program </a></li>


                        </ul>
                    </div>
                </div>

            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv3">
                    <span class="glyphicon glyphicon-briefcase"></span> Student Management  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lv3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">

                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> Approve Mark submissions</a></li>
                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> Track Mark changes</a></li>
                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> submitted marks report</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

        </ul>
    </div>
</nav>