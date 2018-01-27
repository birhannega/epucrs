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
                                    EPUC
                                </a>
                            </div>

                            
                            
                        </div>

                    </div>

                    <!-- Main Menu -->
                    <div class="side-menu-container">
                        <ul class="nav navbar-nav">

                         
                            <li class="active"><a href="addschedule.jsp"><span class="fa fa-calendar"></span> Academic year</a></li>
                           
                            <!-- Dropdown-->
                            <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl1">
                                    <span class="fa fa-book"></span> course Management  <span class="caret"></span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">

                                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-book"></span> course breakdown</a></li>
                                          
                                            <li><a href="tempo.jsp"><span class=" glyphicon glyphicon-dashboard"></span>courses by department</a></li>

                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            
                                <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl12">
                                    <span class="fa fa-user"></span> user Management  <span class="caret"></span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl12" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">

                                              <li><a href="Adduser.jsp"><span class="fa fa-plus-square"></span> Create user Account</a></li>
                                          
                                               <li><a href="banuser.jsp"><span class="glyphicon glyphicon-trash"></span> Deactivate Account</a></li>
                                                 
                                                
                                                     

                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            
                            
                                <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl2"">
                                    <span class="fa fa-user"></span> Instructor Management  <span class="caret"></span>
                                </a>

                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                   <li><a href="tempo.jsp"><span class="fa fa-edit"></span>  Register staff</a></li>
                                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> instructor ID Badge</a></li>
                                            <li><a href="updateStudentprofile.jsp"><span class="glyphicon glyphicon-retweet"></span> Update instructor info </a></li>
                                            <li><a href="tempo.jsp"><span class=" glyphicon glyphicon-transfer"></span>Active instructors</a></li>

                                        </ul>
                                    </div>
                                </div>
                  
                            </li>
                               <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl3">
                                    <span class="glyphicon glyphicon-grain"></span> Student Management  <span class="caret"></span>
                                </a>

                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">

                                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> ID Badge</a></li>
                                            <li><a href="updateStudentprofile.jsp"><span class="glyphicon glyphicon-retweet"></span> Update student info </a></li>
                                            <li><a href="tempo.jsp"><span class="glyphicon glyphicon-book"></span> Generate Tempo</a></li>
                                         
                                        </ul>
                                    </div>
                                </div>
                                
                            </li>

  <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lv3">
                                    <span class="glyphicon glyphicon-briefcase"></span> Student Mark Management  <span class="caret"></span>
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
                    </div><!-- /.navbar-collapse -->
                </nav>