<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<!--/form ban user--> 
<div class="col-lg-12">
    <div class="panel panel-default">
        <div class="panel-heading">Ban account</div>
        <div class="panel-body">
            <form action="" class="form-inline">
                <label>Enter user ID</label>
                <div class="form-group">
                    <input type="text" name="userid" class="form-control" placeholder="Enter user id to ban">
                </div>
                 <div class="form-group">
                     <textarea type="text" name="userid" class="form-control" col="9" placeholder="Enter reason"></textarea>
                </div>
                <div class="form-group">
                    <input type="submit"  class="btn btn-info" value="Block user">
                </div>
            </form>
        </div>

    </div>
</div>

<div class="form-group">
      
    <%
        if(request.getParameter("userid")!=null)
        {
          %>
          <h5 class="text-uppercase text-center text-info ">  <strong> List of user accounts with  ID <%=request.getParameter("userid")%></strong></h5> 
             <table class="table table-bordered table-condensed">
                 <thead>
                 <th class="active">#</th>
                   <th class="active">Staff ID</th>
                 <th class="active">User name</th>
                           <th class="active">Account type</th>
                              <th class="active">Action</th>
                 </thead>
                 <tbody>
          <%
        connectionManager dbconnection=new connectionManager();
        Statement statement=dbconnection.getconnection().createStatement();
        ResultSet rsban=statement.executeQuery("select * from TBL_users where Academic_Staff_id='"+request.getParameter("userid")+"'");
        int numbering=1;
        while(rsban.next())
        {
          String username=rsban.getString("user_id");
         // out.println(username);
          
        %>
        <tr>
            <td><%=numbering%></td>
              <td><%=rsban.getString("academic_staff_id")%></td>
             <td><%=rsban.getString("user_id")%></td>
              <td><%=rsban.getString("role_id")%></td>
             
            <td>
        <form class="">
            <input type="hidden" name="userid" />
            <button class="btn btn-danger">Ban this account</button>
             </form>
            </td>
             </tr> 
        <%
                numbering++;  
                }
%>
             </tbody>
             </table>

<%
        }
    %>
</div>






<div class="table col-lg-12">
    <table class="table table-bordered">
        <thead>
        <th class="active">#</th>
        <th class="active">User name</th>
        <th class="active">close Date</th>
        <th class="active">Reason</th>
        <th class="active">Action</th>
        </thead>
        <tbody>

        </tbody>

    </table>
</div>