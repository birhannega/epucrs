<link href="../resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<ul class="nav navbar-nav">

    <li><a href="index.jsp"><span class="fa fa-plus-circle"></span> Home</a></li>
   <!-- Dropdown-->
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl1">
            <span class="glyphicon glyphicon-list"></span> Course Management  <span class="caret"></span>
        </a>

        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl1" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                     <li><a href="CourseListInstructor.jsp"><span class="glyphicon glyphicon-user"></span> Course List Registration</a></li>
                     <!--<li><a href="Instructor/InstructorNotification.jsp"><span class="glyphicon glyphicon-book"></span> Instructor Notification</a></li>-->
                 </ul>
            </div>
        </div>
    </li>
   <!--<li><a href="Clearance.jsp"><span class="glyphicon glyphicon-registration-mark"></span> Clearance</a></li>-->

     <!-- Dropdown-->
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl2">
            <span class="glyphicon glyphicon-education"></span> Staff Management  <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl2" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                    <li><a href="StaffRegistration.jsp"><span class="glyphicon glyphicon-book"></span> Staff Registration</a></li>
                    <!--<li><a href="StaffRegistration.jsp"><span class="glyphicon glyphicon-book"></span> View Staff Profile</a></li>-->
                </ul>
            </div>
        </div>
    </li>
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl3">
            <span class="glyphicon glyphicon-list-alt"></span> Mark Management  <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl3" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                   <!--<li><a href="ClassRegistration.jsp"><span class="glyphicon glyphicon-print"></span> Class Registration</a></li>-->
                    <li><a href="Marksubmission.jsp"><span class="glyphicon glyphicon-list-alt"></span> Mark Submission </a></li>
                     <li><a href="Re-grade.jsp"><span class="glyphicon glyphicon-retweet"></span> Re-Grade </a></li>
                </ul>
            </div>
        </div>
    </li>
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl4">
            <span class="glyphicon glyphicon-export"></span> Report Management  <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl4" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                     <li><a href="TermReport.jsp"><span class="glyphicon glyphicon-export"></span> Term Report </a></li>
                     <li><a href="TermReport.jsp"><span class="glyphicon glyphicon-export"></span> Assignment Report</a></li>
                </ul>
            </div>
        </div>
    </li>
     <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

</ul>


