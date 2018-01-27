

<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.StudentManagement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.connectionManager"%>
<script src="../resources/js/chart.bundle.js" type="text/javascript"></script>
<script src="../resources/js/utils.js" type="text/javascript"></script>

<style>
    #canvas-holder {
        width: 100%;
        margin-top: 50px;
        text-align: center;
    }
    #chartjs-tooltip {
        opacity: 1;
        position: absolute;
        background: rgba(0, 0, 0, .7);
        color: white;
        border-radius: 3px;
        -webkit-transition: all .1s ease;
        transition: all .1s ease;
        pointer-events: none;
        -webkit-transform: translate(-50%, 0);
        transform: translate(-50%, 0);
    }

    .chartjs-tooltip-key {
        display: inline-block;
        width: 10px;
        height: 10px;
        margin-right: 10px;
    }
</style>


<div class="row">
    <pre>Graphical representation of some statistics</pre>
    <div id="canvas-holder" style="width: 300px;margin-top: 2px" class="col-lg-5">

        <canvas id="chart-area" width="250" height="250" ></canvas>
        <div id="chartjs-tooltip">
            <table></table>
        </div>
    </div>
    <%
        connectionManager dbc_conunter = new connectionManager();
        Statement st_count = dbc_conunter.getconnection().createStatement();
        String sqlCountStud = "Select count(Stud_id) from TBL_student_profile";
        ResultSet rs_counter;
        int no_students = 0,
                no_departments = 0,
                no_courses = 0,
                no_teachers = 0,
                no_programs = 0;
        // get total number of students 
        rs_counter = st_count.executeQuery(sqlCountStud);
        if (rs_counter.next()) {
            no_students = Integer.valueOf(rs_counter.getString(1));
        }
        //Get total active departments
        String sqlCountdep = "Select count(dep_id) from TBL_department";
        rs_counter = st_count.executeQuery(sqlCountdep);
        if (rs_counter.next()) {
            no_departments = Integer.valueOf(rs_counter.getString(1));
        }
        //get total programs
        String sqlCountProgram = "Select count(program_id) from TBL_Academic_program";
        rs_counter = st_count.executeQuery(sqlCountProgram);
        if (rs_counter.next()) {
            no_programs = Integer.valueOf(rs_counter.getString(1));
        }
        // Get count of instructors and staff members
        String sqlCountstaff = "Select count(Academic_staff_id) from TBL_Academic_staff_reg";
        rs_counter = st_count.executeQuery(sqlCountstaff);
        if (rs_counter.next()) {
            no_teachers = Integer.valueOf(rs_counter.getString(1));
        }
        // Get count of courses and staff members
        String sqlCountcourses = "Select count(course_code) from TBL_course_registration";
        rs_counter = st_count.executeQuery(sqlCountcourses);
        if (rs_counter.next()) {
            no_courses = Integer.valueOf(rs_counter.getString(1));
        }

    %>
    <script type="text/javascript">

        Chart.defaults.global.tooltips.custom = function (tooltip) {
            // Tooltip Element
            var tooltipEl = document.getElementById('chartjs-tooltip');

            // Hide if no tooltip
            if (tooltip.opacity === 0) {
                tooltipEl.style.opacity = 0;
                return;
            }

            // Set caret Position
            tooltipEl.classList.remove('above', 'below', 'no-transform');
            if (tooltip.yAlign) {
                tooltipEl.classList.add(tooltip.yAlign);
            } else {
                tooltipEl.classList.add('no-transform');
            }

            function getBody(bodyItem) {
                return bodyItem.lines;
            }

            // Set Text
            if (tooltip.body) {
                var titleLines = tooltip.title || [];
                var bodyLines = tooltip.body.map(getBody);

                var innerHtml = '<thead>';

                titleLines.forEach(function (title) {
                    innerHtml += '<tr><th>' + title + '</th></tr>';
                });
                innerHtml += '</thead><tbody>';

                bodyLines.forEach(function (body, i) {
                    var colors = tooltip.labelColors[i];
                    var style = 'background:' + colors.backgroundColor;
                    style += '; border-color:' + colors.borderColor;
                    style += '; border-width: 2px';
                    var span = '<span class="chartjs-tooltip-key" style="' + style + '"></span>';
                    innerHtml += '<tr><td>' + span + body + '</td></tr>';
                });
                innerHtml += '</tbody>';

                var tableRoot = tooltipEl.querySelector('table');
                tableRoot.innerHTML = innerHtml;
            }

            var positionY = this._chart.canvas.offsetTop;
            var positionX = this._chart.canvas.offsetLeft;

            // Display, position, and set styles for font
            tooltipEl.style.opacity = 1;
            tooltipEl.style.left = positionX + tooltip.caretX + 'px';
            tooltipEl.style.top = positionY + tooltip.caretY + 'px';
            tooltipEl.style.fontFamily = tooltip._fontFamily;
            tooltipEl.style.fontSize = tooltip.fontSize;
            tooltipEl.style.fontStyle = tooltip._fontStyle;
            tooltipEl.style.padding = tooltip.yPadding + 'px ' + tooltip.xPadding + 'px';
        };

        var config = {
            type: 'pie',
            showInLegend: true,
            data: {
                datasets: [{
                        data: ['<%=no_students%>', '<%=no_programs%>', '<%=no_teachers%>', '<%=no_departments%>', '<%=no_courses%>'],
                        backgroundColor: [
                            window.chartColors.red,
                            window.chartColors.orange,
                            window.chartColors.yellow,
                            window.chartColors.green,
                            window.chartColors.blue
                        ]
                    }],
                labels: [
                    "Students",
                    "Programs",
                    "Teachers",
                    "Departments",
                    "Courses"
                ]
            },
            options: {
                responsive: true,
                legend: {
                    display: false
                },
                tooltips: {
                    enabled: false
                }
            }
        };

        window.onload = function () {
            var ctx = document.getElementById("chart-area").getContext("2d");
            window.myPie = new Chart(ctx, config);
        };
    </script>
    <div class="col-lg-7 pull-right">
        <table class="table table-responsive table-bordered">
            <thead>
            <th class="active">#</th>
            <th class="active">Description
            </th>
            <th class="active">count</th>


            </thead>
            <tbody>
                <tr>
                    <td class="active">1</td>
                    <td>Number of students</td>
                    <td><%=no_students%></td>
                </tr>
                <tr>
                    <td class="active">2</td>
                    <td>Number of staff members</td>
                    <td><%=no_teachers%></td>
                </tr>
                <tr>
                    <td class="active">3</td>
                    <td>Number of departments</td>
                    <td><%=no_departments%></td>
                </tr>
                <tr>
                    <td class="active">4</td>
                    <td>Number of programs</td>
                    <td><%=no_programs%></td>
                </tr>
                <tr>
                    <td class="active">5</td>
                    <td>Number of Courses</td>
                    <td><%=no_courses%></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="col-lg-12">
    <h4 class="page-header text-info">Table showing number of students of Each Department</h4>
    <table class="table table-striped table-bordered" id="report">
       
        <thead>
            <tr>
                <th>#</th>
                <th >Department</th>
                <th>No of Active students</th>
            </tr>
        </thead>
        <tbody>
            <%
                connectionManager conmanager = new connectionManager();
                String List_department_query = "Select * from TBL_DEPARTMENT ";
                StudentManagement stud_count = new StudentManagement();
                ResultSet st_list_department = conmanager.getconnection().createStatement().executeQuery(List_department_query);
                String department_id,
                        department_name;
                int counter = 1, number_of_students = 0;
                while (st_list_department.next()) {
                    department_name = st_list_department.getString("dep_name");
                    department_id = st_list_department.getString("dep_id");

//                  number_of_students=stud_count.getTotalStudents(department_id);
//                 out.print(counter+" "+department_id+"="+number_of_students);
                    String sql = "Select count(stud_id) from TBL_STUDENT_profile where DEP_ID=?";
                    PreparedStatement ps_counter = conmanager.getconnection().prepareStatement(sql);
                    ps_counter.setString(1, department_id);
                    ResultSet rscont = ps_counter.executeQuery();
                    if (rscont.next()) {
                        number_of_students = Integer.valueOf(rscont.getString(1));
                    } else {
                        number_of_students = 0;
                    }

            %>
            <tr>
                <td class="text-info"><strong><%=counter%> </strong> </td>
                <td class="text-info"> <strong> <%=department_name%> </strong> </td>
                <td ><%=number_of_students%></td>

            </tr>
            <%
                    counter++;
                }
            %>
        </tbody>
    </table>
  
</div>

