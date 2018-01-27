
<%@page import="java.sql.Connection"%>
<script src="../assets/jquery-ui/js/responsive.jqueryui.min.js" type="text/javascript"></script>
<!--<script src="../assets/jquery-ui/js/jquery.dataTables.min.js" type="text/javascript"></script>-->
<script src="../assets/jquery-ui/js/jquery-1.12.4.js" type="text/javascript"></script>
<!--<link href="../assets/jquery-ui/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css"/>-->
<script src="../assets/jquery-ui/js/dataTables.responsive.min.js" type="text/javascript"></script>
<!--<script src="../assets/jquery-ui/js/dataTables.jqueryui.min.js" type="text/javascript"></script>-->
<!--<link href="../assets/jquery-ui/css/responsive.jqueryui.min.css" rel="stylesheet" type="text/css"/>-->

<link href="../resources/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
<link href="../resources/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>

<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>


<table id="report" class="table table-responsive display" width="100%" cellspacing="0">
    <thead>
    <th>Program Name</th>
    <th>Course_Code</th>
    <!--<th>Term </th>-->
    <!--<th>Total</th>-->
</thead>
<%
    String depname = request.getParameter("crs_approach");
    try {
        connectionManager con = new connectionManager();
        Connection connection = con.getconnection();
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT  * FROM TBL_COURSE_REGISTRATION WHERE   COURSE_APPROACH='" + depname + "'");
        while (rs.next()) {
//          ResultSet  _rs= stmt.executeQuery("SELECT  count() FROM TBL_COURSE_REGISTRATION WHERE   DEP_ID='"+depname+"'" );

            String di = rs.getString("DEP_ID");
            String cc = rs.getString("COURSE_CODE");
//            String term = rs.getString("TERM");
//       String total=rs.getString("total");
%>
<tbody><tr>
        <td><%=di%></td>
        <td><%=cc%></td>

    </tr></tbody>
    <%  }

    %>


<%            out.println("</tbody></table>");
    } catch (Exception e) {
        System.out.println(e);
    }

%>

</table>
<form>
    <button id="printpagebutton" type="button" class="btn btn-primary pull-right "
            onclick="window.print()">
        <span class="glyphicon glyphicon-print"> <strong>Print Report</strong>
        </span>
    </button>
</form>

<script type="text/javascript">
    $(document).ready(function () {
        $("report").DataTable();
    });
</script>
<!--<script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>-->

<script src="../resources/js/jquery-1.12.4.js" type="text/javascript"></script>
<script src="../resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../resources/js/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="../resources/js/buttons.print.min.js" type="text/javascript"></script>

<script type="text/javascript" >
    function printpage() {
        $(document).ready(function () {
            $('#report').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'print'
                ]
            });
        });
//        //Get the print button and put it into a variable
//        var printButton = document.getElementById("printpagebutton");
//        //Set the print button visibility to 'hidden' 
//         printButton.style.visibility = 'hidden';
//        //Print the page content
//        window.print()
//        //Set the print button to 'visible' again 
//        //[Delete this line if you want it to stay hidden after printing]
//        printButton.style.visibility = 'visible';
    }


</script>