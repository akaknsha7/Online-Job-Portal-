<%@page import="Mail.compare"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@ page session="true" %>
<%@ page import="java.io.*, java.util.*" %>
<%
    String recruiter = request.getParameter("recruiter");
   String user = session.getAttribute("username").toString();
    String password = request.getParameter("password");
    String doc1 = "";
    String doc2 = "";
   

   
        Connection con = databasecon.getconnection();
        out.println(con);
      
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from jobs where username ='" + recruiter + "' ");
            if (rs1.next()) {
                
                doc1 = rs1.getString(6);
                
            }   
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from user where username ='" + user + "'");
                if (rs.next()) {
                     doc2 = rs.getString(8);
                } 
                
                
                 compare f = new compare();
          double val =f.check("C:\\Users\\chotu\\Documents\\snadhya\\236) National Job Portal\\National Job Portal Updated\\abc\\"+doc1,"C:\\Users\\chotu\\Documents\\snadhya\\236) National Job Portal\\National Job Portal Updated\\abc\\"+doc2);    
          System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
          System.out.println(val);
            
         
long val1 = Math.round(val);
System.out.println(val1);
           session.setAttribute("val1", val1);
          
         response.sendRedirect("result.jsp?val1=" +val1);
            
         
     
%>

