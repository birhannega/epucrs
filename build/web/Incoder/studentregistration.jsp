<link rel="stylesheet" href="../css/jQuery.steps.css"
      <!DOCTYPE html>
<style>
    section{
        overflow: scroll;
        background: #fff;
    }

</style>
<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/header.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
            <!--      include side bar end-->

            <!--      main content starts-->
            <div class="col-lg-10">
                <div class="col-lg-12" >

                    <div class="row">
                        <div class="col-lg-12">


                            <h4 class="page-header text-capitalize text-center text-primary"><i class="fa fa-laptop"></i> federal police university college Data encoders application interface </h4>


                            <div class="pull-right">


                            </div>

                        </div>
                    </div>
                    <div class="row">




                        <div id="example-async" class="pull-right">
                            <h3>Personal Info</h3>
                            ${studentRegistered}
                            <section >
                                <h4 class="text-info">personal information  <small>This form should be completed with photocopies of necessary documents included.</small> </h4>

                                <form class="form-group " method="post" id="stud_reg" action="${pageContext.request.contextPath}//StudentController">

                                    <div class="form-group col-lg-4">

                                        <div class="input-group">
                                            <span class="input-group-addon"> First Name</span>
                                            <input type="text" name="studentfirstname"  class="form-control" id="studfirstname" placeholder="Enter first name"></div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon"> Middle Name</span>
                                            <input type="text" name="studmiddlename" class="form-control" id="studmiddlename" placeholder="Enter Middle name"></div>
                                    </div>

                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon"> Last Name</span>
                                            <input type="tetx" class="form-control" name="studlastname" id="lastname" placeholder="Enter Last name"></div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon"> <span class="fa fa-birthday-cake"></span> Birth Date</span>
                                            <input type="date" class="form-control" name="studbdate" id="studbdate" placeholder="Enter birthdate"></div>
                                    </div>
                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <span class="input-group-addon"> <span class="fa fa-flag-checkered " ></span> Nationality</span>
                                            <input type="text" name="studnationality" id="country" class="form-control">

                                        </div></div>

                                    <div class="form-group col-lg-4">
                                        <div class="input-group">
                                            <sapn class="input-group-addon">Gender</sapn>
                                            <select required name="studgender" id="studgender" class="form-control" required="required">
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
                                        <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-home " ></span> Home Address</p></strong>

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







                                    <button type="submit" id="page1" class="btn btn-primary"><span class="fa fa-save"><strong>  Save personal info</strong></span></button>
                                </form>
                            </section>
                            <h3>Second Step</h3>
                            <section>
                                <p>Donec mi sapien, hendrerit nec egestas a, rutrum vitae dolor. Nullam venenatis diam ac ligula elementum pellentesque. 
                                    In lobortis sollicitudin felis non eleifend. Morbi tristique tellus est, sed tempor elit. Morbi varius, nulla quis condimentum 
                                    dictum, nisi elit condimentum magna, nec venenatis urna quam in nisi. Integer hendrerit sapien a diam adipiscing consectetur. 
                                    In euismod augue ullamcorper leo dignissim quis elementum arcu porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                    Vestibulum leo velit, blandit ac tempor nec, ultrices id diam. Donec metus lacus, rhoncus sagittis iaculis nec, malesuada a diam. 
                                    Donec non pulvinar urna. Aliquam id velit lacus.</p>
                            </section>
                            <h3>Third Step</h3>
                            <section>
                                <p>Morbi ornare tellus at elit ultrices id dignissim lorem elementum. Sed eget nisl at justo condimentum dapibus. Fusce eros justo, 
                                    pellentesque non euismod ac, rutrum sed quam. Ut non mi tortor. Vestibulum eleifend varius ullamcorper. Aliquam erat volutpat. 
                                    Donec diam massa, porta vel dictum sit amet, iaculis ac massa. Sed elementum dui commodo lectus sollicitudin in auctor mauris 
                                    venenatis.</p>
                            </section>
                            <h3>Fourth Step</h3>
                            <section>
                                <p>Quisque at sem turpis, id sagittis diam. Suspendisse malesuada eros posuere mauris vehicula vulputate. Aliquam sed sem tortor. 
                                    Quisque sed felis ut mauris feugiat iaculis nec ac lectus. Sed consequat vestibulum purus, imperdiet varius est pellentesque vitae. 
                                    Suspendisse consequat cursus eros, vitae tempus enim euismod non. Nullam ut commodo tortor.</p>
                            </section>

                        </div>
                    </div>
                </div>


            </div><!--/.col-->

        </div>



    </div>
</div>
</div>

</div>  <!--      main content ends-->

<%
    request.getSession().setAttribute("studentRegistered", null);
%>


</html>


<script>
    $("#example-async").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slide"
    });
</script>
<!--validation-->
<script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
<script src="../resources/jquery/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">
    $("#stud_reg").validate({
        rules: {
            studentfirstname:
                    {
                        required: true,
                        minlength: 5,
                        digits: !true,
                        maxlength: 30
          
                    },
            studmiddlename: {
                required: true,
                minlength: 2,
                digits: false,
                maxlength: 30
            },
            studlastname: {
                required: true,
                minlength: 2,
                digits: false,
                maxlength: 30
            },
            studnationality: {
                required: true
            },
            studgender: {
                required: true
            },
            studbdate: {
                required: true
            },
            studbirthregion: {
                required: true
            
           },
            studBirthkebele:{
                required:true
            },
            studBirthzone:{
                required:true
            },
            studcpaddress:{
               required:true
           },
             StudBirthwereda:{
               required:true
           },           
            studcpmobile:{
                required:true
           },
           studcpname:{
               required:true
           },
            studcprelation:{
              required:true
          },
           studcptel:{
            required:true
          },
          StudHomeRegion:{
              required:true
          },
          studHomekebele:{
              required:true
          },
          studHomewereda:{
              required:true
          },
          studHomezone:{
              required:true
          },
          studpcSector:{
              required:true
          },
          studpcMobile:{
              required:true
          },
         studcpreligion:{
              required:true
          } 
        }
    });
</script>
<link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>

<script type="text/javascript">
    $('input[type=date]').datepicker({
        changeMonth: true,
        changeYear: true
    });


    // country chooser
    var countries = [
        "Afghanistan",
        "Albania",
        "Algeria",
        "Andorra",
        "Angola",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Aruba",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin",
        "Bhutan",
        "Bolivia",
        "Bosnia and Herzegovina",
        "Botswana",
        "Brazil",
        "Brundi",
        "Bulgaria",
        "Burkina Faso",
        "Burma",
        "Burundi",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Cape Verde",
        "Central African Republic",
        "Chad",
        "Chile",
        "China",
        "Colombia",
        "Comoros",
        "  Congo",
        "Democratic Republic of the Congo",
        " Republic of the Costa Rica",
        " Cote d'Ivoire",
        "Croatia",
        "Cuba",
        "Curacao",
        "Cyprus",
        "Czechia",
        "Denmark",
        "Djibouti",
        "Dominica",
        "Dominican Republic",
        "East Timor (see Timor-Leste)",
        "Ecuador",
        "Egypt",
        " El Salvador",
        " Equatorial Guinea",
        "  Eritrea",
        "Estonia",
        " Ethiopia",
        "Fiji",
        "Finland",
        "France",
        "Gabon",
        "Gambia",
        "Georgia",
        "Germany",
        "Ghana",
        "Greece",
        "Grenada",
        "Guatemala",
        "Guinea",
        "Guinea-Bissau",
        "Guyana",
        "Haiti",
        "Holy See",
        "Honduras",
        "Hong Kong",
        "Hungary",
        "Iceland",
        "India",
        "Indonesia",
        "Iran",
        "Iraq",
        "Ireland",
        "Israel",
        "Italy",
        "Jamaica",
        "Japan",
        "Jordan",
        "Kazakhstan",
        "Kenya",
        "Kiribati",
        "Korea, North",
        "Korea, South",
        "Kosovo",
        "Kuwait",
        "Kyrgyzstan",
        "Laos",
        "Latvia",
        "Lebanon",
        "Lesotho",
        "Liberia",
        "Libya",
        "Liechtenstein",
        "Lithuania",
        "Luxembourg",
        "Macau",
        "Macedonia",
        "Madagascar",
        "Malawi",
        "Malaysia",
        "Maldives",
        "Mali",
        "Malta",
        "Marshall Islands",
        "Mauritania",
        "Mauritius",
        "Mexico",
        "Micronesia",
        "Moldova",
        "Monaco",
        "Montenegro",
        " Morocco",
        "Mozambique",
        "Namibia",
        "Nauru",
        "Nepal",
        "Netherlands",
        " New Zealand",
        "Nicaragua",
        "Niger",
        " Nigeria",
        "North Korea",
        "Norway",
        "Oman",
        "Pakistan",
        "Palau",
        "Palestinian Territories",
        "Panama",
        "Papua New Guinea",
        " Paraguay",
        "Peru",
        "Philippines",
        "Poland",
        "Portugal",
        "Qatar",
        "Romania",
        "Russia",
        " Rwanda",
        "Saint Kitts and Nevis",
        " Saint Lucia",
        "Saint Vincent and the Grenadines",
        " Samoa",
        "San Marino",
        "Sao Tome and Principe",
        "Saudi Arabia",
        "Senegal",
        "Serbia",
        "Seychelles",
        " Sierra Leone",
        "Singapore",
        " Sint Maarten",
        "Slovakia",
        "Slovenia",
        "Solomon Islands",
        "Somalia",
        "South Africa",
        "South Korea",
        "South Sudan",
        " Spain",
        " Sri Lanka",
        "Sudan",
        "Suriname",
        " Swaziland",
        "Sweden",
        "Switzerland",
        "Syria",
        "Taiwan",
        "Tajikistan",
        " Tanzania",
        " Thailand",
        "Timor-Leste",
        " Togo",
        " Tonga",
        "Trinidad and Tobago",
        "Tunisia",
        "Turkey",
        "Turkmenistan",
        " Tuvalu",
        "Uganda",
        "Ukraine",
        "United Arab Emirates",
        "United Kingdom",
        "Uruguay",
        "Uzbekistan",
        "Vanuatu",
        "Venezuela",
        "Vietnam",
        "Yemen",
        "Zambia",
        "Zimbabwe"

    ];
    $("#country").autocomplete({
        source: countries
    });




</script>
