<%-- 
    Document   : InstructorProfile
    Created on : 06-Mar-2017, 09:53:50
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
<!--                    <p class="text-right"> <a href="InstructorDetail.jsp" ><span style="color: #0055b3">View Profile|</span></a><a href="InstructorDetail.jsp"><span style="color: #0055b3">Logout</span></a></p>
                    <div class="col-lg-3 bg-primary"> STAFF NAME</div>
                    <div class="col-lg-2 bg-primary"> ROOM</div>
                    <div class="col-lg-2 bg-primary">  PHONE</div>
                    <div class="col-lg-2 bg-primary"> E-MAIL</div>
                    <div class="col-lg-3 bg-primary"> REMARK</div>

                    <div class="col-lg-3 "><input class=""></div>
                    <div class="col-lg-2 "><input class=""></div>
                    <div class="col-lg-2 "><input class=""></div>
                    <div class="col-lg-2 "><input class=""></div>
                    <div class="col-lg-3 "><input class=""></div>-->

                   
                    <table class="table table-hover table-bordered table-responsive">
                        <caption>Academic Profile</caption>
                        <thead>
                            <tr>
                                <th>STAFF NAME</th>
                                <th>ROOM</th>
                                <th>PHONE</th>
                                <th >E-MAIL</th>
                                <th>REMARK</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="appearance: hyperlink"><a href="InstructorDetail.jsp" >Dr.Lizi</a></td>
                                <td>Bangalore</td>
                                <td>560001</td>
                                <td>560001</td>
                                <td >560001</td>
                                
                            </tr>
                            <tr>
                                <td><a href="InstructorDetail.jsp" >Dr.kooper</a></td>
                                <td>Mumbai</td>
                                <td>400003</td>
                                <td>400003</td>
                                <td>400003</td>
                            </tr>
                            <tr>
                                <td><a href="InstructorDetail.jsp" >Mr.kean</a></td>
                                <td>Pune</td>
                                <td>411027</td>
                                <td>400003</td>
                                <td>400003</td>
                            </tr>
                            
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>