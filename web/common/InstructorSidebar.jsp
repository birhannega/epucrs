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
                <a data-toggle="collapse" href="#dropdown-lvl2">
                    <span class="glyphicon glyphicon-book"></span> Course Management  <span class="caret"></span>
                </a>


                <div id="dropdown-lvl2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">

                            <li><a href="CourseRegistration.jsp"><span class="glyphicon glyphicon-print"></span> my courses</a></li>
                            <li><a href="CourseListInstructor.jsp"><span class="glyphicon glyphicon-list"></span> course preference</a></li>
                        </ul>
                    </div>
                </div>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv4">
                    <span class="glyphicon glyphicon-briefcase"></span> Lookup Management  <span class="caret"></span>
                </a>

                <div id="dropdown-lv4" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="LuTerm.jsp"><span class="glyphicon glyphicon-print"></span>Term registration</a></li>
                        </ul>
                    </div>
                </div>
            </li>   
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv3">
                    <span class="glyphicon glyphicon-star"></span> Training  Management  <span class="caret"></span>
                </a>
                <div id="dropdown-lv3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="TraineeRegistration.jsp"><span class="glyphicon glyphicon-print"></span> Trainee registration</a></li>
                            <li><a href="TrainerRegistration.jsp"><span class="glyphicon glyphicon-print"></span> Trainer registration</a></li>
                            <li><a href="TrainingRegistration.jsp"><span class="glyphicon glyphicon-print"></span> Training registration</a></li>
                        </ul>
                    </div>
                </div>
            </li>




            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv3">
                    <span class="glyphicon glyphicon-briefcase"></span> Student Result Management  <span class="caret"></span>
                </a>

                <div id="dropdown-lv3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="ApprovedByRegistrar.jsp"><span class="glyphicon glyphicon-print"></span> Approve by Registrar</a></li>
                            <li><a href="ApprovedByRegistrar.jsp"><span class="glyphicon glyphicon-print"></span> view mark changes</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl5">
                    <span class="glyphicon glyphicon-stats"></span> Report Management  <span class="caret"></span>
                </a>

                <div id="dropdown-lvl5" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="CourseReport.jsp"><span class="glyphicon glyphicon-retweet"></span> Course Report </a></li>
                            <li><a href="TermReport.jsp"><span class="glyphicon glyphicon-retweet"></span> Stud Mark Report </a></li>
                            <li><a href="PresidentsReport.jsp"><span class="glyphicon glyphicon-book"></span> President Report</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>
        </ul>
    </div>
</nav>