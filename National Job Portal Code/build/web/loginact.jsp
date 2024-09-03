<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@ page session="true" %>
<%
    String usertype = request.getParameter("utype");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    out.println(usertype);
    out.println(username);
    out.println(password);

    try {
        Connection con = databasecon.getconnection();
        out.println(con);
        if (usertype.equals("recruiter")) {
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from recruiter where username ='" + username + "' and password='" + password + "'");
            if (rs1.next()) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from recruiter where username ='" + username + "' and password='" + password + "' ");
                if (rs.next()) {
                    String uname = rs.getString(2);
                    String cname = rs.getString(6);
                    session.setAttribute("username", uname);
                    session.setAttribute("cname", cname);
                    response.sendRedirect("recruiterhome.jsp?m1=Success");
                } else {
                    response.sendRedirect("index.jsp?m2=LoginFail");
                }
            } else {
                response.sendRedirect("index.jsp?m3=LoginFail");
            }
        } else if (usertype.equals("user")) {
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from user where username ='" + username + "' and password='" + password + "'");
            if (rs1.next()) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from user where username ='" + username + "' and password='" + password + "'");
                if (rs.next()) {
                    String uname = rs.getString(2);
                    session.setAttribute("username", uname);
                    response.sendRedirect("userhome.jsp?m1=Success");
                } else {
                    response.sendRedirect("index.jsp?m2=LoginFail");
                }
            } else {
                response.sendRedirect("index.jsp?m3=LoginFail");
            }

        } else {
            if ((username.equals("admin")) && (password.equals("admin"))) {
                response.sendRedirect("adminhome.jsp?m1=Success");
            } else {
                response.sendRedirect("index.jsp?m2=LoginFail");
            }
        }

    } catch (Exception e) {
        System.out.println("Error in index.jsp" + e.getMessage());
    }
%>


