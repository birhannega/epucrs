<%-- 
    Document   : experience
    Created on : Oct 19, 2017, 3:17:18 AM
    Author     : luv2codeit
--%>
<%
if(session.getAttribute("pseisaved")==null)
{
    response.sendRedirect("psei.jsp");
}else
{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <title>work experience</title>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
            <h4 class="page-header">Register your work experience (if any) </h4>
            <div class="form-group">
                <%
                  if(session.getAttribute("experienceexists")!=null)  
                  {
                %>
                <div class="alert alert-dismissible alert-warning">${experienceexists}<a href="eslce.jsp"><button class="btn btn-link">Click here to continue</button></a> </div>
                <form class="form-group" method="post" action="${pageContext.request.contextPath}/SaveExperience">
                    <div class="form-group col-lg-6">
                        <label>Name of Employer</label>
                        <input type="text" name="employer" class="form-control" disabled="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Address</label>
                        <input type="text" name="address" class="form-control" disabled="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Telephone</label>
                        <input type="text" name="employertel" class="form-control" disabled="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Title of current post</label>
                        <input type="text" name="title" class="form-control" disabled="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>salary</label>
                        <input type="text" name="salary" class="form-control" disabled="">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Date of employment</label>
                        <input type="text" name="dateofemployment" class="form-control" disabled="disabled">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Total years of work experience</label>
                        <input type="text" name="totalexp" class="form-control" disabled="">
                    </div>
                    <div class="form-group col-lg-6">
                        <br>
                        <input type="hidden" name="studid" value="<%=session.getAttribute("studentId") %>"/>
                        <button type="submit" class="btn  btn-primary " disabled="">Save work experience</button>
                    </div>
                </form>
                        <%
                        }
                        else
{%>
  <form class="form-group" method="post" action="${pageContext.request.contextPath}/SaveExperience" >
                    <div class="form-group col-lg-6">
                        <label>Name of Employer</label>
                        <input type="text" name="employer" class="form-control" >
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Address</label>
                        <input type="text" name="address" class="form-control" >
                    </div>
                    <div class="form-group col-lg-6" >
                        <label>Telephone</label>
                        <input type="text" name="employertel" class="form-control">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Title of current post</label>
                        <input type="text" name="title" class="form-control">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>salary</label>
                        <input type="text" name="salary" class="form-control">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Date of employment</label>
                        <input type="text" name="dateofemployment" class="form-control">
                    </div>
                    <div class="form-group col-lg-6">
                        <label>Total years of work experience</label>
                        <input type="text" name="totalexp" class="form-control">
                    </div>
                    <div class="form-group col-lg-6">
                        <br>
                        <input type="hidden" name="studid" value="<%=session.getAttribute("studentId") %>"/>
                        <button type="submit" class="btn  btn-primary">Save work experience</button>
                    </div>
                </form>
                        <%}%>
            </div>
        </div>
    </body>
</html>
<%}%>