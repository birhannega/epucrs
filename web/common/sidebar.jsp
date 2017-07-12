
<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>      
        </div>
        <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
            <ul class="nav navbar-nav" >
                <li ><a href="index.jsp"><span class="" style="color: white">Home <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span> </span></a></li>
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Registration <span class="caret"></span>
                            <span style="font-size:16px;" class="fa fa-user pull-right  "></span></span></a>
                    <ul class="dropdown-menu " role="menu">
                        <li><a href="studentregistration.jsp"><span style="color:white">Student Registration</span></a></li>
                        <li><a href=""><span style="color:white">Staff Registration</span></a></li>
                        <ul><a href="Instructor Registration.jsp"><span style="color:white">Academic Staff Registration</span></a></ul>
                        <ul><a href="Staff Registration.jsp"><span style="color:white">Administrative Staff Registration</span></a></ul>
                        <li><a href=""><span style="color:white">Course registration</span></a></li>
                        <ul><a href="Course Registration LU.jsp"><span style="color:white">New Course Registration</span></a></ul>
                        <ul><a href="Course Assign to Instructor.jsp"><span style="color:white">Assign Course to Instructor</span></a></ul>

                    </ul>
                </li>   
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Transactional Forms<span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-sm showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="Re-grade.jsp"><span style="color:white">Re-grade</span></a></li>
                        <li><a href=""><span style="color:white">Re-exam</span></a></li>
                        <li><a href=""><span style="color:white">Withdraw</span></a></li>
                        <li><a href="Clearance.jsp"><span style="color:white">Clearance</span></a></li>
                        </ul>
                </li>  
                
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Probition<span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-sm showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="Probation.jsp"><span style="color:white">Register Probition</span></a></li>
                     
                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Transfer <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Transfer</span></a></li>
                       
                      
                    </ul>
                </li> 
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Student Center <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                           <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">View Result</span></a></li>
                   

                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Instructor Center<span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="SUbmissionMark.jsp"><span style="color:white">Submit Mark</span></a></li>
                        <li><a href="InstructorProfile.jsp"><span style="color:white">View Profile</span></a></li>
                        
                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Others <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>

                    </ul>
                </li>  
               
               </ul>
        </div>
    </div>
</nav>


<style>


    nav.sidebar, .main{
        -webkit-transition: margin 200ms ease-out;
        -moz-transition: margin 200ms ease-out;
        -o-transition: margin 200ms ease-out;
        transition: margin 200ms ease-out;
    }

    .main{
        padding: 10px 10px 0 10px;
    }

    @media (min-width: 765px) {

        .main{
            position: absolute;
            width: calc(100% - 40px); 
            margin-left: 40px;
            float: right;
        }

        nav.sidebar:hover + .main{
            margin-left: 200px;
        }

        nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
            margin-left: 0px;
        }

        nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
            text-align: center;
            width: 100%;
            margin-left: 0px;
        }

        nav.sidebar a{
            padding-right: 13px;
        }

        nav.sidebar .navbar-nav > li:first-child{
            border-top: 1px #e5e5e5 solid;
        }

        nav.sidebar .navbar-nav > li{
            border-bottom: 1px #e5e5e5 solid;
        }

        nav.sidebar .navbar-nav .open .dropdown-menu {
            position: static;
            float: none;
            width: auto;
            margin-top: 0;
            background-color: transparent;
            border: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
            padding: 0 0px 0 0px;
        }

        .navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
            color: #777;
        }

        nav.sidebar{
            width: 200px;
            height: 100%;
            margin-left: -160px;
            float: left;
            margin-bottom: 0px;
        }

        nav.sidebar li {
            width: 100%;
        }

        nav.sidebar:hover{
            margin-left: 0px;
        }

        .forAnimate{
            opacity: 0;
        }
    }

    @media (min-width: 1330px) {

        .main{
            width: calc(100% - 200px);
            margin-left: 200px;
        }

        nav.sidebar{
            margin-left: 0px;
            float: left;
        }

        nav.sidebar .forAnimate{
            opacity: 1;
        }
    }

    nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
        color: #CCC;
        background-color: transparent;
    }

    nav:hover .forAnimate{
        opacity: 1;
    }
    section{
        padding-left: 15px;
    }


</style>