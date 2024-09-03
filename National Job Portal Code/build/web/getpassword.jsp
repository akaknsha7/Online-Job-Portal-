<%@page import="Mail.Mail"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>
<%
    String email = request.getParameter("email");
    String utype = request.getParameter("utype");
    Connection con = databasecon.getconnection();
    PreparedStatement pst = con.prepareStatement("select *from " + utype + " where username='" + email + "'");
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        String name = rs.getString(4);
        String password = rs.getString(3);
        String subject = "Password";
        String msg = "Dear, " + name + " Your Password is: '"+password+"'";
        Mail p = new Mail();
        p.secretMail(msg, subject, email);
        response.sendRedirect("login.jsp?m3=Sent&utype=" + utype);
    } else {
        response.sendRedirect("login.jsp?m4=Failed,No_User_Found&utype=" + utype);
    }

%>