<%-- 
    Document   : psei
    Created on : Oct 12, 2017, 3:02:15 PM
    Author     : luv2codeit
--%>
<%
if(session.getAttribute("studentId")==null){
response.sendRedirect("../index.jsp");
}else
{
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Post secondary education</title>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
            <div class="alert alert-info">Hello <%out.print("<strong>" + session.getAttribute("fullname") + "</strong><p>Please fill the form below if you have been enrolled in post secondary/higher education institute in Ethiopia</p>"); %></div>
            <div class="form-group">
                ${recorded}
                <div class="form-group ">
                    <form class="form-inline" method="Post" >
                        <select class="form-control" name="ps_background">
                            <option value="">--------choose one from dropdown--------</option>
                            <option value="yes">Yes I have been enrolled</option>
                            <option value="no">No I haven't been enrolled</option>
                        </select>
                        <button type="submit" class="btn btn-primary">Go!</button>
                    </form>
                </div>

            </div>
            <%
                
                if (request.getParameter("ps_background") != null) {
                    String choice = request.getParameter("ps_background");
                    if (choice.equalsIgnoreCase("yes")) {
            %>
            <form class="form-group" method="POSt" action="${pageContext.request.contextPath}/savePsei">
                <div class="form-group col-lg-4">
                    <label> Choose program</label>
                    <select class="form-control" name="program_attended">
                        <option value="">choose program</option>
                        <option value="Degree">Degree</option>
                        <option value="diploma">Diploma</option>
                        <option value="certificate">certificate</option>
                    </select>
                </div>
                <div class="form-group col-lg-4">
                    <label>name of institution</label>
                    <input class="form-control" name="institution" />
                </div>
                <div class="form-group col-lg-4">
                    <label>Major field of study</label>
                    <input class="form-control" name="field" />
                </div>
                <div class="form-group col-lg-4">
                    <label>Dates from</label>
                    <input type="date" class="form-control" name="start_from" />
                </div>
                <div class="form-group col-lg-4">
                    <label>Dates  to</label>
                    <input type="date" class="form-control" name="start_end" />
                </div>
                <div class="form-group col-lg-4">
                    <label>CGPA</label>
                    <input type="number" step="0.01" class="form-control" name="cgpa" />
                </div>
                <div class="form-group ">
                    <input type="hidden" name="studentId"  value="<%=session.getAttribute("studentId")%>"  />
                    <input type="submit" class="btn btn-primary pull-right"  />
                </div>
            </form>
            <%
                session.setAttribute("recorded",null);
                    } else if (choice.equalsIgnoreCase("no")) {
                      %>
                      <a href="experience.jsp"><button class="btn btn-link">Next</button> </a>
                      <%
                    }
                }

            %>

        </div>
    </body>
</html>
<%}%>