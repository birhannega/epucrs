
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%
    connectionManager manager = new connectionManager();
    Connection connection = manager.getconnection();
    Statement statement = connection.createStatement();
    ResultSet rs_roles = statement.executeQuery("select * from TBL_ROLES");

%>

<pre>Add user</pre>
<div class="form-group">
    
    ${msg}
    <form class="form-group" method="post" action="${pageContext.request.contextPath}/adduser">
        <div class="form-group col-lg-4">
            <label>Choose role</label>
            <select class="form-control" name="role">
            <%             
                while (rs_roles.next()) {
                    String roleid=rs_roles.getString("role_id");
                    String rolname=rs_roles.getString("role_name");
                   %>  
                   <option value="<%=roleid%>"> <%=rolname%></option>
                    <%
                }
            %>  
            </select>
        </div>
        <div class="form-group col-lg-4">
            <label>   Choose user ID</label>
            <%
            ResultSet rs_staff=statement.executeQuery("select * from TBL_ACADEMIC_STAFF_REG ");
            %>
            <select class="form-control" name="userid">
             <%
             while(rs_staff.next())
             {
             String staffid=rs_staff.getString(1);
             String stafftitle=rs_staff.getString(2);
               String fullname=rs_staff.getString("FIRST_NAME")+" "+rs_staff.getString("MIDDLE_NAME")+" "+rs_staff.getString("LAST_NAME");
             %>
             <option value="<%=staffid%>"><%=fullname%></option>
            <%
            }
            %>
            </select>
        </div>
            <div class="form-group col-lg-4">
                <label>Enter user name</label>
                <input type="text" class="form-control" name="username" required="required" />
            </div>
             <div class="form-group col-lg-4">
                <label>Enter password</label>
                <input type="password" class="form-control" name="password" required="required" />
            </div>
              <div class="form-group col-lg-4">
                <label>Re-Enter password</label>
                <input type="password" class="form-control" name="cpassword" required="required" />
            </div>
              <div class="form-group col-lg-4">
                  
                  <br>
                  <button type="submit" class="btn btn-primary" >Create Account</button>
            </div>
        
    </form>
</div>
            <div class="col-lg-12">
                <h4>  Accounts created so far </h4>
                <table class="table table-bordered">
                    <thead>
                    <th>#</th>
                    <th>Role type</th>
                    <th>No. of Accounts</th>
                    </thead>
                    <tbody>
                        <tr>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            
            
<script type="text/javascript">
    $("#btnadduser").click(function () {
        alert("heu");
    });
    function adduser()
    {

    }

</script>
            <%
            session.setAttribute("msg", null);
            %>