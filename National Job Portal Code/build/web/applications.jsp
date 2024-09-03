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
        <style>
            .form-group {
                margin-bottom: 0.5rem;
            }
            .card {
                border-radius: 1rem;
            }
            .card:hover {
                box-shadow: 3px 3px 10px black;
                cursor: pointer;
            }
        </style>
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
                <li><a href="recruiterhome.jsp">Home</a></li>
                <li>
                    <a href="rviewprofile.jsp">Update Profile</a>
                </li>
                <li>
                    <a href="addjob.jsp">Add Job</a>
                </li>
                <li>
                   
                </li>
                <li class="active">
                    <a href="applications.jsp">Applications</a>
                </li>
                <li>
                    <a href="index.jsp">Logout</a>
                </li>
            </ul>
        </section>
        <br /><br />
        <%
            String username = session.getAttribute("username").toString();
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select *from application where recruiter='"+username+"' and status='Pending'");
            ResultSet rs = pst.executeQuery();
        %>

        <div class="container-fluid">
            <div class="row">
                <%while (rs.next()) {%>
                <div class="col-md-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title text-center"><u><%=rs.getString(15)%></u></h5>
                            <div class="col-lg-12 d-flex justify-content-center align-items-center text-justify flex-wrap">
                                <div class="form-group col-lg-6"><b>Name:</b> <%=rs.getString(2)%></div>
                                <div class="form-group col-lg-6"><b>Dob:</b> <%=rs.getString(4)%></div>
                                <div class="form-group col-lg-6"><b>Qualification:</b> <%=rs.getString(7)%></div>
                                <div class="form-group col-lg-6"><b>Highest Degree:</b> <%=rs.getString(8)%></div>
                                <div class="form-group col-lg-6"><b>Percentage:</b> <%=rs.getString(9)%>%</div>
                                <div class="form-group col-lg-6"><b>Passed Out Year:</b> <%=rs.getString(10)%></div>
                            </div>
                            <div class="d-flex justify-content-end align-items-center">
                                <a href="<%=rs.getString(11)%>" target="_blank" class="mr-auto text-primary"
                                   ><b>View Resume</b></a
                                >
                                <a href="accept.jsp?id=<%=rs.getString(1)%>&utype=application" class="btn btn-success mr-5">Accept</a>
                                <a href="reject.jsp?id=<%=rs.getString(1)%>&utype=application" class="btn btn-danger">Reject</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <br /><br /><br /><br />
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
