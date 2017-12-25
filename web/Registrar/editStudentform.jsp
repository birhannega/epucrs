
    <%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<form class="form-group" method="post" class="pull-right">
    <div class="form-group col-lg-4 ">
        Student ID
        <input type="text" class="form-control" name="edit_student_id" placeholder="Enter student id" />
    </div>
    <div class="form-group col-lg-6">
        <br>
        <button type="submit" class="btn btn-primary">Get current profile</button></div>
</form>


<%
if(request.getParameter("edit_student_id")!=null){
   String student_id=request.getParameter("edit_student_id");
   connectionManager dbcon=new connectionManager();
   Connection con=dbcon.getconnection();
   Statement stat_edit=con.createStatement();
   ResultSet rs_edit=stat_edit.executeQuery("select * from TBL_STUDENT_PROFILE where Stud_id='"+student_id+"'");
   if(rs_edit.next())
   {
   

%>
<div class="col-lg-10">
    <div class="alert alert-success alert-dismissible">
        
        <strong>Editing profile of <%=rs_edit.getString(2)+" "+rs_edit.getString(3)+ " "+rs_edit.getString(4)%></strong>
    </div>
    <form class="form-group" action="" method="">
        <div class="form-group col-lg-4">
            student ID
            <input type="text" value="<%=rs_edit.getString(1) %>" name="edited_firstname" class="form-control" readonly="readonly"/>
        </div>
        <div class="form-group col-lg-4">
            student firstname
            <input type="text" value="<%=rs_edit.getString("stud_first_name") %>" name="edited_firstname" class="form-control"/>
        </div>
    </form>
    
</div>
<%
}else
{
%>
<div class="col-lg-12">
    <div class="alert alert-danger alert-dismissible"><strong>No student with this id</strong></div>
</div>

<%}
}
%>