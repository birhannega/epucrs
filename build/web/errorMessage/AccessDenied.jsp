<%-- 
    Document   : AccessDenied
    Created on : 17-Jul-2017, 05:02:02
    Author     : user
--%>

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
                           
                            <div class="pull-right">


                            </div>

                        </div>
                    </div>
                    <div class="row">
 
                  


                        <div id="example-async" class="pull-center">
                            <p style="font-size: 50">Access Denied</p>
                            <p style="font-size: 50">you have no privilage to access that page</p>
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
    
</script>
