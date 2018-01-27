<%-- 
    Document   : herby
    Created on : Nov 2, 2017, 10:33:27 AM
    Author     : luv2codeit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <title> complete registration </title>
    </head>
    <body>
        <div class="row">
            <%@include  file="../common/head_banner.jsp"%>
        </div>
        <div class="container">
            <h3 class="text-info">Statement by the applicant</h3>
            <hr>
            <p>
                I hereby certify that all the information given above is complete and correct.I understand that in the event of deliberately giving false information 
                ,I may be liable to dismissal from the college. I can not claim reimbursement of any fee paid. I undertake to abide by rules and regulations of the Ethiopian Police university college.
            </p>
            <form class="form-inline" method="Post" action="${pageContext.request.contextPath}/herby">
                <input type="hidden"  name="studid"  value="<%=session.getAttribute("studentId")%>"/>
                <input type="hidden"  name="herby" value="1"/>
                <input type="submit" class="btn btn-warning" value="I Agree "/>
            </form>
        </div>
    </body>
</html>
