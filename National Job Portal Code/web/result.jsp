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
       
        <br><br><br>
        <%
           String val=session.getAttribute("val1").toString();
           
        %>
    <center>
        
        
        <h1>  <%=val%>% Match</h1>
        
        
    </center>
        
       <br><br><br>
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
