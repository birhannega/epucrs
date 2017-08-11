<%-- 
    Document   : InstructorDetail
    Created on : 06-Mar-2017, 11:10:36
    Author     : Efrem
--%>

<link rel="stylesheet" href="../css/jQuery.steps.css"
      <%@include file="../common/imports.jsp" %>
      <body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/department_nav.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/department_sidebar.jsp" %>
            </div>
            <div class="col-lg-10">
                <div class="col-lg-12">
                    <p class="text-primary page-header text-center"><strong>View Academic Profile</strong></p>


                    <p class="text-success text-right"><strong>Welcome user:_________________</strong></p>
                    <p class="text-right"> <a href="View Profile.jsp" ><span style="color: #0055b3">View Profile|</span></a><a href="View Profile.jsp"><span style="color: #0055b3">Logout</span></a></p>

                    <div class="col-lg-12" style="align-content: center">Dr.kooper</div>
                    <div class="col-lg-6"><img src="../images/kooper.JPG" class="img-thumbnail"></div>

                    <div class="col-lg-4">
                        <table class="table table-striped">
                           <!-- <caption style="align-content: center">Profile</caption>-->
                            
                            <tbody>
                                <tr>
                                    <th>Name</th>
                                     <td>kooper</td>
                                </tr>
                                <tr>
                                    <th>Phone no</th>
                                     <td>09111111</td>
                                </tr>
                                <tr>
                                    <th>E-mail</th>
                                     <td>kooper@gmail.com</td>
                                </tr>
                                <tr>
                                    <th>Room</th>
                                     <td>12</td>
                                </tr>
                           
                            </tbody>
                        </table></div>

                </div>
            </div>
        </div>
    </div>
