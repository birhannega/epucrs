


<%@page import="Model.StudentInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Epuc-president</title>

    <!-- Bootstrap core CSS -->
  <link href="bootstrap.css" rel="stylesheet">
 
  <link href="../resources/DataTables-1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
      <!--<link href="bootstrap.min.css" rel="stylesheet">-->
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
     
  </head>

  <body>
     
      <div class="panel panel-primary" style="margin-top: -30px">
          <div class="panel-heading"><h2 class="text-center text-capitalize ">Ethiopian Police university college </h2></div>
      </div>
  
       <nav class="navbar navbar-expand-md  fixed-top bg-light" style="margin-top: -20px">
      <a class="navbar-brand" href="index.jsp">EPUCRS/President </a>
   

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
              <a class="nav-link" href="#"> <strong>Reports </strong> <span class="sr-only">(current)</span></a>
          </li>
         
          <li class="nav-item">
              <a class="nav-link" href="#"> <strong> Analytics </strong></a>
          </li>
           <li class="nav-item">
               <a class="nav-link" href="#"> <strong> Directorate </strong></a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="#"> <strong> Logout </strong> </a>
          </li>
        </ul>
        
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="#">Overview <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Reports</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Analytics</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Export</a>
            </li>
          </ul>

          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="#"> Student related reports</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Graduated students</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Students by Batch entry</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Students by Gender</a>
            </li>
            
          </ul>

          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="#">Instructors related reports</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Instructor by department</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Instructor by course load</a>
            </li>
          </ul>
        </nav>

        <main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">
          <div class="col-lg-12">
          <table class="table table-responsive  table-bordered table-condensed table-light" id="studreport">
              <thead>
              <th>Stud ID</th>
               <th>Full name</th>
                 <th>Department</th>
                   <th>Program</th>
              </thead>
              <tbody>
                  
          <%
          connectionManager connectionmgr=new connectionManager();
          Statement st_report=connectionmgr.getconnection().createStatement();
          String report_sql="select * from tbl_Student_profile";
          ResultSet rs_report=st_report.executeQuery(report_sql);
            String stud_id=null;
             StudentInfo info = new StudentInfo();
             String full_name=null,department=null,program;
          while(rs_report.next())
          {
               stud_id=rs_report.getString("stud_id");
               
               full_name=info.getfullname(stud_id);
               department=info.getDepartment(stud_id);
               //program=info.getProgram(stud_id);
               
          out.print("<tr>");
          out.print("<td>"+rs_report.getString("stud_id")+"</td>");
           out.print("<td>"+full_name+"</td>");
              out.print("<td>"+department+"</td>");
              // out.print("<td>"+program+"</td>");
          out.print("</tr>");
          }
          %>
          </tbody>
          </table>
          </div>
          <div class="col-lg-12">
              <h4 class="page-header text-capitalize text-primary">Departments and their respective programs</h4>
            
              <table class=" table-condensed table-bordered  table-light table-striped" id="departments">
                      <thead>
                            <th> # </th>
                      <th>Department</th>
                       <th>Programs</th>
                      </thead>
                      <tbody>
                          <%
                         Statement list_depts=connectionmgr.getconnection().createStatement();
                         String deptsql="select * from TBL_Department";
                         ResultSet rs_depts=list_depts.executeQuery(deptsql);
                         int counter=1;
                         while(rs_depts.next())
                         {
                             String depid=rs_depts.getString("dep_id"),
                             departmentname=rs_depts.getString("dep_name");
                          %>
                          <tr>
                              <td> <%=counter%></td>
                               <td> <%=departmentname%></td>
                                <td> <%
                                    Statement st_list_programs=connectionmgr.getconnection().createStatement();
                                    String programsql="Select * from Tbl_academic_program where dep_id='"+depid+"'";
                                    ResultSet rs_programs=st_list_programs.executeQuery(programsql);
                                    while(rs_programs.next())
                                    {
                                        out.println("<ul><li>");
                                        out.println(rs_programs.getString("program_name"));
                                        out.println("</li></ul>");
                                    }
                                    
                                    
                                    %></td>
                          </tr>
                          <%
                              counter++;
                          }
                          %>
                      </tbody>
                  </table>
              
              
              
          </div>
        </main>
      </div>
    </div>
      
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   
    <script src="../resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../resources/DataTables/js/jquery.dataTables.js" type="text/javascript"></script>
    <script type="text/javascript">
     
        $("#studreport").dataTable();
        
        $("#departments").dataTable();
        $('input[type=search]').addClass("form-control");
      //  $('select').addClass("form-control");
        
    </script>
  </body>
</html>
