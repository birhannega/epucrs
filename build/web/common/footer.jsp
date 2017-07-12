<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<div class="footer">
    <div class="well well-sm">
        <strong>&copy; <%
            
            Date date=new Date();
            SimpleDateFormat form=new SimpleDateFormat("Y");
            String year=form.format(date);
        out.print(year);%></strong>
        
    </div>
</div>