<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>
<%
        String utype = request.getParameter("utype");
        String name = request.getParameter("name");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        String jobrole = request.getParameter("jobrole");
        String company = request.getParameter("company");
        String cmobile = request.getParameter("cmobile");
        String pmobile = request.getParameter("pmobile");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String college = request.getParameter("college");

        try {
            if (utype.equals("recruiter")) {
                Connection con = databasecon.getconnection();
                PreparedStatement pst = con.prepareStatement("update recruiter set username ='" + username + "', password ='" + password + "', name ='" + name + "', jobrole ='" + jobrole + "',company ='" + company + "',cmobile ='" + cmobile + "',pmobile ='" + pmobile + "',address ='" + address + "' where username='" + username + "'");
                int i = pst.executeUpdate();
                if (i == 1) {
                    response.sendRedirect("rviewprofile.jsp?msg=Success");
                } else {
                    response.sendRedirect("rviewprofile.jsp?m3=failed");
                }
            } else {
                Connection con = databasecon.getconnection();
                PreparedStatement pst = con.prepareStatement("update user set username ='" + username + "', password ='" + password + "', name ='" + name + "', gender ='" + gender + "',college ='" + college + "',address ='" + address + "' where username='" + username + "'");
                int i = pst.executeUpdate();
                if (i == 1) {
                    response.sendRedirect("updateprofile.jsp?msg=Success");
                } else {
                    response.sendRedirect("updateprofile.jsp?m3=failed");
                }
            }

        } catch (Exception e) {
            out.println(e);
        }

%>