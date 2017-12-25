
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>


<%
    connectionManager schcon = new connectionManager();
%>


<div class="col-lg-12" style="margin-top: 10px">
    <div id="studprofile" class="col-lg-6">
        
    </div>
    <%        Connection connection = schcon.getconnection();

        Statement statement = connection.createStatement();
        String id = request.getParameter("studid");

        String sql = "select * from TBL_STUDENT_PROFILE";
        ResultSet resultSet = statement.executeQuery(sql);
        int counter=0;
    %>
    <table class="table table-condensed" id="studlist">
        <thead>
        <th>No.</th>
        <th>Student ID</th>
        <th>Full name</th>
        </thead>
        <tbody>
            <%                while (resultSet.next()) {
                counter=counter+1;
            %>
            <tr>
                 <td><%=counter%></td>
                 <td class="text-capitalize"> <%=resultSet.getString("Stud_id")%>  </td>
                 <td class="text-capitalize"><%=resultSet.getString("STUD_FIRST_NAME") + " " + resultSet.getString("STUD_middle_NAME") + " " + resultSet.getString("STUD_LAST_NAME")%> </td>
                 <td><form action="profile.jsp" method="Post">
                          <input type="hidden" name="studid" value="<%=resultSet.getString("Stud_id")%>"/>
                         <input type="submit" class="btn btn-info" value=" view profile"/>
                     </form>
                 </td>
            </tr>
            <%
             }
            %>
        </tbody>
    </table>
</div>
        <script src="../resources/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>

        <script src="../resources/DataTable/js/dataTables.bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
            $("#studlist").bdt();
        </script>
