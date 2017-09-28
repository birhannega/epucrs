<ul class="nav navbar-nav">

    <li><a href="index.jsp"><span class="fa fa-plus-circle"></span> Home</a></li>
   <!-- Dropdown-->
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl1">
            <span class="glyphicon glyphicon-book"></span> Course Management  <span class="caret"></span>
        </a>

        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl1" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                    <li><a href="CourseRegistration.jsp"><span class="glyphicon glyphicon-registration-mark"></span> Course Registration</a></li>
                    <li><a href="updateStudentprofile.jsp"><span class="glyphicon glyphicon-retweet"></span> View Course profile </a></li>
                    <li><a href="CourseAssigntoInstructor.jsp"><span class="glyphicon glyphicon-book"></span> Course Assignment</a></li>
                </ul>
            </div>
        </div>
    </li>
      <!-- Dropdown-->
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl2">
            <span class="glyphicon glyphicon-book"></span> Mark Management  <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl2" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                    <li><a href="SubmissionMark.jsp"><span class="glyphicon glyphicon-book"></span> Mark Submission</a></li>
                    <li><a href="Re-grade.jsp"><span class="glyphicon glyphicon-book"></span> Re-grade</a></li>
                </ul>
            </div>
        </div>
    </li>
  
    <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

</ul>


