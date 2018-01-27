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
                    EPUC <span class="badge"> Registrar</span>
                </a>
            </div>      
        </div>
    </div>
    <!-- Main Menu -->
    <div class="side-menu-container">
        <ul class="nav navbar-nav">
            <li class="panel panel-info" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl01">
                    <span class="fa fa-users"></span> User account Management  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl01" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="Adduser.jsp"><span class="fa fa-plus-square"></span> Create user Account</a></li>
                            <li><a href="banuser.jsp"><span class="fa fa-ban "></span> Ban user Account</a></li>
                             <li><a href="Reactivate.jsp"><span class="fa fa-repeat "></span> Reactivate user Account</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="panel panel-info" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl31">
                    <span class="fa fa-wrench"></span> Rule and regulation Management  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl31" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="addschedule.jsp"><span class="fa fa-calendar"></span> Academic schedule</a></li>
                            <li><a href="UpdatePassfailscale.jsp"><span class="glyphicon glyphicon-print"></span>Upgrade pass fail Grade</a></li>
                            <li><a href="#"><span class=" glyphicon glyphicon-credit-card"></span>Change Admission criteria</a></li>
                            <li><a href="#"><span class=" fa fa-graduation-cap"></span>Change Graduation criteria</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <!-- Dropdown-->
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl1">
                    <span class="fa fa-user"></span> Instructor Management  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="Staffregistration.jsp"><span class="glyphicon glyphicon-print"></span>Instructor Registration</a></li>
                            <li><a href="instructorbadge.jsp"><span class="glyphicon glyphicon-print"></span> instructor ID Badge</a></li>
                            <li><a href="activeinstuctors.jsp"><span class=" glyphicon glyphicon-transfer"></span>Active instructors</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl21">
                    <span class="glyphicon glyphicon-user"></span> Student Management  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl21" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="Clearance.jsp"><span class="glyphicon glyphicon-cloud"></span> Clearance</a></li>
                            <li><a href="Re-grade.jsp"><span class="glyphicon glyphicon-retweet"></span> Re_Grade</a></li>
                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> ID Badge</a></li>
                            <li><a href="updateStudentprofile.jsp"><span class="glyphicon glyphicon-retweet"></span> Update student info </a></li>
                            <li><a href="tempo.jsp"><span class="glyphicon glyphicon-book"></span> Generate Tempo</a></li>

                        </ul>
                    </div>
                </div>
            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl2">
                    <span class="glyphicon glyphicon-book"></span> Course Management  <span class="caret"></span>
                </a>


                <div id="dropdown-lvl2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">

                            <li><a href="CourseRegistration.jsp"><span class="glyphicon glyphicon-print"></span> Course Registration</a></li>
                            <li><a href="courseBreakdown.jsp"><span class="glyphicon glyphicon-print"></span> Course offering</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            
          <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lv4">
                    <span class="glyphicon glyphicon-briefcase"></span> Lookup Management  <span class="caret"></span>
                </a>

                <div id="dropdown-lv4" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="LuTerm.jsp"><span class="glyphicon glyphicon-th-list"></span>Term registration</a></li>
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
                              <li><a href="TraineeRegistration.jsp"><span class="glyphicon glyphicon-saved"></span> Trainee registration</a></li>
                            <li><a href="TrainerRegistration.jsp"><span class="glyphicon glyphicon-random"></span> Trainer registration</a></li>
                            <li><a href="TrainingRegistration.jsp"><span class="glyphicon glyphicon-save-file"></span> Training registration</a></li>
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