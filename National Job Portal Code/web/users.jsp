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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="stylesheets/footerstyle.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style>
            .card-custom {
                min-height: 450px;
                box-shadow: 0 0 15px rgba(10, 10, 10, 0.3);
                flex-wrap: wrap;
                flex: 0 0 350px;
                /* flex: 1 0 auto; */
            }
            .card {
                margin-bottom: 20px;
            }

            .card-custom-img,img {
                height: 200px;
                min-height: 200px;
                width:100%;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                border-color: inherit;
            }
            .container-fluid {
                overflow: hidden !important;
                font-family: "Oleo Script Swash Caps", cursive !important;
            }
        </style>
    </head>
    <%if (request.getParameter("m3") != null) {%>
    <script>alert('Accepted...');</script>
    <%} else if (request.getParameter("m2") != null) {%>
    <script>alert('Rejected...');</script>
    <%}%>
    <body>
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
                <li><a href="adminhome.jsp">Home</a></li>
                <li class="active">
                    <a href="users.jsp?utype=user">View Users</a>
                </li>
                <li>
                    <a href="recruiters.jsp?utype=recruiter">View Recruiters</a>
                </li>
                <li>
                    <a href="addtest.jsp">Add Test Links</a>
                </li>
                <li>
                    <a href="index.jsp">Logout</a>
                </li>
            </ul>
        </section>
        <br /><br />
        <div class="container-fluid d-flex justify-content-around flex-wrap">
            <%
                Connection con = databasecon.getconnection();
                PreparedStatement pst = con.prepareStatement("select *from user");
                ResultSet rs = pst.executeQuery();
            %> 
            <%int i = 0;
                while (rs.next()) {%>
            <div class="card card-custom bg-white border-white border-0 slideInLeft animated">
                <div class="card-custom-img"><a href="<%=rs.getString(8)%>" target="_blank" download=""><img src="<%=rs.getString(8)%>" data-toggle="tooltip" data-placement="bottom" title="Click Here View The Image"></a></div>
                <div class="card-body" style="overflow-y: auto">
                    <h3 class="card-title text-center text-bold"><%=rs.getString(4)%></h3>
                    <p class="card-text text-center">
                        <%=rs.getString(2)%>
                    </p>
                    <p class="text-center"><b>Status: </b><%=rs.getString(9)%></p>
                </div>
                <div class="card-footer" style="background: inherit; border-color: inherit; display: flex;justify-content: space-between">
                    <a id="acc<%=i%>" href="accept.jsp?id=<%=rs.getString(1)%>&utype=user" class="button raise">Accept</a>
                    <a id="rej" href="reject.jsp?id=<%=rs.getString(1)%>&utype=user" class="button raise btn-success">Reject</a>
                </div>
            </div>
            <%
                if ((rs.getString(9)).equals("Accepted")) {%>
            <script>
                document.getElementById("acc<%=i%>").disabled = true;
            </script>

            <% }
                    i++;
                }
            %>
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
            <script>
                $(document).ready(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            </script>
        </footer>
    </body>
</html>
