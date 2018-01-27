<%-- 
    Document   : CourseList
    Created on : 03-Nov-2017, 08:37:15
    Author     : efrem
--%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.connectionManager"%>
<%@page import="java.sql.*"%>
<%
String varcrsassignment=request.getParameter("programname");  
//out.print(varname);
// String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
 connectionManager con= new connectionManager();
 Connection connection= con.getconnection();
 Statement stmt = connection.createStatement();  
 ResultSet rs = stmt.executeQuery("select distinct COURSE_NAME from TBL_COURSE_REGISTRATION where PROGRAM_ID='"+varcrsassignment+"' "); 
%>
 
<%String adminname=session.getAttribute("inst").toString();%>
<form  class='form-group'  Method='POST' action="coursecheckbox.jsp">
     <%
                                                try {
                                                    connectionManager dbconnection = new connectionManager();
                                                    Statement stm_class = dbconnection.getconnection().createStatement();
                                                     String inst_sql = "select ACADEMIC_STAFF_ID,USER_ID from TBL_USER where USER_ID='"+adminname+"'";
//                                                    String inst_sql = "select ACADEMIC_STAFF_ID, FIRST_NAME ||  ' ' ||  MIDDLE_NAME  || ' ' || LAST_NAME as FULL_NAME from TBL_ACADEMIC_STAFF_REG where FULL_NAME='"+adminname+"'";
                                                    ResultSet rs_class = stm_class.executeQuery(inst_sql);

                                            %>

                                            <%    while (rs_class.next()) {
                                                    String instructor_id = rs_class.getString("ACADEMIC_STAFF_ID");
                                                    //cid;
                                            %>
                                           <input class="control-label hidden" for="tclass" id="acdstaffid" name="acdstaffid" value="<%=instructor_id%>"><%=instructor_id%>
                                            <% } %>
                                            <!--</select>-->
                                            <%
                                                } catch (Exception e) {
                                                    out.println("wrong selection!" + e);
                                                }
                                            %>
      <div><label>Course_Name</label></div>
 <%   while(rs.next()){
//       String prgrm=rs.getString("PROGRAM_ID");
        String crsname=rs.getString("COURSE_NAME");
//          String crdthr=rs.getString("CREDIT_HOURS");
       %>

       <input type=checkbox id="crsname" name="crsname" value="<%=crsname%>"><%=crsname %></br> 
     
<%}%>      
<input type='submit' value='save' id="savecourse" name="savecourse">   
         </form>
<!-- <input type='button' value='save'>  
         </form>-->
 <% }
 catch(Exception e){
     System.out.println(e);
 }

 %>