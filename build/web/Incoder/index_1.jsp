<!DOCTYPE html>

<%@include file="../common/imports.jsp" %>
<body>

    <!--      include navigation bar start-->

    <div class="container-fluid"  style="margin-top: 5px">
        <%@include file="../common/header.jsp" %>
    </div>
    <!--      include navigation bar end-->
    <!--      container wrapper starts-->
    <div class="span12" style="margin-top: -20px"> 


        <!--      include side bar start-->
        <div class="span12">
            <div class="col-lg-2 col-md-6" id="sidebar" style="border-radius: 10px">
                <%@include file="../common/sidebar.jsp" %>
            </div>
            <!--      include side bar end-->

            <!--      main content starts-->
            <div class="col-lg-10">
                <div class="col-lg-12" >

                    <div class="row">
                        <div class="col-lg-12">


                            <h4 class="page-header text-capitalize text-primary"><i class="fa fa-laptop"></i> federal police university college Data encoders application interface </h4>


                            <div class="pull-right">


                            </div>
                            <ol class="breadcrumb">
                                <li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
                                <li>Dashboard</li>						  	
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-info text-center" style="border-radius: 10px;">
                                <span class="fa fa-graduation-cap fa-4x" ></span>
                                <div class="count fa fa-2x">6740 </div>
                                <div class="text-capitalize text-center"><strong> students  Learning </strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-info text-center" style="border-radius: 10px;">
                                <span class="fa fa-graduation-cap fa-4x" ></span>
                                <div class="count fa fa-2x">674 </div>
                                <div class="text-capitalize text-center"><strong> Teachers  teaching </strong> </div>					
                            </div><!--/.info-box-->			
                        </div><!--/.col-->



                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-success text-center" style="border-radius: 10px;">
                                <span class="fa fa-university fa-4x" ></span>
                                <div class="count fa fa-2x">674 </div>
                                <div class="text-capitalize text-center"><strong> schools   </strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->

                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="info-box bg-danger text-center" style="border-radius: 10px;">
                                <span class="fa fa-book fa-4x" ></span>
                                <div class="count fa fa-2x">100+ </div>
                                <div class="text-capitalize text-center"><strong> courses   </strong> </div>						
                            </div><!--/.info-box-->			
                        </div><!--/.col-->

                    </div>
                    <div class="row">
                        <p class="page-header"></p>
                        <div class="col-lg-12 " style="margin-top: 10px">
                            <!--/.Latest updates starts here-->	
                            <div class="col-lg-9">





                                <!-- Table -->
                                <table class="table table-bordered table-striped" >
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                            <!--/.latest updates end-->	
                            <!--/.quick info right side bar starts-->	
                            <div class="col-lg-3">

<!--                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        
                                          <a href="#" class="list-group-item active">
                                        Quick Links
                                    </a>
                                    </div>
                                    <div class="panel-body">
                                     
                             
                                  
                                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                    <a href="#" class="list-group-item">Morbi leo risus</a>
                                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                             
                                    </div>
                                </div>-->
<div class="pull-right">
    <strong><p class="page-header">View events in Calendar</p></strong>
<div id="datepicker" class="pull-right text-info">

  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
        changeMonth:true,
        changeYear:true,
        inline:true
    });
 
  } );
  </script>
</div>      </div>                  

                        </div>
                    </div>





                </div>

            </div>

        </div>
        </div>  <!--      main content ends-->
        <div class="container" style="border-radius: 10px">
            <footer class="  col-lg-12 " >

                <p class=" text-center page-header bg-info">This is footer page &COPY; 2017</p>

            </footer>

        </div>
</body>



</html>
