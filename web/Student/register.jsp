<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student registration form</title>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>

        <div class="container">
            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">

                                <li role="presentation" class="active">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Personal information">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-user"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                                        <span class="round-tab">
                                            <i class="fa fa-users"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-picture"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <form role="form">
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
                                    <h3>Personal info</h3>
                                    <form id="profile" class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//StudentController">
                                        <div class="form-group col-lg-3">
                                            <select name="department" id="department"  class="form-control" onchange="showState(this.value)" >
                                                <option value="">select department</option>

                                                <%
                                                    connectionManager con = new connectionManager();
                                                    Connection connection = con.getconnection();
                                                    Statement getdept = con.getconnection().createStatement();

                                                    String dep_name = null, depid = null;
                                                    ResultSet rs_dept = getdept.executeQuery("select * from TBL_DEPARTMENT");

                                                    while (rs_dept.next()) {
                                                        dep_name = rs_dept.getString("DEP_NAME");
                                                        depid = rs_dept.getString("DEP_ID");
                                                %>
                                                <option value="<%=depid%>"><%=dep_name%></option>
                                                <%
                                               }
                                                %>

                                            </select>                          
                                        </div>
                                        <div class="form-group col-lg-3">

                                            <select name="program" id="program" class="form-control">

                                                <option value="">select program</option> 

                                            </select>
                                        </div>

                                        <script  type="text/javascript">

                                            var xmlHttp;
                                            function showState(str) {
                                                if (typeof XMLHttpRequest !== "undefined") {
                                                    xmlHttp = new XMLHttpRequest();
                                                } else if (window.ActiveXObject) {
                                                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                                }
                                                if (xmlHttp === null) {
                                                    alert("Browser does not support XMLHTTP Request")
                                                    return;
                                                }
                                                var url = "program.jsp";
                                                url += "?department=" + str;
                                                xmlHttp.onreadystatechange = stateChange;
                                                xmlHttp.open("GET", url, true);
                                                xmlHttp.send(null);
                                            }

                                            function stateChange() {
                                                if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
                                                    document.getElementById("program").innerHTML = xmlHttp.responseText
                                                }
                                            }
                                        </script> 
                                        <div class="form-group col-lg-3">

                                            <div class="input-group">
                                                <span class="input-group-addon"> First Name</span>
                                                <input type="text" name="studentfirstname"  class="form-control" id="studfirstname" placeholder="Enter first name"></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> Middle Name</span>
                                                <input type="text" name="studmiddlename" class="form-control" id="studmiddlename" placeholder="Enter Middle name"></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> Last Name</span>
                                                <input type="tetx" class="form-control" name="studlastname" id="lastname" placeholder="Enter Last name"></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class="fa fa-birthday-cake"></span> Birth Date</span>
                                                <input type="date" class="form-control" name="studbdate" id="studbdate" placeholder="Enter birthdate"></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class="fa fa-flag-checkered " ></span> Nationality</span>
                                                <input type="text" name="studnationality" id="country" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <sapn class="input-group-addon">Gender</sapn>
                                                <select  name="studgender" id="studgender" class="form-control" >
                                                    <option value="">select Gender</option>
                                                    <option>Male</option>
                                                    <option>Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-12" >
                                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-address-card-o"></span> birth place</p></strong>

                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon">  Region</span>
                                                <input type="text" class="form-control" name="studbirthregion" id="BRegion" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> zone</span>
                                                <input type="text" class="form-control" name="studBirthzone" id="Bzone" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                <input type="text" class="form-control" name="StudBirthwereda" id="Bwereda" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Town(kebele)</span>
                                                <input type="text" class="form-control" name="studBirthkebele" id="Bkebele" ></div>
                                        </div>


                                        <div class="col-lg-12" >
                                            <strong><span class="text-uppercase text-muted text-info"><span class="fa fa-home " ></span> Home Address</span></strong>

                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon">  Region</span>
                                                <input type="text" class="form-control" name="StudHomeRegion" id="HRegion" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> zone</span>
                                                <input type="text" class="form-control" name="studHomezone" id="Hzone" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                <input type="text" class="form-control" name="studHomewereda" id="Hwereda" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Town(kebele)</span>
                                                <input type="text" class="form-control" name="studHomekebele" id="Hkebele" ></div>
                                        </div>



                                        <div class="col-lg-12" >
                                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-podcast " ></span> police commission </p></strong>

                                        </div>
                                        <div class="form-group col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">  sector</span>
                                                <input type="text" class="form-control" name="studpcSector" id="pcSector" ></div>
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Mobile</span>
                                                <input type="text" class="form-control" name="studpcMobile" id="pcMobile" ></div>
                                        </div>




                                        <div class="col-lg-12" >
                                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user" ></span> Person to be contacted in state of emergency </p></strong>

                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon">  Name</span>
                                                <input type="text" class="form-control" name="studcpname" id="cpname" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Tel.</span>
                                                <input type="text" class="form-control" name="studcptel" id="cptel" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Mobile</span>
                                                <input type="tel" class="form-control" name="studcpmobile" id="cpmobile" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> relationship</span>
                                                <input type="text" class="form-control" name="studcprelation" id="cprelation" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Address</span>
                                                <input type="text" class="form-control" name="studcpaddress" id="cpaddress" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> religion</span>
                                                <input type="text" class="form-control" name="studcpreligion" id="cpreligion" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <sapn class="input-group-addon">Student Type</sapn>
                                                <select  name="studtype" id="studtype" class="form-control" >
                                                    <option value="">select Type</option>
                                                    <option value="R">Regular</option>
                                                    <option value="EX">Extension</option>
                                                    <option value="CP">Crime Prevension</option>
                                                    <option value="CI">Crime Investigation</option>
                                                    <option value="AD">AD</option>
                                                    <option value="SCC">Special</option>
                                                    <option value="H">Health</option>
                                                </select>
                                            </div>

                                        </div>

                                        <div class="form-group col-lg-3">
                                            <button type="submit" id="page1" class="btn btn-primary"><span class="fa fa-save">
                                                    <strong>  Save personal info</strong></span></button>
                                        </div>
                                    <ul class="list-inline pull-right">
                                        <li><button type="button" class="btn btn-link next-step">continue</button></li>
                                    </ul>
                                    </form>
                                    
                                </div>
                            
                                <div class="tab-pane" role="tabpanel" id="step2">
                                    <h3>Step 2</h3>
                                    <p>This is step 2</p>
                                    <ul class="list-inline pull-right">
                                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                        <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                    </ul>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="step3">
                                    <h3>Step 3</h3>
                                    <p>This is step 3</p>
                                    <ul class="list-inline pull-right">
                                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                                        <li><button type="button" class="btn btn-default next-step">Skip</button></li>
                                        <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                                    </ul>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="complete">
                                    <h3>Complete</h3>
                                    <p>You have successfully completed all steps.</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                //Initialize tooltips
                $('.nav-tabs > li a[title]').tooltip();

                //Wizard
                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                    var $target = $(e.target);

                    if ($target.parent().hasClass('disabled')) {
                        return false;
                    }
                });

                $(".next-step").click(function (e) {

                    var $active = $('.wizard .nav-tabs li.active');
                    $active.next().removeClass('disabled');
                    nextTab($active);

                });
                $(".prev-step").click(function (e) {

                    var $active = $('.wizard .nav-tabs li.active');
                    prevTab($active);

                });
            });

            function nextTab(elem) {
                $(elem).next().find('a[data-toggle="tab"]').click();
            }
            function prevTab(elem) {
                $(elem).prev().find('a[data-toggle="tab"]').click();
            }
        </script>
        <style type="text/css">

            .wizard {
                margin: 10px auto;
                background: #fff;
            }

            .wizard .nav-tabs {
                position: relative;
                margin: 40px auto;
                margin-bottom: 0;
                border-bottom-color: #e0e0e0;
            }

            .wizard > div.wizard-inner {
                position: relative;
            }

            .connecting-line {
                height: 2px;
                background: #e0e0e0;
                position: absolute;
                width: 80%;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: 50%;
                z-index: 1;
            }

            .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
                color: #555555;
                cursor: default;
                border: 0;
                border-bottom-color: transparent;
            }

            span.round-tab {
                width: 70px;
                height: 70px;
                line-height: 70px;
                display: inline-block;
                border-radius: 100px;
                background: #fff;
                border: 2px solid #e0e0e0;
                z-index: 2;
                position: absolute;
                left: 0;
                text-align: center;
                font-size: 25px;
            }
            span.round-tab i{
                color:#555555;
            }
            .wizard li.active span.round-tab {
                background: #fff;
                border: 2px solid #5bc0de;

            }
            .wizard li.active span.round-tab i{
                color: #5bc0de;
            }

            span.round-tab:hover {
                color: #333;
                border: 2px solid #333;
            }

            .wizard .nav-tabs > li {
                width: 25%;
            }

            .wizard li:after {
                content: " ";
                position: absolute;
                left: 46%;
                opacity: 0;
                margin: 0 auto;
                bottom: 0px;
                border: 5px solid transparent;
                border-bottom-color: #5bc0de;
                transition: 0.1s ease-in-out;
            }

            .wizard li.active:after {
                content: " ";
                position: absolute;
                left: 46%;
                opacity: 1;
                margin: 0 auto;
                bottom: 0px;
                border: 10px solid transparent;
                border-bottom-color: #5bc0de;
            }

            .wizard .nav-tabs > li a {
                width: 70px;
                height: 70px;
                margin: 20px auto;
                border-radius: 100%;
                padding: 0;
            }

            .wizard .nav-tabs > li a:hover {
                background: transparent;
            }

            .wizard .tab-pane {
                position: relative;
                padding-top: 50px;
            }

            .wizard h3 {
                margin-top: 0;
            }

            @media( max-width : 585px ) {

                .wizard {
                    width: 90%;
                    height: auto !important;
                }

                span.round-tab {
                    font-size: 16px;
                    width: 50px;
                    height: 50px;
                    line-height: 50px;
                }

                .wizard .nav-tabs > li a {
                    width: 50px;
                    height: 50px;
                    line-height: 50px;
                }

                .wizard li.active:after {
                    content: " ";
                    position: absolute;
                    left: 35%;
                }
            }
        </style>
    <script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>
    <script>
        
        $(document).ready(function(){
    $("#profile").validate({
        rule:{
            department:{
                required:true
            },
            program:{
                 required:true
            }
        }
    });
});
    </script>

</body>
</body>
</html>