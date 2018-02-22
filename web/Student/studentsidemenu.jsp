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
                    EPUC <span class="badge">student</span>
                </a>
            </div>
        </div>
    </div>
    <!-- Main Menu -->
    <div class="side-menu-container">
        <ul class="nav navbar-nav">
            <li class="active"><a href="Academic_schedule.jsp"><span class="fa fa-calendar"></span> View Academic schedule </a></li>
            <li class="active"><a href="Academic_Legislation.jsp"><span class="fa fa-info-circle"></span> View Academic legislation </a></li>
            <!-- Dropdown-->
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl1">
                    <span class="fa fa-user"></span> Profile Management  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">

                            <li><a href="probation.jsp"><span class="glyphicon glyphicon-send"></span> Apply probation</a></li>
                           
                            <li><a href="myfullprofile.jsp"><span class="glyphicon glyphicon-exclamation-sign"></span>view full profile</a></li>
                        </ul>
                    </div>
                 
                </div>
            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl2">
                    <span class="glyphicon glyphicon-folder-open"></span> Mark and Grade   <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl2" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="coursehistory.jsp"><span class="glyphicon glyphicon-list"></span>view Taken courses</a></li>
                            <li><a href="ViewMark.jsp"><span class="glyphicon glyphicon-eye-open"></span> View Marks</a></li>
                            <li><a href="complain.jsp"><span class="glyphicon glyphicon-send"></span>submit complain </a></li>
                            <li><a href="AddDrop.jsp"><span class="glyphicon glyphicon-transfer"></span>  Add/drop </a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="panel panel-primary" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl3">
                    <span class="fa fa-database"></span> Admissions and records  <span class="caret"></span>
                </a>
                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <li><a href="admission.jsp"><span class="glyphicon glyphicon-eye-open"> </span>   View Admissions</a></li>
                            <li><a href="gradebook.jsp"><span class="glyphicon glyphicon-dashboard"></span>  Grade book </a></li>
                        </ul>
                    </div>
                </div>
            </li>  
            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>