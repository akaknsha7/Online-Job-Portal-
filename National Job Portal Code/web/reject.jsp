
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
    <%
    String id = request.getParameter("id"); 
     String utype = request.getParameter("utype");
    try{
        Connection con=databasecon.getconnection();
    PreparedStatement ps=con.prepareStatement("update "+utype+" set status ='Rejected' where id='"+id+"'");
    int i=ps.executeUpdate();
    if(i>0)
    {
    response.sendRedirect(utype+"s.jsp?m3=Rejected&utype="+utype);
    }
    else{
    response.sendRedirect(utype+"s.jsp?m2=Failed&utype="+utype);    
    }
    
    
        
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
    %>