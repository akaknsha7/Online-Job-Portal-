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
            .card-custom {
                min-height: 250px;
                box-shadow: 0 0 15px rgba(10, 10, 10, 0.3);
                flex-wrap: wrap;
                flex: 0 0 350px;
                background: linear-gradient(to right, #ed4264, #ffedbc);
                border-radius: 20px;
                /* flex: 1 0 auto; */
            }
            .card-footer{
                border-radius: 20px!important;
                border-color:transparent!important;
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
            input,
            textarea {
                border: none;
                outline: none;
                background-color: transparent;
                font-weight: 600;
            }
            th{
                text-decoration: underline;
            }
        </style>
    </head>
    <%
        if (request.getParameter("msg") != null) {%>
    <script>alert('Updated Successfully...');</script>
    <%}else if(request.getParameter("m1") != null){%>
    <script>alert('Deleted Successfully...');</script>
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
                <li><a href="recruiterhome.jsp">Home</a></li>
                <li>
                    <a href="rviewprofile.jsp">Update Profile</a>
                </li>
                <li>
                    <a href="addjob.jsp">Add Job</a>
                </li>
                <li class="active">
                   
                </li>
                <li>
                    <a href="applications.jsp">Applications</a>
                </li>
                <li>
                    <a href="index.jsp">Logout</a>
                </li>
            </ul>
        </section>
        <%
            String username = session.getAttribute("username").toString();
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select *from jobs where username='" + username + "'");
            ResultSet rs = pst.executeQuery();
        %>
        <br><br>
        <div class="container-fluid d-flex justify-content-around flex-wrap">
            <%while (rs.next()) {%>
            <div class="card card-custom bg-white border-white border-0 outline-outward">
                <form action="updatejob" id="myForm" method="POST" enctype="multipat/form-data">
                    <div class="card-body" style="width:350px;padding-bottom:0">
                        <h3 class="card-title text-center text-bold">
                            <input
                                type="text"
                                name="jrole"
                                style="text-align: center;text-decoration: underline"
                                value="<%=rs.getString(4)%>"
                                />
                        </h3>
                        <table>
                            <tr>
                                <th>Company Name:</th>
                                <td><input type="text" name="" value="<%=rs.getString(3)%>" /></td>
                            </tr>
                            <tr>
                                <th>Package:</th>
                                <td><input type="text" name="package" value="<%=rs.getString(5)%>" /></td>
                            </tr>
                            <tr>
                                <th style="vertical-align: top">Requirments:</th>
                                <td rowspan="1">
                                    <textarea name="requirment" value="<%=rs.getString(2)%>" id="" cols="20" rows="3"><%=rs.getString(2)%></textarea>
                                </td>
                            </tr>
                            <tr><th colspan="1" width="70%">Company Details:</th><td width="30%"><a href="<%=rs.getString(6)%>" target="_blank" style="font-weight: 600">See Details</a></td></tr>
                        </table>
                        <div class="custom-file mt-3">
                            <input
                                type="file"
                                name="cdetails"
                                class="custom-file-input"
                                id="customFile"
                                />
                            <label class="custom-file-label" for="customFile">Update Company Details</label>
                        </div>
                </form>
            </div>
            <div
                class="card-footer"
                style="background: inherit; border-color: inherit; display: flex;justify-content: space-between"
                >
                <a href="deletejob.jsp?id=<%=rs.getString(1)%>" class="button raise" style="background-color: red">Delete</a>
                <a href="#" class="button raise btn-success" onclick="check()">Update</a>
            </div>
        </div>
        <%}%>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script>
                    function check() {
                        let val = document.getElementById("customFile").value;
                        let frm = document.getElementById("myForm");
                        if (val == '') {
                            frm.removeAttribute("enctype");
                            frm.action = "updatejdetailsact.jsp";
                        } else {
                            frm.action = "updatejob";
                        }
                        frm.submit()
                    }
    </script>
    <script>
        // Add the following code if you want the name of the file appear on select
        $(".custom-file-input").on("change", function () {
            var fileName = $(this)
                    .val()
                    .split("\\")
                    .pop();
            $(this)
                    .siblings(".custom-file-label")
                    .addClass("selected")
                    .jsp(fileName);
        });
    </script>
</body>
</html>
