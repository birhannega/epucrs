<div class="col-lg-12">
    <form class="form-group " method="post" id="staffexpform" action="${pageContext.request.contextPath}/AcademicExperianceServlet">
    <div class="form-group col-lg-4">
         <label>Enter Instructor ID</label>
        <input type="text" id="instID" name="orgname" placeholder="Enter id" class="form-control"></div>
    <div class="form-group col-lg-4"> 
        <label>Select qualification</label>
        <select class="form-control" id="qualification" name="qualification" required="required">
            <option value="">-select Qualification-</option>
            <option value="Diploma">Diploma</option>
            <option value="BSC Dgree">BSC Dgree</option>
            <option value="MSC">MSC</option>
            <option value="PHD">PHD</option>
            <option value="CERTIFICATE">CERTIFICATE</option>
            <option value="LEVEL1">LEVEL1</option>
            <option value="LEVEL2">LEVEL2</option>
            <option value="LEVEL3">LEVEL3</option>
            <option value="LEVEL4">LEVEL4</option>
        </select>
    </div>
    <div class="form-group col-lg-4">
        <label>Select category</label>
        <select class="form-control" id="expctgry" name="expctgry" required="required">
            <option value="">-select category-</option>
            <option value="Lecture">Lecture</option>
            <option value="Lecture">Assistant Lecture</option>
            <option value="IT">IT</option>
            <option value="Software">Software</option>
            <option value="Maintenance">Maintenance</option>
            <option value="Management">Management</option>
            <option value="Finance">Finance</option>
            <option value="Health">Health</option>
            <option value="Accounting">Accounting</option>
        </select>
    </div>
    <div class="form-group col-lg-4"> 
        <label>Type of hiring org.</label>
        <select class="form-control" id="officetype" name="officetype" required="required">
            <option value="">-select Office-</option>
            <option value="GovernmentOffice">Government Office</option>
            <option value="PrivateOffice">Private Office</option>
        </select>
    </div>
    <div class="form-group col-lg-4">
        <input type="text" id="orgname" name="orgname" placeholder="Enter org name" class="form-control"></div>
    <div class="form-group col-lg-4">
        <input type="text" id="totalexp" name="totalexp" placeholder="Enter total exp" class="form-control"></div>
    <div class="form-group col-lg-4">
        <input class="form-control " id="datefrom_lect_from" name="datefrom_exp_from" placeholder="Enter  Date" type="date" required=""/>
    </div>
    <div class="form-group col-lg-4">
        <input class="form-control " id="datefrom_lect_to" name="datefrom_exp_to" placeholder="Enter  Date" type="date" required=""/>
    </div>
    <div class="form-group">
        <button type="submit" id="saveinstexp" class="btn btn-info">
            <span class="fa fa-save"> <strong>  Save Instructor Expertise</strong></span></button>
    </div>
</form>
</div>
    <div class="col-lg-12">
        <pre><h5>Instructors with registered experience</h5></pre>
        <table class="table table-hover table-condensed">
            <thead>
            <th>#</th>
            <th>Full name</th>
            <th>Total experience</th>
                
            </thead>
        </table>
        
    </div>