<%-- 
    Document   : ViewStudentMark
    Created on : Aug 26, 2017, 5:24:17 AM
    Author     : seid
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student mark</title>
        <%@include file="../common/imports.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../common/department_nav.jsp" %>
        </div>
        <div class="" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
            <div class="container col-lg-9 col-md-6 col-xs-12">
                <div id="editdiv" class="">
                    
                </div>
                
                <table class="table table-responsive table-bordered" id="marklisttable">
                    <thead>
                    <th>Student id</th>
                    <th>Student name </th>
                    <th>grade</th>
                    <th>section</th>
                    <th>Project 10%</th>
                    <th>Activity 20%</th>
                    <th>mid exam 20%</th>
                    <th>final exam 40</th>
                    <th>Assignment 5%</th>
                    <th>Attendance 5%</th>
                    <th colspan="2">Edit/Delete</th>
                    </thead>
                     <tbody>
                        <tr>
                    <%String id=null,firstname=null,middlename=null,lastname=null,gender=null;
                        connectionManager con=new connectionManager();
                    Statement  st_view_mark=con.getconnection().createStatement();
                    ResultSet rs_view_mark=st_view_mark.executeQuery("select * from TBL_MARK_SUBMISSION");
                    while(rs_view_mark.next()){
                        id=rs_view_mark.getString("STUD_ID");
%>
                   
                            
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <%=id%>
                            </td>
                            <td>
                                <form method="get" action="">
                                    <input type="hidden" name="dele_id" value="<%=id%>"/>
                                    <input type="submit" value="Delete" class="btn btn-danger">
                                    
                                </form>
                            </td>
                             <td>
                                <form method="get" action="">
                                    <input type="hidden" name="edit_id" value="<%=id%>"/>
                                    <input type="submit" id="editbtn" value="Edit" class="btn btn-warning">
                                    
                                </form>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                    <div id="editdiv" class="">
                    
                </div>
            </div>
        </div>
                    
                    <script type="text/javascript">
                        $(document).ready(function(){
                           $("#editbtn").click(function(){
                              $("#editdiv").html("<h2>edit this result</h2>");
                           });
                        });
                    </script>
    </body>
</html>
