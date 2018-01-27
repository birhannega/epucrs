<%-- 
    Document   : Re-grade
    Created on : Feb 6, 2017, 10:37:41 PM
    Author     : seid
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"type="text/css"href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet"type="text/css"href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../bootstrap/font-awesome/css/font-awesome.css">
        <script type="text/javascript" src="../resources/js/jquery.js"></script>
        <%@include file="../common/imports.jsp"%>
    <div class="container-fluid"style="margin-top: 5px;">
        <%@include file="../common/TeacherHeader.jsp" %></div>
    <div class="span12"style="margin-top: -20px;">
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="registrarsidebar.jsp"%></div></div></div>
    <script type="text/javascript"
    src="../resources/js/jquery.bdt.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#regrade').bdt(
                    {
                        ordering: true,
                        scrollY: 300,
                        paging: false
                    });

        })
    </script>
    <style type="text/css">
        #Text1{
            height: 6px;
            height:3px;
            padding-top: -12px;
            margin-top: 2px;

        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Re_grade</title>
</head>
<body>
    <form action=""name=""method="post">
        <%
             GregorianCalendar cal = new GregorianCalendar();
             ;%>
        <h3 class=" text-center page-header col-lg-9"><strong>Ethiopian Police University College<br>
                Grade/Mark/ Change Report Form</strong></h3>
        <div class="container form-inline">
            <label for="disable">Academic Year<input type="text" value="<% out.print(cal.get(Calendar.YEAR)); %>"name="year"class="form-control"size="12px;" disabled>
            </label>
            <label>Program/Dpt<select class="form-control"  name="program"><option value="null ">--select program---</option>
                    <option value="se">Software</option>
                    <option value="cs">Computer Science</option>
                    <option value="economics">Economics</option>
                    <option value="accounting">Accounting</option>
                    <option value="health">health</option>
                    <option value="sport">Sport</option>
                    <option value="civic">Civil</option></select>
            </label>


            <label>Term<select input type="text"name="term" class="form-control">
                    <option value="null">---select term--</option>
                    <option value="t1">Term1</option>
                    <option value="t2">Term2</option>
                </select></label>
            <button class="btn btn-primary">
                <span class="fa fa-arrow-right"></span>Go</button>
            <div class="alert-success pull-right"><label>Well Come Instructor Seid Nur</label></div>
        </div>
    </form>
    <br>
    <%if (request.getParameter("program") == null && request.getParameter("term") == null) {

    %>

    <div class="alert alert-warning text-center col-lg-offset-4"style="margin-top: -320px;margin-right: 15%;margin-right: 25%"><h5 class="text-danger" id="Text1" >You Must Choose program and Term from the above option</h5></div>
    <% } else {
            String program = request.getParameter("program"), term = request.getParameter("term");
            if (program.equals("se") || program.equals("cs") || program.equals("economics") || program.equals("health") || program.equals("sport") || program.equals("civic") && term.equals("t1") || term.equals("t2")) {%>
    <div class="container">
        <form class="form-inline"name="re-grade" action=""method="post" onsubmit="return CheckForm(this)">
            <div class="col-lg-offset-2"style="margin-top: -320px;margin-right: 10%">
                <table class="table  table-striped  table-bordered" id="regrade">

                    <th>Student id</th>
                    <th>Student Name</th>
                    <th>Module Code</th>
                    <th>Module Title</th>
                    <th>Change From</th>
                    <th>To</th>
                    <th>Reason For Change</th>
                    <th>Action</th>
                    <tbody><tr><td>R/2549</td>
                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr>
                        <tr><td>R/2549</td>

                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr><tr><td>R/2550</td>
                            <td>Mohammed nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr><tr><td>R/2551</td>
                            <td>Birhan nega</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr>
                        <tr><td>R/2549</td>
                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr>
                        <tr><td>R/2549</td>
                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td></tr>
                        <tr>
                            <td>R/2549</td>
                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr>
                        <tr><td>R/2549</td>
                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr>
                        <tr><td>R/2549</td>
                            <td>seid nur</td>
                            <td>se1010</td>
                            <td>introduction to software</td>
                            <td><input type="text" name="change"class="form-control"size="20"></td>
                            <td><input type="text"name="to"class="form-control"size="20"></td>
                            <td><input type="text"name="reason"class="form-control"size="20"></td>
                            <td><input type="submit"value="submit"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <%    }
                }%>

    </div>
</body>
</html>
