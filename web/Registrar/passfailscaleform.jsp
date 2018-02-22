
<%
if(session.getAttribute("registrar")==null)
{
response.sendRedirect("../index.jsp");
        }else
{
%>




<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.UserManagement"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.connectionManager"%>
<div class="col-lg-12">
    
   <pre> update Pass/fail scale of each programs </pre>
 
        <div class="form-group">
            <form class="form-group" action="${pageContext.request.contextPath}/AddScale" method="post">
                  <div class="form-group col-sm-6">
                            <label for="Department"> Select department </label>
                            <select name="department" id="department"  class="form-control" onchange="showprogram(this.value)" >
                                <option value="">select department</option>

                                <%
                                    connectionManager con_manager=new connectionManager();
                                    Connection connection = con_manager.getconnection();
                                    Statement getdept = connection.createStatement();

                                    String dep_name = null, depid = null;
                                    ResultSet rs_dept = getdept.executeQuery("select * from TBL_DEPARTMENT");

                                    while (rs_dept.next()) {
                                        dep_name = rs_dept.getString("DEP_NAME");
                                        depid = rs_dept.getString("DEP_ID");
                                %>
                                <option value="<%=depid%>"><%=dep_name%></option>
                                <%
                                    }
                       

%>

                            </select>                          
                        </div>
                 <div class="form-group col-sm-4">
                            <label>Specify program</label>
                            <select name="program" id="program" class="form-control">
                                <option value="">select program</option> 
                            </select>
                        </div>
                  <div class="form-group col-lg-6">
                      <label>Expected minimum GPA</label>  
                      <input type="number" step="0.001" min="1" max="4" class="form-control" name="mingpa"/>
                  </div>
        <div class="form-group col-lg-6">
            <%
            String Logged_user=session.getAttribute("registrar").toString();
                           UserManagement usermanagement=new UserManagement();
                             String insertedby=usermanagement.get_looged_Satff_ID(Logged_user);
                           //
                       java.util.Date today=new java.util.Date();
                        SimpleDateFormat date_format=new SimpleDateFormat("yyyy-mm-dd");
                        String currentdate=date_format.format(today);
            %>
            <input type="hidden" name="insertedby" value="<%=insertedby%>"> 
               <input type="hidden" name="insertedat" value="<%=currentdate%>">  
            <br>
            <button type="submit"  class="btn btn-primary"> <span class="fa fa-2x fa-save"></span> save Scale </button>
        </div> 
            </form>
        </div>
   
</div>
<div class="col-lg-12">
    <div class="col-lg-6">
    <div class="panel panel-success">
        <div class="panel-heading">Registered scales</div>
        <div class="panel-body">
            <table class="table table-condensed">
        <thead>
        <th>#</th>
        <th>program ID</th>
        <th>program name</th>
        <th>expected minimum GPA </th>
        </thead>
        <tbody>
            
        </tbody>
    </table>
        </div>
    </div>
    </div>
    
</div>
        <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../resources/js/getprogram.js" type="text/javascript"></script>
        <%
        }
        %>