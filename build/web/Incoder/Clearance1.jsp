<!DOCTYPE html>
<link rel="stylesheet" href="../css/jQuery.steps.css"
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
            <div class="col-lg-2" id="sidebar">
                <%@include file="../common/sidebar.jsp" %>
            </div>
            <!--      include side bar end-->

            <!--      main content starts-->
            <div class="col-lg-10">
                <div class="col-lg-12" >

                    <div class="row">
                        <div class="col-lg-12">
                            <p class="text-primary page-header text-center"><strong>Student registration</strong></p>
                            <div class="pull-right">
                            </div>
                            <div id="example-async" class="pull-right">
				  <h3>Personal Info</h3>
                                <section >
                                    <p> first step</p>
                                </section>
                                <h3>Second Step</h3>
                                <section>
                                    <p>Donec mi sapien, hendrerit nec egestas a, rutrum vitae dolor. Nullam venenatis diam ac ligula elementum pellentesque. 
                                        In lobortis sollicitudin felis non eleifend. Morbi tristique tellus est, sed tempor elit. Morbi varius, nulla quis condimentum 
                                        .</p>
                                </section>
                              
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">

                </div>

            </div>
        </div>
    </div>

</div>  <!--      main content ends-->


<script>
    $("#example-async").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slide"
    });
</script>

<style>
    section
    {
        background: #ffffff;
    }
    </style>
</html>
