<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>
<%
    String requirment = request.getParameter("requirment");
    String username = session.getAttribute("username").toString();
    String cname = session.getAttribute("cname").toString();
    String jrole = request.getParameter("jrole");
    String packg = request.getParameter("package");

    try {
        Connection con = databasecon.getconnection();
        PreparedStatement pst = con.prepareStatement("update jobs set requirments ='" + requirment + "', cname ='" + cname + "', jobrole ='" + jrole + "',package ='" + packg + "',username ='" + username + "' where username='" + username + "'");
        int i = pst.executeUpdate();
        if (i == 1) {
            response.sendRedirect("viewjob.jsp?msg=Success");
        } else {
            response.sendRedirect("viewjob.jsp?m3=failed");
        }

    } catch (Exception e) {
        out.println(e);
    }

%>