<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    String id = request.getParameter("id");

    try {
        Connection con = databasecon.getconnection();
        PreparedStatement ps = con.prepareStatement("delete from jobs where id='"+id+"'");
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("viewjob.jsp?m1=Deleted");
        } else {
            response.sendRedirect("viewjob.jsp?m2=Failed");
        }

    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>