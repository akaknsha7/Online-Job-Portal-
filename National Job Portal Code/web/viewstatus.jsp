<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>National Job Portal</title>
        <link rel="stylesheet" href="stylesheets/navstyle.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="stylesheets/footerstyle.css" />
    </head>
    <body>
        <section class="top-nav">
            <div class="logo">
                National Job Portal
            </div>
            <input id="menu-toggle" type="checkbox" />
            <label class="menu-button-container" for="menu-toggle">
                <div class="menu-button"></div>
            </label>
            <ul class="menu">
                <li><a href="userhome.jsp">Home</a></li>
                <li>
                    <a href="updateprofile.jsp">Update Profile</a>
                </li>
                <li>
                    <a href="viewjobs.jsp">View Jobs</a>
                </li>
                <li class="active">
                    <a href="viewstatus.jsp">View Status</a>
                </li>
                <li>
                    
                </li>
                <li>
                    <a href="index.jsp">Logout</a>
                </li>
            </ul>
        </section>
        <%
            String username=session.getAttribute("username").toString();
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select *from application where email='"+username+"'");
            ResultSet rs = pst.executeQuery();
        %> 
        <div class="container">
            <br /><br />
            <h3 class="text-center"><u>Application Status</u></h3>
            <div class="table-responsive-sm">
                <table class="table table-hover text-center table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>Company Name</th>
                            <th>Job Role</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while(rs.next()){%>
                        <tr>
                            <td><%=rs.getString(14)%></td>
                            <td><%=rs.getString(15)%></td>
                            <td><%=rs.getString(12)%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <footer class="footer">
            <div class="container">
                <ul class="list-inline mb-0 text-center">
                    <li class="list-inline-item">
                        <a href=""><span class="fa fa-twitter"></span></a>
                    </li>

                    <li class="list-inline-item">
                        <a href=""><span class="fa fa-google-plus"></span></a>
                    </li>

                    <li class="list-inline-item">
                        <a href=""><span class="fa fa-instagram"></span></a>
                    </li>

                    <li class="list-inline-item">
                        <a href=""><span class="fa fa-envelope-o"></span></a>
                    </li>
                </ul>
            </div>
        </footer>
    </body>
</html>
