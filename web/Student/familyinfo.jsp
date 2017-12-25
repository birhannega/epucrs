<%-- 
    Document   : familyinof
    Created on : Oct 6, 2017, 6:51:45 AM
    Author     : luv2codeit
--%>

<%
if(session.getAttribute("step1")==null)
{
    response.sendRedirect("../index.jsp");
}
else
{
%>


<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>family info</title>
    </head>
    <body>
         <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
            <div class="alert alert-success"><strong>
        <%  String father_firstname=null,fathermiddlename=null;
            if(session.getAttribute("fullname").toString()!=null)
            {
                out.println("well done "+session.getAttribute("fullname").toString()+"Your ID number is "+"  "+session.getAttribute("studentId").toString()+" <p> Please fill your family info</p>");
               connectionManager dbconn=new connectionManager();
               Connection family_con=dbconn.getconnection();
               Statement st_fam_info=family_con.createStatement();
               ResultSet rs_fam=st_fam_info.executeQuery("select STUD_MIDDLE_NAME,Stud_last_name from TBl_student_profile where stud_id='"+session.getAttribute("studentId").toString()+"'");
             
               if(rs_fam.next())
               {
                   father_firstname=rs_fam.getString("STUD_MIDDLE_NAME");
                   fathermiddlename=rs_fam.getString("Stud_last_name");
               }
               
               
            }
        %>
                </strong> </div>
                <div class="container">
                    <form class="form-group " meth od="post" id="family_background" action="${pageContext.request.contextPath}/registerfamilyinformation">
                                      
                                        <input type="hidden" name="studidfamily" value="${studentId}"/>
                                        <div class="form-group col-lg-4">

                                            <div class="input-group">
                                                <span class="input-group-addon"> First Name</span>
                                                <input type="text" name="fathersfirstname" value="<%=father_firstname%>" class="form-control"  id="firstname" placeholder="Enter fathers first name"></div>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"> Middle Name</span>
                                                <input type="text" name="fathermiddlename"  class="form-control" value="<%=fathermiddlename%>" id="middlename" placeholder="Enter Middle name"></div>
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
                                        <input type="hidden" name="step" value="step1"/>
                                        <button type="submit" id="page1" class="btn btn-primary pull-right"><span class="fa fa-save"><strong>  Save family info</strong></span></button>
                                    </form>
                </div>
        </div>
    </body>
    <%
    }
    %>
</html>
