
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Teacher Work Flow <span class="caret"></span>
                            <span style="font-size:16px;" class="fa fa-user pull-right  "></span></span></a>
                    <ul class="dropdown-menu " role="menu">
                        <li ><a href="SUbmissionMark.jsp"><span style="color:white">Mark Submission</span></a></li>
                        <li><a href="Re-grade.jsp"><span style="color:white">Approve Re-Exam</span></a></li>
                        <li><a href=""><span style="color:white">Manage Students Attendance</span></a></li>




                    </ul>
                </li>   
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Departments <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-sm showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>


                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Registration <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>


                    </ul>
                </li> 
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Registration <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>

                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Registration <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>

                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Registration <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>

                    </ul>
                </li>  
                <li class="dropdown" style="background: #218ebd">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span style="color: white">Registration <span class="caret"></span>
                            <span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>
                        <li><a href=""><span style="color:white">Crear</span></a></li>

                    </ul>
                </li>  
                <li ><a href="#"><span style="color:white">Libros</span><span style="font-size:16px;color: white" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>        

            </ul>
        </div>
    </div>
</nav>


<style>


    nav.sidebar{
        -webkit-transition: margin 200ms ease-out;
        -moz-transition: margin 200ms ease-out;
        -o-transition: margin 200ms ease-out;
        transition: margin 200ms ease-out;

        width: auto !important;  /* Firefox will set width as auto */

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
            width: 50%;
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
            margin-left: 10px;
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