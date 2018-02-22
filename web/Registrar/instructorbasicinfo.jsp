  <%@page import="java.sql.ResultSet"%>
<form class="form-group " method="POST" enctype="multipart/form-data" id="stud_reg" action="${pageContext.request.contextPath}//InstructorReg_Servlet">

                                    <!--<div class="form-group col-lg-12">Instructor Id:<input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled id="instid" name="instid" value=""></div>--> 
                                    <div class="form-group col-lg-4 has-success has-feedack">
                                        <div class="input-group">
                                            <input  type="file" name="ImageFile" id="ImageFile" />
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Instructor ID</span>
                                            <input type="text" name="instid"  class="form-control" id="instid" required="" placeholder="Enter Instructor ID!">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">

                                        <div class="input-group">
                                            <span class="input-group-addon" >Title</span>
                                            <select class="form-control" id="insttitle" name="insttitle" >
                                                <option value="">-select title-</option>
                                                <option value="Commissioner">Commissioner</option>
                                                <option value="assCommissioner">Ass/Commissioner</option><option value="Deputy Commissioner">Deputy Commissioner</option>
                                                <option value="Commander">Commander</option><option value="Ass/Commander">Ass/Commander</option><option value="Deputy Commander">Deputy Commander</option>
                                                <option value="Ass/Commander">Ass/Commander</option>
                                                <option value="Inspector">Inspector</option><option value="Deputy Inspector">Deputy Inspector</option>
                                                <option value="Sergeant">Sergeant</option><option value="">Ass/Sergeant</option><option value="">Deputy Sergeant</option>
                                                <option value="">Constable</option><option value="">Nominee Officer</option>
                                                <option value="">Commissioner General</option><option value="">Deputy Commissioner General</option>
                                                <option value="">Deputy Inspector</option><option value="">Engineer Doctor</option>
                                                <option value="">Sister</option><option value="">Health Officer</option><option value="">Nurse</option><option value="">Mid Wife</option>
                                                <option value="">Secretary</option><option value="">Director</option><option value="">Head Director</option>
                                                <option value="">Ra/Tech</option>
                                                <option value="33">Mr</option><option value="34">Ms</option><option value="35">Phd</option><option value="36">Doctor</option>
                                            </select>
                                        </div>
                                    </div>   
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">First Name</span>
                                            <input type="text" name="firstname"  class="form-control" id="firstname" placeholder="Enter First Name">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Middle Name</span>
                                            <input type="text" name="middlename"  class="form-control" id="middlename" placeholder="Enter Middle Name">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Last Name</span>
                                            <input type="text" name="lastname"  class="form-control" id="lastname" placeholder="Enter Last Name">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Phone NO</span>
                                            <input type="text" name="phoneno"  class="form-control" id="phoneno" placeholder="Enter Phone NO">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Email</span>
                                            <input type="text" name="email"  class="form-control" id="email" placeholder="Enter Email">
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Department</span>
                                            <select class="form-control" id="department" name="department" required="required">
                                                <option value="">-select department-</option>
                                                <%
                                                    try {
                                                        //                                                    connectionManager dbconnection = new connectionManager();
                                                        //                                                    Statement st_program = dbconnection.getconnection().createStatement();
                                                        String qury = "select * from Tbl_department";

                                                        ResultSet rs_program = stmt.executeQuery(qury);

                                                %>
                                                //                                                                        
                                                <%    while (rs_program.next()) {
                                                        String depname = rs_program.getString("DEP_NAME");
                                                        //cid;
                                                        String depid = rs_program.getString("DEP_ID");
%>
                                                <option value="<%=depid%>"><%=depname%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Status</span>
                                            <select class="form-control" id="status" name="status" required="requiered">
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Type</span>
                                            <select class="form-control" id="insttype" name="insttype" required="requiered">
                                                <option value="">-select type-</option>
                                                <option value="Civil">Civil</option>
                                                <option value="Military">Military</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Responsibility</span>
                                            <select class="form-control" id="responsibility" name="responsibility" >
                                                <option value="">-select responsibility-</option>
                                                <%
                                                    try {
                                                        //                                                    connectionManager dbconnection = new connectionManager();
                                                        //                                                    Statement st_program = dbconnection.getconnection().createStatement();
                                                        String program_sql = "select * from lu_responsibility";

                                                        ResultSet rs_program = stmt.executeQuery(program_sql);

                                                %>
                                                //                                                                        
                                                <%    while (rs_program.next()) {
                                                        String id = rs_program.getString("resp_name");
                                                        //cid;
%>
                                                <option><%=id%></option>
                                                <% } %>
                                                <!--</select>-->
                                                <%
                                                    } catch (Exception e) {
                                                        out.println("wrong selection!" + e);
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Hired Date</span>
                                            <input class="form-control" id="hirddate" name="hirddate" placeholder="Enter Assigned Date" type="date" required=""/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Police Science</span>
                                            <select class="form-control" id="policemngmt" name="policemngmt" required="requiered">
                                                <option value="">-select PS type-</option>
                                                <option value="Yes">Yes</option>
                                                <option value="No">No</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-4 has-success has-feedback">
                                        <div class="input-group">
                                            <span class="input-group-addon">Description</span>
                                            <textarea type="text" name="description"  class="form-control" id="description" placeholder="Enter Description"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-sm-6">
                                        <button type="submit" id="tnsaveinst" class="btn btn-primary">
                                            <span class="fa fa-save"><strong>  Save staff info</strong></span></button>
                                    </div>
                                </form>