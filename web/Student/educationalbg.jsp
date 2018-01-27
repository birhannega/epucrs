<%-- 
    Document   : educationalbg
    Created on : Oct 9, 2017, 11:28:19 AM
    Author     : luv2codeit
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Educational background</title>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">

            <p>  <strong>Secondary schools Educational Background</strong></p>
            <form class="form-group" method="post" action="${pageContext.request.contextPath}/Studentbackground">

                <div class="alert alert-success">
                    Your ID:
                    <%=session.getAttribute("stud_id").toString()%> please fill your educational background
                </div>
                ${idexists}
                <%
                    if(session.getAttribute("idexists")!=null)
                    {
                    connectionManager db_edu=new connectionManager();
                    Connection dbc_edu=db_edu.getconnection();
                    Statement st_edu=dbc_edu.createStatement();
                    String sql_edu="select * from TBL_EDUCATIONAL_BACKGROUND where stud_id='"+session.getAttribute("stud_id").toString()+"'";
                    ResultSet resultSet_edu=st_edu.executeQuery(sql_edu);
                    if(resultSet_edu.next())
                    {
                        //Get grade 9 data
                        Statement st_9=dbc_edu.createStatement()
                                ,st_10=dbc_edu.createStatement()
                                ,st_11=dbc_edu.createStatement()
                                ,st12=dbc_edu.createStatement();
                        ResultSet rs_9,rs_10,rs_11,rs_12;
                        String school_9=null
                                ,school_10=null,school_11=null,school_12=null;
                        String start_9=null,Start_10=null,Start_11=null,Start_12=null;
                        String End_9=null,End_10=null,End_11=null,End_12=null;
                        
                        rs_9=st_9.executeQuery("select * from TBL_EDUCATIONAL_BACKGROUND where stud_id='"+session.getAttribute("stud_id").toString()+"' and Grade=9");
                       rs_10=st_10.executeQuery("select * from TBL_EDUCATIONAL_BACKGROUND where stud_id='"+session.getAttribute("stud_id").toString()+"' and Grade=10");
                       rs_11=st_11.executeQuery("select * from TBL_EDUCATIONAL_BACKGROUND where stud_id='"+session.getAttribute("stud_id").toString()+"' and Grade=11");
                       rs_12=st12.executeQuery("select * from TBL_EDUCATIONAL_BACKGROUND where stud_id='"+session.getAttribute("stud_id").toString()+"' and Grade=12");
 if(rs_9.next())
{
    school_9=rs_9.getString("SCHOOL");
    start_9=rs_9.getString("START_DATE");
    End_9=rs_9.getString("END_DATE");
}
 if(rs_10.next())
{
       school_10=rs_9.getString("SCHOOL");
    Start_10=rs_10.getString("START_DATE");
    End_10=rs_10.getString("END_DATE");
}
 if(rs_11.next())
{
       school_11=rs_11.getString("SCHOOL");
    Start_11=rs_11.getString("START_DATE");
    End_11=rs_11.getString("END_DATE");
}
 if(rs_12.next())
{
       school_12=rs_12.getString("SCHOOL");
    Start_12=rs_12.getString("START_DATE");
    End_12=rs_12.getString("END_DATE");
}
%>
                   <div  class="col-lg-12 well well-sm">

                    <div class="col-lg-3 "><strong>Grade</strong></div>
                    <div class="col-lg-3 "><strong>School</strong></div>
                    <div class="col-lg-3 "><strong>Start Year</strong></div>
                    <div class="col-lg-3 "><strong>End year</strong></div>

                </div>
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade9" readonly="readonly" value="9" class="form-control" placeholder="Grade 9" >
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school9" readonly="readonly" value="<%=school_9%>" class="form-control" placeholder="Enter name of school/ Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="startdate9" readonly="readonly" value="<%=start_9%>" class="form-control" placeholder="start date/ Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="enddate9" readonly="readonly" value="<%=End_9%>"class="form-control" placeholder="End date/ Grade 9">
                    </div>
                </div>
                <!--Grade ten-->
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade10" readonly="readonly" value="10" class="form-control" placeholder="Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school10" value="<%=school_10%>"  readonly="readonly" class="form-control" placeholder="Enter name of school/ Grade 10">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="startdate10" readonly="readonly" value="<%=Start_10%>" class="form-control" placeholder="start date/ Grade 10">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="enddate10" value="<%=End_10%>" readonly="readonly" class="form-control" placeholder="End date/ Grade 10">
                    </div>
                </div>
                <!--Grade 11-->
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade11" readonly="readonly" value="11" class="form-control" placeholder="Grade 11">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school11" value="<%=school_11%>" readonly="readonly"  class="form-control" placeholder="Enter name of school/ Grade 11">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="startdate11"  value="<%=Start_11%>" readonly="readonly" class="form-control" placeholder="start date/ Grade 11">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="enddate11"  value="<%=End_11%>" readonly="readonly" class="form-control" placeholder="End date/ Grade 11">
                    </div>
                </div>
                <!--Grade 12-->
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade12" readonly="readonly" value="12" class="form-control" placeholder="Grade 12">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school12" value="<%=school_12%>" readonly="readonly"  class="form-control" placeholder="Enter name of school/ Grade 12">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="startdate12"  value="<%=Start_12%>" readonly="readonly" class="form-control" placeholder="start date/ Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="enddate12" value="<%=End_12%>" readonly="readonly" class="form-control" placeholder="End date/ Grade 12">
                    </div>
                </div>

                <input type="hidden" name="studid" value="<%=session.getAttribute("stud_id").toString()%>"/>
                <button class="btn btn-primary pull-right disabled">Save Educational background</button> 
                <a href="psei.jsp"><strong>click here to complete Registration</strong></a>
                    <%
                    }
                    }
                    else
                  {
                %>
                <div  class="col-lg-12 well well-sm">

                    <div class="col-lg-3 "><strong>Grade</strong></div>
                    <div class="col-lg-3 "><strong>School</strong></div>
                    <div class="col-lg-3 "><strong>Start Year</strong></div>
                    <div class="col-lg-3 "><strong>End year</strong></div>

                </div>
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade9" readonly="readonly" value="9" class="form-control" placeholder="Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school9" class="form-control" placeholder="Enter name of school/ Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="startdate9" class="form-control" placeholder="start date/ Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="enddate9" class="form-control" placeholder="End date/ Grade 9">
                    </div>
                </div>
                <!--Grade ten-->
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade10" readonly="readonly" value="10" class="form-control" placeholder="Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school10" class="form-control" placeholder="Enter name of school/ Grade 10">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" data-type="date" name="startdate10" class="form-control" placeholder="start date/ Grade 10">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="enddate10" class="form-control" placeholder="End date/ Grade 10">
                    </div>
                </div>
                <!--Grade 11-->
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade11" readonly="readonly" value="11" class="form-control" placeholder="Grade 11">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school11" class="form-control" placeholder="Enter name of school/ Grade 11">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="startdate11" class="form-control" placeholder="start date/ Grade 11">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="enddate11" class="form-control" placeholder="End date/ Grade 11">
                    </div>
                </div>
                <!--Grade 12-->
                <div  class="col-lg-12">
                    <div class="col-lg-3 form-group">
                        <input type="text" name="grade12" readonly="readonly" value="12" class="form-control" placeholder="Grade 12">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" name="school12" class="form-control" placeholder="Enter name of school/ Grade 12">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="startdate12" class="form-control" placeholder="start date/ Grade 9">
                    </div>
                    <div class="col-lg-3 form-group">
                        <input type="text" data-type="date" name="enddate12" class="form-control" placeholder="End date/ Grade 12">
                    </div>
                </div>

                <input type="hidden" name="studid" value="<%=session.getAttribute("stud_id").toString()%>"/>
                <button class="btn btn-primary pull-right">Save educational background</button>
                <%
                }
                %>
            </form>
        </div>
            <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
            <link href="../resources/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <script src="../resources/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
            <script type="text/javascript">
               $('input[data-type="date"]').datepicker({
                                        changeYear: true,
                                        changeMonth: true,
                                        inline: true
                                    });
                </script>
    </body>
    
</html>
