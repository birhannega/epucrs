<%-- 
    Document   : CourseRegSelect
    Created on : 26-Oct-2017, 08:04:11
    Author     : user
--%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
    String varcrsassignment = request.getParameter("courseAssname");
//    String dateassigned = request.getParameter("dateassigned");
//    String round = request.getParameter("round");
//    String totalH = request.getParameter("totalH");
//    String durationFrom = request.getParameter("durationFrom");
//    String durationTo = request.getParameter("durationTo");
//out.print(varname);
// String buffer="<select name='state' ><option value='-1'>Select</option>";  
    try {
        connectionManager con = new connectionManager();
        Connection connection = con.getconnection();
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("select distinct TBL_COURSE_LIST.ACADEMIC_STAFF_ID, TBL_ACADEMIC_STAFF_REG.FIrst_NAME ||' '|| TBL_ACADEMIC_STAFF_REG.MIDDLE_NAME ||' '|| TBL_ACADEMIC_STAFF_REG.LAST_NAME as FULL_NAME,TBL_COURSE_LIST.COURSE_CODE "
                + "from TBL_COURSE_LIST,TBL_ACADEMIC_STAFF_REG"
                + " where TBL_COURSE_LIST.ACADEMIC_STAFF_ID='" + varcrsassignment + "' "
                + " and TBL_ACADEMIC_STAFF_REG.ACADEMIC_STAFF_ID=TBL_COURSE_LIST.ACADEMIC_STAFF_ID");

%>

<!--<form method='POST' id='formcrs' name="formcrs" action="CourseListAssign.jsp">-->
<form  class='form-group'  Method='POST' action="${pageContext.request.contextPath}//CourseInstServlet">
<!--<form  class='form-group'  Method='POST' action="CourseListAssign.jsp">-->
      <!--String assdate=request.-->
    <div class="container-fluid">
        <%     String name = null;
            if (rs.next()) {
                name = rs.getString("FULL_NAME");
            }
        %>
        <label type="text" id="crsname" name="crsname"><%=name%></label><br>
        <div class="table-responsive">
            <table class="table table-striped">
                <!--<caption>Responsive Table Layout</caption>-->
                <thead>
                    <tr>
                        <th>Course ID</th>
                        <th>Assign Date</th>
                        <th>Round</th>
                        <th>Total Hour</th>
                        <th>Duration From</th>
                        <th>Duration To</th>
                    </tr>
                </thead>
                <%

                    while (rs.next()) {
               //       String staffid=rs.getString("FULL_NAME");
                        String crs_code = rs.getString("COURSE_CODE");
               //          String crdthr=rs.getString("CREDIT_HOURS");

                %>


                <!--<input class="container-fluid"  type=checkbox id="crsname" name="crsname" value="<%=crs_code%>"><%=crs_code%></br>-->
                <input class="hidden" type="text" name="staffid" id="staffid" placeholder="Staff ID">
                <tbody>
                    <tr>
                       <!--<td ><%=name%></td>-->
                        <td><input class="container-fluid"  type=checkbox id="crsname" name="crsname[]" value="<%=crs_code%>"><%=crs_code%></td>
                        <!--<td><input class="" type="text" name="staffid" id="staffid" placeholder="Staff ID"></td>-->
                        <td><input class="" type="date" name="assigndate" id="assigndate" placeholder="assign date"></td>
                        <td><input class="" type="text" name="round" id="round" placeholder="round"></td>
                        <td><input class="" type="text" name="totalhour" id="totalhour" placeholder="Total Hour"></td>
                        <td><input class="" type="date" name="durationfrom" id="durationfrom" placeholder="Duration From"></td>
                        <td><input class="" type="date" name="durationto" id="durationto" placeholder="Duration To"></td>

                    </tr>
                </tbody>

                <%}%>
        </div>

        </table>
    </div> 
    <button type="submit" id="btnsavecrs" name="btnsavecrs" class="btn btn-success"><span class="fa fa-save"><strong>  Save info</strong></span></button>
    
  </div
</form>



<% } catch (Exception e) {
        System.out.println(e);
    }

%>
