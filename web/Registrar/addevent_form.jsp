
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<link href="../resources/DataTable/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>


<%
connectionManager schcon = new connectionManager();
                Connection connection = schcon.getconnection();
                Statement statement = connection.createStatement();
%>
<!-- Button trigger modal -->

<button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#myModal">
    <span class="fa  fa-plus-square-o">  </span> <strong>New schedule</strong>
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form class="form-group" action="${pageContext.request.contextPath}/addschedule" method="POST" >
                        <div class="form-group ">
                            Event title
                            <input type="text" class="form-control" name="eventtitle" placeholder="Enter event title" />
                        </div>
                        <div class="form-group ">
                            Event name
                            <input type="text" class="form-control" name="eventname" />
                        </div>
                        <div class="form-group ">
                            Start Date
                            <input type="date" class="form-control" name="startdate" />
                        </div>
                        <div class="form-group ">
                            End Date
                            <input type="date" class="form-control" name="enddate" />
                        </div>
                        <button type="submit" class="btn btn-primary"> Add event</button>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<div class="col-lg-12" style="margin-top: 10px">
    <%
        if (request.getParameter("action") != null && request.getParameter("id") != null) {
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            if (action.equalsIgnoreCase("delete")) {
    %>    
    <script>
        alert("are you sure?");
    </script>

    <%} else if (action.equalsIgnoreCase("edit")) {
ResultSet rs_edit=statement.executeQuery("select * from TBL_SChedule where schedule_id='"+id+"'");
if(rs_edit.next())
{

    %>
    <div class="form-group">
        <p class=""> <strong>Editing <%=rs_edit.getString("EVENT_NAME")%></strong> </p>
        <form class="form-group" action="${ pageContext.request.contextPath }/Edit_event" method="Post">
            <div class="form-group col-lg-4">
                Event ID
                <input class="form-control" type="text" name="eventid" value="<%=id%>" readonly/>
            </div>
             <div class="form-group col-lg-4">
                Event name;
                <input class="form-control" type="text" name="edited_event_title" value="<%=rs_edit.getString("title")  %>"/>
            </div>
            <div class="form-group col-lg-4">
                Event name;
                <input class="form-control" type="text" name="edited_eventname" value="<%=rs_edit.getString("EVENT_NAME")  %>"/>
            </div>
              <div class="form-group col-lg-4">
                Event Starts;
                <input class="form-control" type="date" name="edited_start_date" value="<%=rs_edit.getString("start_date")  %>"/>
            </div>
             <div class="form-group col-lg-4">
                Event due;
                <input class="form-control" type="date" name="edited_end_date" value="<%=rs_edit.getString("end_date")  %>"/>
               
            </div>
                 <div class="form-group col-lg-4"> <br>
                
                     <input class="btn btn-warning" type="submit" value="save changes"/>
                 </div>
        </form>
    </div>
    <%}
}
        }
    %>


    <table class="table table-condensed table-hover table-responsive" id="schedule" >

        <thead >
            <tr>
                <th colspan="8" >
                    <span class="text-info ">  <strong> Ethiopian Police university college 2009 Academic year schedule</strong></span>
                </th>
            </tr>
            <tr>
                <th class="active">No.</th>
                <th class="active">Schedule ID</th>
                <th class="active">Title</th>
                <th class="active">Event</th>
                <th class="active">Start Date</th>
                <th class="active">End Date</th>
                <th class="active">Edit</th>
                  <th class="active">Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                Date date=new Date();
                SimpleDateFormat sdf=new SimpleDateFormat("Y");
                String currentyear=sdf.format(date);
                String sql = "select * from TBL_SCHEDULE where ACADEMICYEAR='"+currentyear+"' order by Schedule_id ";
                ResultSet resultSet = statement.executeQuery(sql);
                int counter = 0;
                while (resultSet.next()) {
                    counter = counter + 1;
            %>
            <tr>
                <td><%=counter%></td>
                     <td><%=resultSet.getString("Schedule_id")%></td>
                <td><%=resultSet.getString("title")%></td>
                <td><%=resultSet.getString("EVENT_NAME")%></td>
                <td><%=resultSet.getString("START_DATE")%></td>
                <td><%=resultSet.getString("END_DATE")%></td>
                <td>
                    <form  action="" method="post">
                        <input type="hidden" name="action" value="edit"/>
                        <input type="hidden" name="id" id="editid" value="<%=resultSet.getString("Schedule_id")%>"/>
                        <button class="btn btn-warning">Edit</button>
                    </form>
                </td>
                <td>
                    <form action="" class="form-group" method="post">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" id="deleteid" value="<%=resultSet.getString("Schedule_id")%>"/>
                        <button class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>

    </table>

</div>
     
       
<script src="../resources/DataTable/js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript">
    $("input[type=date]").datepicker({
        changeMonth: true,
        changeYear: true
    });
    $('#schedule').dataTable();
    //for datatable search 
    $('input[type=search]').addClass("form-control");
    //for number of rows selector
    $('select').addClass("form-control");
</script>