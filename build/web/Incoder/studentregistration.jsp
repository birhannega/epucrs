
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<!Doctype html>
<link rel="stylesheet" href="../css/jQuery.steps.css"/>   
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>

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
                <%@include file="../common/sidbar2.jsp" %>
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
 
                   <%
                       //Get current date
                      Date currentdate=new Date();
                      
                      //
                      SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd");
                      String formated_date=dateformat.format(currentdate);
                    //  out.println("system date"+formated_date+" and ");
                      String[] current_time=formated_date.split("-");
                     
                        String currentYear=current_time[0];
                         String currentMonth=current_time[1];
                           String currentDate=current_time[2];
                           
                           
                   connectionManager con=new connectionManager();
                   Connection connection=con.getconnection();
                   Statement statement=connection.createStatement();
                   String query="Select Start_Date From Tbl_Schedule where SCHEDULE_ID='SI03' and acadamic_year=2010";
                   ResultSet res=statement.executeQuery(query);
                  Date startdate;
                   if(res.next())
                    
                   {
                      startdate=res.getDate(1);
                     
                     out.print("scheduled date"+startdate);
                       String[] parts = startdate.toString().split("-");
                       String year =parts[2]; // dd
                       String month =parts[1]; // mm
                       String date =parts[0];     
                    
////                       
//                       String schedule_month=Integer.valueOf(month);
//                        String schedule_year=Integer.valueOf(year);
//                        String schedule_date=Integer.valueOf(date);
                        
//                          if(schedule_month==1)
//                       {
//                           schedule_month='0'+schedule_month;
//                           //month="0".concat(month);
//                       }
                        
                        out.println("current month is  "+currentMonth+"scheduled month is "+month);
                      if(Integer.valueOf(currentMonth)==Integer.valueOf(month))
                      {
//                         currentMonth=currentMonth+12; 
                          out.println("allowed");
                         
                      }
                      else{
                       out.print("not");
                      }
                           %>
                                       
                                         
                         
                        <% 
//                         
                    
                   }else{
                       out.println("no data");   
                   }
                   
                   %>


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







                                    <button type="submit" id="page1" class="btn btn-primary"><span class="fa fa-save"><strong>  Save personal info</strong></span></button>
                                </form>
                            </section>
                            <h3>Family info</h3>
                           <section style="overflow: scroll">
                                    <h4 class="text-capitalize text-muted text-info">family background </h4>
                                    <div class="col-lg-12" >
                                        <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user-o " ></span> Father info</p></strong>

                                    </div>
                                    <div class="container-fluid">
                                        <form class="form-group " method="post" id="family_background" action="${pageContext.request.contextPath}/registerfamilyinformation">

                                            <div class="form-group col-lg-4">

                                                <div class="input-group">
                                                    <span class="input-group-addon"> First Name</span>
                                                    <input type="text" name="fathersfirstname"  class="form-control" id="firstname" placeholder="Enter fathers first name"></div>
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Middle Name</span>
                                                    <input type="text" name="fathermiddlename" class="form-control" id="middlename" placeholder="Enter Middle name"></div>
                                            </div>

                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Last Name</span>
                                                    <input type="text" class="form-control" name="fatherlastname" id="flastname" placeholder="Enter Last name"></div>
                                            </div>




                                            <div class="col-lg-12" >
                                                <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-address-card-o"></span> Address</p></strong>

                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">  Region</span>
                                                    <input type="text" class="form-control" name="fatherBRegion" id="fBRegion" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> zone</span>
                                                    <input type="text" class="form-control" name="fatherBzone" id="fBzone" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                    <input type="text" class="form-control" name="fatherBwereda" id="fBwereda" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Town</span>
                                                    <input type="text" class="form-control" name="fatherBtown" id="ftown" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> kebele</span>
                                                    <input type="text" class="form-control" name="fatherBkebele" id="fBkebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> House No.</span>
                                                    <input type="text" class="form-control" name="fatherHnumber" id="Hnumber" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> occupation.</span>
                                                    <input type="text" class="form-control" name="fatherOccupation" id="foccupation" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> place of work </span>
                                                    <input type="text" class="form-control" name="fatherworkplace" id="fworkplace" ></div>
                                            </div>


                                            <div class="col-lg-12" >
                                                <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-user-o " ></span> Mother's info</p></strong>

                                            </div>



                                            <div class="form-group col-lg-4">

                                                <div class="input-group">
                                                    <span class="input-group-addon"> First Name</span>
                                                    <input type="text" name="motherfirstname"  class="form-control" id="mfirstname" placeholder="Enter fathers first name"></div>
                                            </div>
                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Middle Name</span>
                                                    <input type="text" name="mothermiddlename" class="form-control" id="mmiddlename" placeholder="Enter Middle name"></div>
                                            </div>

                                            <div class="form-group col-lg-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> Last Name</span>
                                                    <input type="text" class="form-control" name="motherlastname" id="mlastname" placeholder="Enter Last name"></div>
                                            </div>




                                            <div class="col-lg-12" >
                                                <strong><p class="text-uppercase text-muted text-info"><span class="fa fa-address-card-o"></span> Address</p></strong>

                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon">  Region</span>
                                                    <input type="text" class="form-control" name="motherBRegion" id="mBRegion" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> zone</span>
                                                    <input type="text" class="form-control" name="motherBzone" id="mBzone" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Wereda</span>
                                                    <input type="text" class="form-control" name="motherBwereda" id="mBwereda" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> Town</span>
                                                    <input type="text" class="form-control" name="motherBtown" id="mBkTownebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> kebele</span>
                                                    <input type="text" class="form-control" name="motherBkebele" id="mBkebele" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> House No.</span>
                                                    <input type="text" class="form-control" name="motherHnumber" id="mHnumber" ></div>
                                            </div>

                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> occupation.</span>
                                                    <input type="text" class="form-control" name="motherOccuption" id="mOccupation" ></div>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <div class="input-group">
                                                    <span class="input-group-addon"> <span class=""></span> place of work </span>
                                                    <input type="text" class="form-control" name="motherPlacework" id="mplacework" ></div>
                                            </div>
                                            <button type="submit" id="page1" class="btn btn-primary pull-right"><span class="fa fa-save"><strong>  Save family info</strong></span></button>
                                        </form>
                                    </div>

                                </section>
                            <h3>Third Step</h3>
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
                            <h3>Fourth Step</h3>
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

                        </div>
                    </div>
                </div>


            </div><!--/.col-->

        </div>



    </div>

 <!--      main content ends-->

<%
    request.getSession().setAttribute("studentRegistered", null);
%>


</html>


<script type="text/javascript">
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
        },
        messages:{
            studentfirstname:{
                required:"student first name cannot be empty"
            }
        }
    });
    // family validation
      $("#family_background").validate({
        rules: {
            fathersfirstname:
                    {
                        required: true,
                        minlength: 2,
                        digits: !true,
                        maxlength: 30
          
                    },
            fathermiddlename: {
                required: true,
                minlength: 2,
                digits: false,
                maxlength: 30
            },
            fatherlastname: {
                required: true,
                minlength: 2,

                maxlength: 30
            },
            fatherBzone: {
                required: true
            },
            fatherBtown:{
                  required: true
            },
            fatherBRegion: {
                required: true
            },
            fatherBwereda: {
                required: true
            },
            fatherBkebele: {
                required: true
            
           },
            fatherHnumber:{
                required:true
            },
            fatherOccupation:{
                required:true
            },
            fatherworkplace:{
               required:true,
               minlength:3
           },
           //mother
             motherfirstname:{
               required:true
           },           
           mothermiddlename:{
                required:true
           },
           motherlastname:{
               required:true
           },
            motherBRegion:{
              required:true
          },
           motherBzone:{
            required:true
          },
          motherBwereda:{
              required:true
          },
           motherBtown:{
              required:true
          },
          
          motherBkebele:{
              required:true
          },
          motherHnumber:{
              required:true
          },
         motherOccuption:{
              required:true
          },
          motherPlacework:{
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
