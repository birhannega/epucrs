<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <title>students page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>

             <link href="../resources/css/sidebarcss.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>

    </head>
    <body>
        <%@include file="../common/head_banner.jsp" %>
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <!-- <div class="absolute-wrapper"> </div> -->
            <!-- Menu -->
            <div class="side-menu">

                <%@include file="studentsidemenu.jsp" %>

            </div>

            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <h3 class="page-header">Issue complain  </h3>
<!--                    <pre> Registrar system/Student interface</pre>-->
                    <p>Before issuing complain please make sure that you have the full definition of your issue..</p>
                    <div class="form-group">
                        <form class="form-group" action="" method="post">
                            <div class="col-lg-4">
                            <label> Select issue type</label>
                            <select class="form-control" name="problem">
                                  <option>Regrade</option>
                            </select>
                            
                            </div>
                             <div class="col-lg-4">
                                 <%
                            java.util.Date issuedate=new java.util.Date();
                            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
                            String today=sdf.format(issuedate);
                            
                            %>
                            <label> Select issue type</label>
                            <input class="form-control"  value="<%=today%>"  name="dateissued" value="date issued" readonly="">
                 
                            </div>
                            
                             <div class="col-lg-4">
                            <label>Issued by Student</label>
                            
                            <input class="form-control"  value=""  name="dateissued" value="date issued" readonly=""/>
                            </div>
                            
                             <div class="col-lg-12">
                            <label>Description of issue</label>
                            <textarea class="form-control"  value=""  name="dateissued" value="date issued"></textarea>
                            </div>
                            
                            <div class="col-lg-4">
                                <br>
                                
                                <input type="submit" value="submit complain" class="btn btn-primary" />
                            </div>
                            
                        </form>
                    </div>
                    <div class="col-lg-12">
                        <h4 class="text-primary">Your previous issues</h4>
                    <table class="table table-bordered table-inverse">
                        <thead>
                        <th>Issue No.</th>
                         <th>Issue</th>
                          <th>Issue Date </th>
                          <th>response given </th>
                            <th>issue Status  </th>
                        </thead>
                        <tbody>
                            <tr>
                               
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('.navbar-toggle').click(function () {
                    $('.navbar-nav').toggleClass('slide-in');
                    $('.side-body').toggleClass('body-slide-in');
                    $('#search').removeClass('in').addClass('collapse').slideUp(200);

                    /// uncomment code for absolute positioning tweek see top comment in css
                    //$('.absolute-wrapper').toggleClass('slide-in');

                });

                // Remove menu for searching
                $('#search-trigger').click(function () {
                    $('.navbar-nav').removeClass('slide-in');
                    $('.side-body').removeClass('body-slide-in');

                    /// uncomment code for absolute positioning tweek see top comment in css
                    //$('.absolute-wrapper').removeClass('slide-in');

                });
            });
        </script>
    </body>
</html>
