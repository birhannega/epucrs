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
                               <li class="active"><a href="Academic_schedule.jsp"><span class="fa fa-calendar"></span> View Academic schedule </a></li>
                           
                            <!-- Dropdown-->
                            <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl1">
                                    <span class="fa fa-user"></span> Profile Management  <span class="caret"></span>
                                </a>

                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">

                                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> Apply probation</a></li>
                                            <li><a href="updateStudentprofile.jsp"><span class="glyphicon glyphicon-retweet"></span> Update info </a></li>
                                            <li><a href="tempo.jsp"><span class="glyphicon glyphicon-book"></span>view Taken courses</a></li>
                                            <li><a href="tempo.jsp"><span class=" glyphicon glyphicon-transfer"></span>view profile</a></li>

                                        </ul>
                                    </div>
                                </div>
                                
                            </li>
                               <li class="panel panel-primary" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl2">
                                    <span class="glyphicon glyphicon-user"></span> Mark and Grade   <span class="caret"></span>
                                </a>

                                <!-- Dropdown level 1 -->
                                <div id="dropdown-lvl2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">

                                            <li><a href="studentbadge.jsp"><span class="glyphicon glyphicon-print"></span> View Marks</a></li>
                                            <li><a href="updateStudentprofile.jsp"><span class="glyphicon glyphicon-retweet"></span>submit complain </a></li>
                                            
                                         
                                        </ul>
                                    </div>
                                </div>
                                
                            </li>

 




                            <li><a href="../Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Signout</a></li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>