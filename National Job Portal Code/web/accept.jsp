<%@page import="Mail.Mail"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    String id = request.getParameter("id");
    String utype = request.getParameter("utype");
    try {
        Connection con = databasecon.getconnection();
        PreparedStatement ps = con.prepareStatement("update " + utype + " set status ='Accepted' where id=" + id + "");
        int i = ps.executeUpdate();
        PreparedStatement pst = con.prepareStatement("select *from " + utype + " where id=" + id + "");
        ResultSet rs = pst.executeQuery();
        if (i > 0) {
            if (rs.next()) {
                String email = rs.getString(2);
                String name = rs.getString(4);
                String subject = "Profile Status";
                String msg = "Dear, " + name + " Your Profile Has Been Activated Successfully.";
                if (utype.equals("user")) {
                    Mail p = new Mail();
                    p.secretMail(msg, subject, email);
                } else if (utype.equals("recruiter")) {
                    Mail p = new Mail();
                    p.secretMail(msg, subject, email);
                } else if (utype.equals("application")) {
                    String email1 = rs.getString(3);
                    String name1 = rs.getString(2);
                    String subject1 = "Application Status";
                    String msg1 = "Dear, " + name1 + " Your Application Has Been Accepted. Regarding the Interview We Will get back to you soon";
                    Mail p = new Mail();
                    p.secretMail(msg1, subject1, email1);
                }
            }
            response.sendRedirect(utype + "s.jsp?m3=Accepted&utype=" + utype);
        } else {
            response.sendRedirect(utype + "s.jsp?m2=Failed&utype=" + utype);
        }

    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>