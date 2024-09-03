<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String sub = request.getParameter("sub");  
String link = request.getParameter("link");
int id=0;

try{
    Connection con=databasecon.getconnection();
PreparedStatement ps=con.prepareStatement("insert into courses values(?,?,?)");

ps.setInt(1,id);
ps.setString(2,sub);
ps.setString(3,link);
int i=ps.executeUpdate();
if(i>0)
{
response.sendRedirect("addtest.jsp?msg=Added");
}
else{
    response.sendRedirect("addtest.jsp?m1=Failed");
}
%>
<%
}

catch(Exception e)
{
        out.println(e.getMessage());
}
%>