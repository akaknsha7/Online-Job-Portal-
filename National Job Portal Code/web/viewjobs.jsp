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
            body {
                background-color: rgba(10, 10, 10, 0.3);
            }
            .card-custom {
                min-height: 250px;
                width: 380px;
                box-shadow: 0 0 15px rgba(10, 10, 10, 0.3);
                flex-wrap: wrap;
                /* flex: 0 0 350px; */
                background: linear-gradient(to left, #ffe000, #799f0c);
                /* flex: 1 1 auto; */
                /* margin: 2px; */
                /* text-align: center; */
                border-radius: 20px;
            }
            .card-footer {
                border-radius: 20px !important;
                border-color: transparent !important;
                width: 380px;
            }
            .card {
                margin-bottom: 20px;
            }

            .card-custom-img {
                height: 200px;
                min-height: 200px;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                border-color: inherit;
            }
            .container-fluid {
                overflow: hidden !important;
                font-family: "Oleo Script Swash Caps", cursive !important;
            }
            th {
                text-decoration: underline;
            }
            td {
                font-weight: 600;
            }
            textarea {
                all: unset;
            }
        </style>
    </head>    
    <%
        if (request.getParameter("msg") != null) {%>
    <script>alert('Form Submitted Successfully...');</script>
    <%}%>
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
                <li class="active">
                    <a href="viewjobs.jsp">View Jobs</a>
                </li>
                <li>
                    <a href="viewstatus.jsp">View Status</a>
                </li>
                <li>
                    
                </li>
                <li>
                    <a href="index.jsp">Logout</a>
                </li>
            </ul>
        </section>
        <br>
        <form id="frm" action="viewjobs_1.jsp">
        <div>
            <div class="input-group text-right" style="float:right;width:300px;margin-right: 20px;">
                <input type="text" class="form-control" name="key" placeholder="Search Jobs">
                <div class="input-group-append">
                    <button class="btn btn-success" type="button" onclick="frm.submit()">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
        </form>
        <br><br><br>
        <%
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select *from jobs");
            ResultSet rs = pst.executeQuery();
        %>
        <div class="container-fluid d-flex justify-content-around flex-wrap">
            <%while (rs.next()) {%>
            <div class="card card-custom bg-white border-white border-0 outline-outward">
                <div class="card-body" style="width:350px;padding-bottom:0">
                    <h3 class="card-title text-center text-bold"><u><%=rs.getString(4)%></u></h3>
                    <table>
                        <tr>
                            <th>Company Name:</th>
                            <td><%=rs.getString(3)%></td>
                        </tr>
                        <tr>
                            <th>Package:</th>
                            <td><%=rs.getString(5)%></td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top">Requirments:</th>
                            <td>
                                <textarea
                                    name=""
                                    id=""
                                    cols="20"
                                    rows="5"
                                    readonly
                                    style="pointer-events: none"
                                    ><%=rs.getString(2)%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>Company Details:</th>
                            <td style="text-align: center">
                                <a href="<%=rs.getString(6)%>" target="_blank">See Details</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div
                    class="card-footer mt-1"
                    style="background: inherit; border-color: inherit; display: flex;justify-content: space-between" >
                     <a href="check.jsp?recruiter=<%=rs.getString(7)%>" class="button raise">Check</a>
                    <a href="applyform.jsp?recruiter=<%=rs.getString(7)%>&cname=<%=rs.getString(3)%>&jrole=<%=rs.getString(4)%>" class="button raise">Apply</a>
                </div>
            </div>
            <%}%>
        </div>
        <br /><br /><br />
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
