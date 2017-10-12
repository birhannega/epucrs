
<%@ page import="java.util.*" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<HTML>
<H1>FAQ</H1>
<H3>Category choice</H3>
<FORM ACTION="wk465682UserMenu.jsp" METHOD="POST">
<%
String CategoryCombo = null;%>
<SELECT NAME="Category" id= Category onChange="location.href='wk465682UserMenu.jsp?option='+this.value;">
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:odbc:FAQ");
Statement statement = conn.createStatement();
ResultSet rs = statement.executeQuery("SELECT DISTINCT CATEGORY FROM FAQ" );%>
<OPTION VALUE='nochoice'>Please choose a category</OPTION>";
<%while(rs.next()) {
CategoryCombo = rs.getString("Category");%> 
<OPTION value ="optcategory"><%out.println(CategoryCombo);%>
</OPTION>
<% } %>
</SELECT>
<BR><BR>
<H3>Question selection</H3>
<%
String QuestionCombo = null;%>
<SELECT NAME="Question" id = Question>
<OPTION VALUE='nochoice'>Please choose a question</OPTION>";
<%ResultSet ss = statement.executeQuery("SELECT * FROM FAQ WHERE CATEGORY = ( '" + CategoryCombo + "')");
while(ss.next()) {
QuestionCombo = ss.getString("Question");%> 
<OPTION value="optquestion"><%out.println(QuestionCombo);%>
</OPTION>
<% }
%>
</SELECT>
</FORM>
</HTML>