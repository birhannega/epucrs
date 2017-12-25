<!--<!DOCTYPE html>-->
<!--<html lang="en">-->
<!--<head>
<meta charset="UTF-8">
  <title>jQuery Add / Remove Table Rows</title>
  <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">


    <style type="text/css">

        table{

            width: 100%;

            margin: 20px 0;

            border-collapse: collapse;

        }

        table, th, td{

            border: 1px solid #cdcdcd;

        }

        table th, table td{

            padding: 5px;

            text-align: left;

        }

    </style>

   

    <script type="text/javascript">

        $(document).ready(function(){

            $(".add-row").click(function(){

                var name = $("#name").val();

                var email = $("#email").val();

                var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + name + "</td><td>" + email + "</td></tr>";

                $("table tbody").append(markup);

            });

            

            // Find and remove selected table rows

            $(".delete-row").click(function(){

                $("table tbody").find('input[name="record"]').each(function(){

                    if($(this).is(":checked")){

                        $(this).parents("tr").remove();

                    }

                });

            });

        });    

    </script>

    </head>

    <body>

        <form>

            <input type="text" id="name" placeholder="Name">

            <input type="text" id="email" placeholder="Email Address">

            <input type="button" class="add-row" value="Add Row">

        </form>

        <table>

            <thead>

                <tr>

                    <th>Select</th>

                    <th>Name</th>

                    <th>Email</th>

                </tr>

            </thead>

            <tbody>

                <tr>

                    <td><input type="checkbox" name="record"></td>

                    <td>Peter Parker</td>

                    <td>peterparker@mail.com</td>

                </tr>

            </tbody>

        </table>

        <button type="button" class="delete-row">Delete Row</button>

    </body> 

    </html>-->


<!DOCTYPE html>

<html lang="en">

    <head>

        <meta charset="UTF-8">

        <title>Keep Selected Bootstrap Tab Active on Page Refresh</title>

        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">

        <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap-theme.min.css">
        <script src="../resources/jquery/jquery-1.11.1.js" type="text/javascript"></script>
        <!--<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>-->
        <link href="../assets/jquery-ui/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/jquery-ui/js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function () {

                $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                    localStorage.setItem('activeTab', $(e.target).attr('href'));

                });

                var activeTab = localStorage.getItem('activeTab');

                if (activeTab) {

                    $('#myTab a[href="' + activeTab + '"]').tab('show');

                }

            });

        </script>
  <!--auto complate-->
         <script>
  $( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
    </head>

    <body>

        <ul class="nav nav-tabs" id="myTab">

            <li class="active"><a data-toggle="tab" href="#sectionA">Section A</a></li>

            <li><a data-toggle="tab" href="#sectionB">Section B</a></li>

            <li><a data-toggle="tab" href="#sectionC">Section C</a></li>

        </ul>

        <div class="tab-content">

            <div id="sectionA" class="tab-pane fade in active">

                <h3>Section A</h3>

                <p>Aliquip placeat salvia cillum iphone...</p>

            </div>

            <div id="sectionB" class="tab-pane fade">

                <h3>Section B</h3>

                <p>Vestibulum nec erat eu nulla rhoncus fringilla...</p>


            </div>

            <div id="sectionC" class="tab-pane fade">

                <h3>Section C</h3>

                <p>Nullam hendrerit justo non leo aliquet...</p>

            </div>

        </div>

        <!--daynamic-->
        <!-- start of the column with properties(form-control)-->
        <div class="col-lg-8" id="property-col">
            <div class="container">
                <form class="form">

                    <div class="row">
                        <h3>Dynamic Table</h3>
                        <br>
                    </div>

                    <div class="row" id="dynamic_form">
                        <div class="form-group form-horizontal">
                            <label>Primitives</label>
                            <div class="container">
                                <div class="form-inline" id="primitive_fields">
                                    <select class="input-small form-control" id="primitive-selector" name="PrimitiveChoose[]">
                                        <option value=" " disabled selected>primitive</option>
                                        <option value="sphere">sphere</option>
                                        <option value="triangle">triangle</option>
                                    </select>
                                    <input type="number" class="input-small form-control" id="diameter"  name="Diameter[]" step="any" placeholder="diameter(D)">
                                    <input type="text" class="input-small form-control"  id="sphere-position" name="SpherePosition[]"  placeholder="(x, y, z)">
                                    <select class="input-small form-control" id="circle-color-selector" name="CircColorSelect[]" >
                                        <option value=" " disabled selected>color</option>
                                        <option value="red">red</option>
                                        <option value="blue">blue</option>
                                        <option value="green">green</option>
                                        <option value="yellow">yellow</option>    
                                    </select> 
                                    <button type="button" class="btn btn-success btn-add" id="add_more"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="form-group col-lg-12" > 
                                    <button type="submit" id="tnsaveinst" class="btn btn-primary"><span class="fa fa-save"><strong>  Save info</strong></span></button>

                                </div>
            </div>
        </div>
<!--        
        
              <div class="row">
                <div class="form-group">
                  <fieldset class="form-inline">
                    <label class="control-label">Point Light Position:</label>
                    <input type="text" class="input-small form-control" id="light-position" placeholder="(x, y, z)" >
                  </fieldset>
                </div>
              </div>-->
        <script type="text/javascript">
            function getHTMLString() {
                var complex_html = [
                    '<div class="row" id="primitive-form">',
                    '<div class="form-group form-horizontal">',
                    '<div class="container">',
                    '<div class="form-inline" id="primitive_fields">',
                    '<select class="input-small form-control" id="primitive-selector" name="PrimitiveChoose[]">',
                    '<option value=" " disabled selected>primitive</option>',
                    '<option value="sphere">sphere</option>',
                    '<option value="triangle">triangle</option>',
                    '</select>',
                    '<input type="number" class="input-small form-control" id="diameter"  name="Diameter[]" step="any" placeholder="diameter(D)">',
                    '<input type="text" class="input-small form-control"  id="sphere-position" name="SpherePosition[]"  placeholder="(x, y, z)">',
                    '<select class="input-small form-control" id="circle-color-selector" name="CircColorSelect[]">',
                    '<option value=" " disabled selected>color</option>',
                    '<option value="red">red</option>',
                    '<option value="blue">blue</option>',
                    '<option value="green">green</option>',
                    '<option value="yellow">yellow</option>',
                    '</select>',
                    '<button type="button" class="btn btn-success btn-add" id="remove_more"> <span class="glyphicon glyphicon-minus" aria-hidden="false"></span></button>',
                    '</div>',
                    '</div>',
                    '</div>',
                    '</div>',
                ].join('');
                return complex_html;
            }
            $(document).ready(function () {
                var formCount = 0;
                $('#add_more').on('click', function (e) {
                    if (formCount < 4) {

                        var html = getHTMLString();
                        var element = $(html);

                        $('#dynamic_form').append(html);
                        formCount++;
                    } else {
                        return;
                    }
                });


                $('#dynamic_form').on("click", "#remove_more", function (e) { //user click on remove text
                    e.preventDefault();
                    $(this).parent('div').parent('div').parent('div').parent('div')[0].remove();
                    formCount--;

                })
            });
        </script>

        <!--adding dinamic field-->
        <div class="container col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Add Remove input fields Dynamically using jQuery Bootstrap</div>
                <div class="panel-body">
                    <div class="form-group col-lg-4">
                    <form action="" >

                        <div class="input-group control-group after-add-more">

                            <input type="text" name="addmore[]" class="form-control" placeholder="Enter Name Here">
                           
                            <div class="input-group-btn"> 
                                <button class="btn btn-success add-more" type="button"><i class="glyphicon glyphicon-plus"></i> Add</button>
                            </div>
                        </div>
                        

                    </form>
                    </div>


                    <!-- Copy Fields-These are the fields which we get through jquery and then add after the above input,-->
                    <div class="copy-fields hide">
                        <div class="control-group input-group" style="margin-top:10px">
                            <input type="text" name="addmore[]" class="form-control" placeholder="Enter Name Here">
                            <div class="input-group-btn"> 
                                <button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">

            $(document).ready(function () {

                //here first get the contents of the div with name class copy-fields and add it to after "after-add-more" div class.
                $(".add-more").click(function () {
                    var html = $(".copy-fields").html();
                    $(".after-add-more").after(html);
                });
        //here it will remove the current value of the remove button which has been pressed
                $("body").on("click", ".remove", function () {
                    $(this).parents(".control-group").remove();
                });

            });

        </script>
  
<!--auto complate-->
 <div class="ui-widget col-lg-12">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
  <!--checkbox-->
  
<form method="post" action="insertmultiple.jsp" >
Select Languages:<br>
<input type="checkbox" name="lang" value="C/C++">C/C++<br>
<input type="checkbox" name="lang" value="JAVA">Java<br>
<input type="checkbox" name="lang" value="C#">C#<br>
<input type="checkbox" name="lang" value="PERL">PERL<br>
<input type="checkbox" name="lang" value="PYTHON">PYTHON<br>
<input type="submit" value="Submit">
</form>
    </body>
     <head>
      <script src = "https://maps.googleapis.com/maps/api/js"></script>
      
      <script>
         function loadMap() {
			
            var mapOptions = {
               center:new google.maps.LatLng(20.593684, 78.96288), zoom:12,
               mapTypeId:google.maps.MapTypeId.ROADMAP
            };
				
            var map = new google.maps.Map(document.getElementById("sample"),mapOptions);
         }
      </script>
      
   </head>
   
   <body onload = "loadMap()">
      <div id = "sample" style = "width:570px; height:580px;"></div>
   </body>

<link href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<style type='text/css'>
  /* Style to hide Dates / Months */
  .ui-datepicker-calendar,.ui-datepicker-month { display: none; }
</style>
<script type='text/javascript'>
  $(function(){
    $('.datepicker').datepicker({
        changeMonth: false,
        changeYear: true,
        showButtonPanel: true,
        yearRange: '1950:2014',
        dateFormat: 'yy',
        onClose: function(dateText, inst) { 
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, 0, 1));
        }});
    });
</script>

  <input class='datepicker'/>

<!--radio button-->

    <title>jQuery Show Hide Elements Using Radio Buttons</title>

    <style type="text/css">

        .box{

            color: #fff;

            padding: 20px;

            display: none;

            margin-top: 20px;

        }

        .red{ background: #ff0000; }

        .green{ background: #228B22; }

        .blue{ background: #0000ff; }

    </style>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <script type="text/javascript">

    $(document).ready(function(){

        $('input[type="radio"]').click(function(){

            var inputValue = $(this).attr("value");

            var targetBox = $("." + inputValue);

            $(".box").not(targetBox).hide();

            $(targetBox).show();

        });

    });

    </script>

        <div>

            <label><input type="radio" name="colorRadio" value="red"> red</label>

            <label><input type="radio" name="colorRadio" value="green"> green</label>

            <label><input type="radio" name="colorRadio" value="blue"> blue</label>

        </div>

        <!--<div class="red box"> <input type="text" name="text1" id="text1" maxlength="30"></div>-->
         <div class=""> <input type="text" name="text1" id="text1" maxlength="30"></div>
        <div class="green box">You have selected <strong>green radio button</strong> so i am here</div>

        <div class="blue box">You have selected <strong>blue radio button</strong> so i am here</div>

        
        <!--radio button-->
      Yes <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="yesCheck"> 
      No <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" id="noCheck"><br>
    <div id="ifYes" style="visibility:hidden">
        <input type='text' id='yes' name='yes'><br>
        <input type='text' id='acc' name='acc'>
        <button type="submit">Add Pre-request</button>
    </div>
        
<!--        other 3<input type='text' id='other3' name='other3'><br>
        other 4<input type='text' id='other4' name='other4'><br>-->
        <script type="text/javascript">
            function yesnoCheck() {
    if (document.getElementById('yesCheck').checked) {
        document.getElementById('ifYes').style.visibility = 'visible';
    }
    else document.getElementById('ifYes').style.visibility = 'hidden';

}
        </script>
    </body>

    </html>




