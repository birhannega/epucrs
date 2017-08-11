<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../css/jQuery.steps.css"

      <%@include file="../common/imports.jsp" %>
      <body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
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
                            <p class="text-primary text-center"><strong>Student registration</strong></p>

                            <div id="example-async" class="pull-right">
                                <!--                                <div id="progressbar"></div>-->
                                <h3>Personal Info</h3>
                                <section  style=" overflow: scroll">
                                    <h4 class="text-info">personal information  <small>This form should be completed with photocopies of necessary documents included.</small> </h4>

                                    <form class="form-group " method="post" id="stud_reg" action="">

                                        <div class="form-group col-lg-4">

                                            <div class="input-group">
                                                <span class="input-group-addon"> First Name</span>
                                                <input type="text" name="firstname"  class="form-control" id="firstname" placeholder="Enter first name"></div>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"> Middle Name</span>
                                                <input type="text" name="middlename" class="form-control" id="middlename" placeholder="Enter Middle name"></div>
                                        </div>

                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"> Last Name</span>
                                                <input type="tetx" class="form-control" name="lastname" id="lastname" placeholder="Enter Last name"></div>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class="fa fa-birthday-cake"></span> Birth Date</span>
                                                <input type="text" class="form-control" name="bdate" id="bdate" placeholder="Enter birthdate"></div>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class="fa fa-flag-checkered " ></span> Nationality</span>
                                                <input type="text" name="nationality" id="country" class="form-control">

                                            </div></div>

                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <sapn class="input-group-addon">Gender</sapn>
                                                <select name="gender" id="gender" class="form-control" required="required">
                                                    <option>select Gender</option>
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
                                                <input type="text" class="form-control" name="BRegion" id="BRegion" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> zone</span>
                                                <input type="text" class="form-control" name="Bzone" id="Bzone" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                <input type="text" class="form-control" name="Bwereda" id="Bwereda" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Town(kebele)</span>
                                                <input type="text" class="form-control" name="Bkebele" id="Bkebele" ></div>
                                        </div>


                                        <div class="col-lg-12" >
                                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-home " ></span> Home Address</p></strong>

                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon">  Region</span>
                                                <input type="text" class="form-control" name="HRegion" id="HRegion" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> zone</span>
                                                <input type="text" class="form-control" name="Hzone" id="Hzone" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                <input type="text" class="form-control" name="Hwereda" id="Hwereda" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Town(kebele)</span>
                                                <input type="text" class="form-control" name="Hkebele" id="Hkebele" ></div>
                                        </div>



                                        <div class="col-lg-12" >
                                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-podcast " ></span> police commission </p></strong>

                                        </div>
                                        <div class="form-group col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">  sector</span>
                                                <input type="text" class="form-control" name="pcSector" id="pcSector" ></div>
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Mobile</span>
                                                <input type="text" class="form-control" name="pcMobile" id="pcMobile" ></div>
                                        </div>




                                        <div class="col-lg-12" >
                                            <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user" ></span> Person to be contacted in state of emergency </p></strong>

                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon">  Name</span>
                                                <input type="text" class="form-control" name="cpname" id="cpname" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Tel.</span>
                                                <input type="text" class="form-control" name="cptel" id="cptel" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Mobile</span>
                                                <input type="tel" class="form-control" name="cpmobile" id="cpmobile" ></div>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> relationship</span>
                                                <input type="text" class="form-control" name="cprelation" id="cprelation" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> Address</span>
                                                <input type="text" class="form-control" name="cpaddress" id="cpaddress" ></div>
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <span class="input-group-addon"> <span class=""></span> religion</span>
                                                <input type="text" class="form-control" name="cpreligion" id="cpreligion" ></div>
                                        </div>

                                        <button type="submit" id="page1" class="btn btn-primary"><span class="fa fa-save"><strong>  Save personal info</strong></span></button>
                                    </form>
                                </section>
                                <h3 class=" text-capitalize text-uppercase">Family information</h3>
                                <section style="overflow: scroll">
                                    <h4 class="text-capitalize text-muted text-info">family background </h4>
                                    <div class="col-lg-12" >
                                        <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user-o " ></span> mother's info</p></strong>

                                    </div>
                                    <div class="container-fluid">
                                        <form class="form-group " method="post" id="family_background" action="">

                                            <div class="form-group col-lg-4">

                                                <div class="input-group">
                                                    <span class="input-group-addon"> First Name</span>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Middle Name</span>
                                                    <input type="text" name="middlename" class="form-control" id="middlename" placeholder="Enter Middle name"></div>
                                            </div>

                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Last Name</span>
                                                    <input type="tetx" class="form-control" name="lastname" id="lastname" placeholder="Enter Last name"></div>
                                            </div>




                                            <div class="col-lg-12" >
                                                <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-address-card-o"></span> Address</p></strong>

                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">  Region</span>
                                                    <input type="text" class="form-control" name="BRegion" id="BRegion" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> zone</span>
                                                    <input type="text" class="form-control" name="Bzone" id="Bzone" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                    <input type="text" class="form-control" name="Bwereda" id="Bwereda" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Town</span>
                                                    <input type="text" class="form-control" name="Bkebele" id="Bkebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> kebele</span>
                                                    <input type="text" class="form-control" name="Bkebele" id="Bkebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> House No.</span>
                                                    <input type="text" class="form-control" name="hnumber" id="Hnumber" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> occupation.</span>
                                                    <input type="text" class="form-control" name="hnumber" id="Hnumber" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> place of work </span>
                                                    <input type="text" class="form-control" name="hnumber" id="Hnumber" ></div>
                                            </div>


                                            <div class="col-lg-12" >
                                                <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user-o " ></span> father's info</p></strong>

                                            </div>



                                            <div class="form-group col-lg-4">

                                                <div class="input-group">
                                                    <span class="input-group-addon"> First Name</span>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Middle Name</span>
                                                    <input type="text" name="middlename" class="form-control" id="middlename" placeholder="Enter Middle name"></div>
                                            </div>

                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Last Name</span>
                                                    <input type="tetx" class="form-control" name="lastname" id="lastname" placeholder="Enter Last name"></div>
                                            </div>




                                            <div class="col-lg-12" >
                                                <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-address-card-o"></span> Address</p></strong>

                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">  Region</span>
                                                    <input type="text" class="form-control" name="BRegion" id="BRegion" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> zone</span>
                                                    <input type="text" class="form-control" name="Bzone" id="Bzone" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                    <input type="text" class="form-control" name="Bwereda" id="Bwereda" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Town</span>
                                                    <input type="text" class="form-control" name="Bkebele" id="Bkebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> kebele</span>
                                                    <input type="text" class="form-control" name="Bkebele" id="Bkebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> House No.</span>
                                                    <input type="text" class="form-control" name="hnumber" id="Hnumber" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> occupation.</span>
                                                    <input type="text" class="form-control" name="hnumber" id="Hnumber" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> place of work </span>
                                                    <input type="text" class="form-control" name="hnumber" id="Hnumber" ></div>
                                            </div>
                                            <button type="submit" id="page1" class="btn btn-primary pull-right"><span class="fa fa-save"><strong>  Save family info</strong></span></button>
                                        </form>
                                    </div>

                                </section>
                                <h3 class="text-uppercase">Edu. Background</h3>
                                <section style="overflow: scroll">
                                    <div clsass="span12">
                                        <p>  <strong>Secondary schools attended</strong></p></div>
                                    <form class="form-group">

                                        <div class="form-group col-lg-2">
                                            <label>Grade </label>
                                            <input class="form-control" name="gr9" value="9" readonly="">
                                        </div>

                                        <div class="form-group col-lg-4">
                                            <label>school</label>
                                            <input class="form-control" name="gr9">
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <label>from</label>
                                            <input class="form-control" name="9startyear" id="9startyear" type="date">
                                        </div>

                                        <div class="form-group col-lg-3">
                                            <label>To</label>
                                            <input class="form-control" name="9endyear" id="9endyear" type="date">
                                        </div>

                                        <div class="form-group col-lg-2">

                                            <input class="form-control" name="gr10" value="10" readonly="">
                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="gr10"  type="text">
                                        </div>
                                        <div class="form-group col-lg-3">

                                            <input class="form-control" name="10startyear" id="10startyear" type="date">
                                        </div>

                                        <div class="form-group col-lg-3">

                                            <input class="form-control" name="10endyear" id="10endyear" type="date">
                                        </div>



                                        <div class="form-group col-lg-2">

                                            <input class="form-control" name="gr10" value="11" readonly="">
                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="gr10" >
                                        </div>
                                        <div class="form-group col-lg-3">

                                            <input class="form-control" name="11startyear" id="11startyear" type="date">
                                        </div>

                                        <div class="form-group col-lg-3">

                                            <input class="form-control" name="11endyear" id="11endyear" type="date">
                                        </div>
                                        <div class="form-group col-lg-2">

                                            <input class="form-control" name="gr10" value="12" readonly="">
                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="gr10" >
                                        </div>
                                        <div class="form-group col-lg-3">

                                            <input class="form-control" name="12startyear" id="12startyear" type="date">
                                        </div>

                                        <div class="form-group col-lg-3">

                                            <input class="form-control" name="12endyear" id="12endyear" type="date" >
                                        </div>
                                        <button class="btn btn-success pull-right btn-lg ">Save educational background</button>
                                    </form>
                                </section>
                                <h3 class="text-capitalize">ESLCE information</h3>
                                <section style="overflow-y:scroll ">
                                    <form>
                                        <strong>   <span class="col-lg-12">
                                                <p>write five or seven subjects with best grades obtained <small class="text-danger">English and maths should be included </small></p>
                                                NB. Grade  10 or Grade 12  result</span></strong>
                                        <div class="form-group col-lg-4">
                                            <label>subject</label>
                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>

                                        <div class="form-group col-lg-4">
                                            <label>Grade obtained</label>
                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">
                                            <label>Year(E.C)</label>
                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>

                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>


                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>

                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>


                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>


                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>


                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>


                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="subject" id="subject"/>

                                        </div>


                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="grade" id="Grade"/>

                                        </div>
                                        <div class="form-group col-lg-4">

                                            <input class="form-control" name="year" id="year" type="date"/>

                                        </div>






                                    </form>

                                </section>
                                <h3 class="text-capitalize">PSEI</h3>
                                <section style="overflow-y:scroll ">
                                    <form  class="form-group" method="get">
                                        <strong>Have you ever been enrolled in post secondary/higher education institute in Ethiopia or abroad?</strong>



                                        <div class="container">
                                            <div>
                                                <input id="question1" name="prevquestion" type="radio" class="with-font" value="yes"  required="required"/>
                                                <label for="question1">Yes I have</label>
                                            </div>
                                            <div>
                                                <input id="question2" name="prevquestion" type="radio" class="with-font" value="No" required="required"/>
                                                <label for="question2">No I haven't</label></div>
                                            <div>
                                                <div>
                                                    <input id="btn-prev-edu-continue"  type="submit" class="with-font btn btn-success" value="continue!" />

                                                </div>
                                            </div>
                                        </div>
                                    </form>


                                </section>  <h3 class="text-capitalize"> Experience </h3>
                                <section style="overflow-y:scroll ">

                                    <form class="form-group">
                                        <div class="form-group col-lg-3">

                                         
                                                <label>  Name of Employer</label>
                                                <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name">
                                        </div>
                                   
                                        <div class="form-group col-lg-3">

                                               
                                            <label> Address</label>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                          
                                        <div class="form-group col-lg-3">

                                               
                                                    <label> Telephone number</label>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                           
                                        <div class="form-group col-lg-3">

                                             
                                                    <label>  Title of current post</label>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                            
                                        <div class="form-group col-lg-3">

                                             
                                            <label> Salary</label>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                          
                                        <div class="form-group col-lg-3">

                    
                                                    <label> Date of employment</label>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                          
                                        <div class="form-group col-lg-3">

                                                
                                            <label> total year of experience</label>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                           
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <strong>Academic program to be attended in Efpuc</strong>
                                                        </div>
                                                        <div class="col-lg-4">
                                                        <select name="program" class="form-control">
                                                            <optgroup>Regular Degree Program </optgroup>
                                                            <option>Crime Prevention</option>
                                                              <option>Crime and Forensic investigation</option>
                                                                <option>Police Management</option>
                                                               
                                                                <optgroup>Advanced Degree Program </optgroup>
                                                                <option>Crime prevention</option>
                                                                <option>Crime investigation</option>
                                                                <option>Police management</option>
                                                                
                                                                <optgroup>Regular post Graduate Diploma Program </optgroup>
                                                                <option>Police science</option>
                                                                 <optgroup>Regular  Diploma  </optgroup>
                                                                 <option>Police science</option>
                                                                <option>Crime investigation</option> 
                                                                <optgroup>Police medical professional training institute</optgroup>
                                                                <option>Clinical Nursing Level IV</option>
                                                                       <option>Environmental Health Level IV</option>
                                                                              <option>Nursing Degree</option>
                                                                                     <option>Public Health Degree</option>
                                                                                            <option>Health Extension Level III</option>
                                                                                                   <option>Comprehensive nursing level IV</option>
                                                        </select>
                                                             </div>
                                                        <div class="col-lg-12">
                                                            
                                                            <p>Statement by the applicant</p>
                                                            <p>I hereby certify that all the information given above is complete and correct. I understood that  </p>
                                                        </div>
                                                   
                                                        </div>
                                                    </div>
                                                    
                                                    
                                    </form>

                                </section>


                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">








                </div>



            </div>
        </div>
    </div>

</div>  <!--      main content ends-->
<!--
<script>
    $("#btn-prev-edu-continue").click(function (e) {
        e.preventDefault();
        return false;
        alert("The paragraph was clicked.");
    });
</script>-->





<style>



    /*** basic styles ***/


    input[type=radio].with-font,
    input[type=checkbox].with-font {
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
    }

    input[type=radio].with-font ~ label:before,
    input[type=checkbox].with-font ~ label:before {
        font-family: FontAwesome;
        display: inline-block;
        content: "\f1db";
        letter-spacing: 10px;
        font-size: 1.2em;
        color: #535353;
        width: 1.4em;
    }

    input[type=radio].with-font:checked ~ label:before,
    input[type=checkbox].with-font:checked ~ label:before  {
        content: "\f00c";
        font-size: 1.2em;
        color: darkgreen;
        letter-spacing: 5px;
    }
    input[type=checkbox].with-font ~ label:before {        
        content: "\f096";
    }
    input[type=checkbox].with-font:checked ~ label:before {
        content: "\f046";        
        color: darkgreen;
    }
    input[type=radio].with-font:focus ~ label:before,
    input[type=checkbox].with-font:focus ~ label:before,
    input[type=radio].with-font:focus ~ label,
    input[type=checkbox].with-font:focus ~ label
    {                
        color: green;
    }
</style>

<script>
    $("#example-async").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slide"
    });
    $("#bdate").datepicker({
        changeMonth: true,
        changeYear: true,
        inline: true
    });

    $('[type="date"]').datepicker({
        changeYear: true,
        inline: true,
        changeMonth: true

    });





    // $( "#progressbar" ).progressbar({
    // value: 25
    //});

    var Regions = [
        "Amhara",
        "Oromia",
        "Tigray",
        "Harer",
        "Afar",
        "Benishangul gumuz",
        "Gambella",
        "SNNPR",
        "Diredawa",
        "Addis Ababa",
        "Ethiopia-Somalie"

    ];
    $("#BRegion").autocomplete({
        source: Regions
    });
$("#page1").click(function(){
    alert("page1 clicked");
});


</script>



<style>
    section
    {
        background: #ffffff;
        width: 100%;
    }
</style>
</html>
