<ul class="nav navbar-nav">

    <li><a href="index.jsp"><span class="fa fa-plus-circle"></span> Home</a></li>
   <!-- Dropdown-->
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="DepartmentReport.jsp">
            <span class="glyphicon glyphicon-book"></span> All Report  <span class="caret"></span>
        </a>

    </li>
       <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl1">
            <span class="glyphicon glyphicon-book"></span> Department Report <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl1" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                    <li><a href="DepartmentReport.jsp"><span class="glyphicon glyphicon-book"></span> Department Report</a></li>
                    <!--<li><a href="StaffRegistration.jsp"><span class="glyphicon glyphicon-book"></span> View Staff Profile</a></li>-->
                </ul>
            </div>
        </div>
    </li>
   <!--<li><a href="Clearance.jsp"><span class="glyphicon glyphicon-registration-mark"></span> Clearance</a></li>-->

     <!-- Dropdown-->
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl2">
            <span class="glyphicon glyphicon-book"></span> President Report  <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl2" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                    <li><a href="PresidentsReport.jsp"><span class="glyphicon glyphicon-book"></span> President Report</a></li>
                    <!--<li><a href="StaffRegistration.jsp"><span class="glyphicon glyphicon-book"></span> View Staff Profile</a></li>-->
                </ul>
            </div>
        </div>
    </li>
    <li class="panel panel-primary" id="dropdown">
        <a data-toggle="collapse" href="#dropdown-lvl3">
            <span class="glyphicon glyphicon-book"></span> Registrar Report  <span class="caret"></span>
        </a>
        <!-- Dropdown level 1 -->
        <div id="dropdown-lvl3" class="panel-collapse collapse">
            <div class="panel-body">
                 <ul class="nav navbar-nav">
                   <!--<li><a href="ClassRegistration.jsp"><span class="glyphicon glyphicon-print"></span> Class Registration</a></li>-->
                    <li><a href="RegistrarReport.jsp"><span class="glyphicon glyphicon-retweet"></span> Registrar Report </a></li>
                     <!--<li><a href="ClassRegistration.jsp"><span class="glyphicon glyphicon-retweet"></span> Class Re-Assignment </a></li>-->
                </ul>
            </div>
        </div>
    </li>
    
   
    <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

</ul>


