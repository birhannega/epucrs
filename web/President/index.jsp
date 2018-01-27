


<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.StudentManagement"%>
<%@page import="java.sql.ResultSet"%>
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
       

      <!--<link href="bootstrap.min.css" rel="stylesheet">-->
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
       <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
  </head>

  <body>
       <%@include file="../common/head_banner.jsp" %>
      
       <nav class="navbar navbar-expand-md  fixed-top bg-light" style="margin-top: -20px">
           <a class="navbar-brand" href="index.jsp">EPUCRS<span class="badge">President</span>
           </a>
   

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
              <a class="nav-link" href="report.jsp"> <strong>Reports </strong> <span class="sr-only">(current)</span></a>
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
              <a class="nav-link" href="reports.jsp">Reports</a>
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
          <h4>President Dashboard</h4>

          <section class="row text-center placeholders">
            <div class="col-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" 
                   width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
              <h5>Regular Generic degree program</h5>
              <div class="text-muted">10 students </div>
            </div>
            <div class="col-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIADDADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
              <h5>Advanced Degree program</h5>
              <span class="text-muted">700 students</span>
            </div>
            <div class="col-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
              <h4>Police Medical Training</h4>
              <span class="text-muted">4 students  </span>
            </div>
            <div class="col-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIABBADcgwAAACwAAAAAAQABAAACAkQBADa=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
              <h4>Regular diploma</h4>
              <span class="text-muted">23 students</span>
            </div>
          </section>

          <h2>Departments of Epuc</h2>
          <div class="table-responsive">
              <table class="table table-striped" id="report">
                  
              <thead>
                <tr>
                  <th>#</th>
                  <th>Department</th>
                
                  <th>No of Active students</th>
               
                </tr>
              </thead>
              <tbody>
                <%
                connectionManager conmanager=new connectionManager();
                String List_department_query="Select * from TBL_DEPARTMENT ";
                  StudentManagement stud_count=new StudentManagement();
                ResultSet st_list_department=conmanager.getconnection().createStatement().executeQuery(List_department_query);
                String department_id,
                        department_name
                        ;
                int counter=1,number_of_students=0;
                while(st_list_department.next())
                {
                 department_name=st_list_department.getString("dep_name");
                 department_id=st_list_department.getString("dep_id");
                 
//                  number_of_students=stud_count.getTotalStudents(department_id);
//                 out.print(counter+" "+department_id+"="+number_of_students);
              String sql = "Select count(stud_id) from TBL_STUDENT_profile where DEP_ID=?";
            PreparedStatement ps_counter = conmanager.getconnection().prepareStatement(sql);
            ps_counter.setString(1, department_id);
            ResultSet rscont = ps_counter.executeQuery();
               if(rscont.next())
               {
                   number_of_students=Integer.valueOf(rscont.getString(1));
               }else{
                   number_of_students=0;
               }
                
                %>
                <tr>
                <td><%=counter%></td>
                  <td><%=department_name%></td>
                  <td><%=number_of_students%></td>
                  
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
    <script src="../resources/DataTable/js/jquery.dataTables.js" type="text/javascript"></script>
    <script type="text/javascript">
     
       $(document).ready(function() {
    $('#report').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'print'
        ]
    } );
} );
        
        $('input[type=search]').addClass("form-control");
        
    </script>
  </body>
</html>
