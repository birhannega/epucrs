
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Start registration </title>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
            <span class="alert alert-info">Do have an account?  <a class="btn btn-link" href="<%=pageContext.getPage() %>"><strong>Back to Login</strong></a></span>

      
        </div>
        <h3 class="container">Start new application</h3>
        <hr>
        <div class="container">
            <div class="form-group ">
                <form class="form-group" method="post" action="">
                    <div class="form-group col-lg-6">
                        <label>Are you police or civil student? </label>
                        <select class="form-control" name="applicant_type" required="required">
                            <option value="">choose your type</option>
                            <option value="police">Police applicant</option>
                            <option value="civil">civil applicant</option>
                        </select>
                    </div>
                    <div class="form-group ">
                        <br>
                        <button type="submit" class="btn btn-primary">continue</button>
                    </div>
                </form>
            </div>

            <%
                if (request.getParameter("applicant_type") != null && request.getParameter("applicant_type").trim() != null) {
                    String type = request.getParameter("applicant_type");
                    if (type.equalsIgnoreCase("civil")) {
            %>
            <div class="form-group pull-left">
                <form class="form-group" method="post">
                    Have you taken 270 hr training?
                    <label class="radio-inline">
                        <input type="radio" name="270course" id="inlineRadio1" value="option1"> Yes
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="270course" id="inlineRadio2" value="option2"> No
                    </label>

                </form>


                <%} else if (type.equalsIgnoreCase("police")) {
                            session.setAttribute("type", type);
                            out.print("<span class='pull-left'><a href=" + "studentRegistration.jsp>" + "<button class='btn  btn-default'><strong>Click here continue registration</strong></button></a></span>");

                        }

                    }
                %>


            </div>
        </div>
    </body>
</html>
