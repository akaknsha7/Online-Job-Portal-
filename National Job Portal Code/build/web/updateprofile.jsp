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
            href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
            />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="stylesheets/footerstyle.css" />
        <link rel="stylesheet" href="stylesheets/loginstyle.css" />
        <style>
            body {
                color: white;
                background-image: radial-gradient(
                    circle farthest-corner at 10% 20%,
                    rgba(69, 86, 102, 1) 0%,
                    rgba(34, 34, 34, 1) 90%
                    );
            }
            .box {
                width: 600px;
                margin-bottom: 100px;
                overflow: hidden;
                /* border: 5px double transparent;
                outline: 5px double transparent; */
                border-top-left-radius: 100px;
                border-top-right-radius: 0;
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 100px;
                /* border-left-color: transparent; */
            }
            label {
                font-family: "Courgette", cursive;
                color: whitesmoke;
                text-decoration: underline;
            }
            ::placeholder {
                color: rgb(179, 174, 174) !important;
            }
            input {
                font-family: "Oleo Script Swash Caps", cursive;
                font-size: 18px;
                background-color: rgba(255, 255, 255, 0.63) !important;
                color: rgb(0, 0, 0) !important;
                border: none !important;
            }
            input:focus {
                box-shadow: none !important;
            }
            .form-control {
                background-color: transparent;
                color: white;
                border: none;
            }
            .box {
                background: linear-gradient(to right,#4b00e0da,#8d2de2de); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            }
            /*Image*/
            .container1 {
                position: relative;
                text-align: center;
                /* pointer-events: none; */
            }

            .image {
                display: inline-block;
                width: 400px;
                height: 200px;
                transition: 0.5s ease;
                backface-visibility: hidden;
                cursor: pointer;
            }

            .middle {
                transition: 0.5s ease;
                opacity: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                text-align: center;
            }

            .image:hover {
                opacity: 0.5;
            }

            .container1:hover .middle {
                opacity: 1;
                background-color: rgba(255, 255, 255, 0.1);
            }
        </style>
    </head>
    <% if (request.getParameter("msg") != null) {%>
    <script>alert('Updated Successfully...');</script>
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
                <li class="active">
                    <a href="updateprofile.jsp">Update Profile</a>
                </li>
                <li>
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
        <%
            String user = session.getAttribute("username").toString();
            System.out.println(user);
            Connection con = databasecon.getconnection();
            PreparedStatement pst = con.prepareStatement("select * from user where username='" + user + "'");
            ResultSet rs = pst.executeQuery();
            String name = null;
            String pwd = null;
            String email = null;
            String gender = null;
            String college = null;
            String icard = null;
            String add = null;
            if (rs.next()) {
                name = rs.getString(4);
                pwd = rs.getString(3);
                email = rs.getString(2);
                gender = rs.getString(5);
                college = rs.getString(6);
                add = rs.getString(7);
                icard = rs.getString(8);;
            }
        %>
        <br />
        <div class="container-fluid">
            <div class="box zoomInDown animated hide">
                <form id="updt" action="update" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="utype" value="user">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Name</label>
                            <input type="text" class="form-control" id="inputEmail4" name="name" value="<%=name%>"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Password</label>
                            <input
                                type="password" name="password" class="form-control" id="inputPassword4" value="<%=pwd%>"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="email">Email Id</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%=email%>" placeholder=""/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="customRadio">Gender</label><br />
                            <div class="custom-control custom-radio custom-control-inline ml-2">
                                <input type="radio" class="custom-control-input" id="customRadio" name="gender" value="Male"/>
                                <label class="custom-control-label" for="customRadio">Male</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" class="custom-control-input" id="customRadio2" name="gender" value="Female"/>
                                <label class="custom-control-label" for="customRadio2">Female</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="cname">Phone</label>
                            <input type="text" class="form-control" name="college" id="cname" value="<%=college%>"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" name="address" id="address" value="<%=add%>" required />
                        </div>
                    </div>
                    <div class="form-row" style="width: 70%;margin: auto">
                        <div class="custom-file mb-3">
                            <input type="file" name="icard" class="custom-file-input" id="customFile" style="cursor: pointer"/>
                            <label class="custom-file-label" for="customFile">Upload resume</label>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" onclick="check()" class="button raise">Update</button>
                    </div>
                </form>
            </div>
        </div>
        <script>
                    let male = document.getElementById("customRadio");
                    let female = document.getElementById("customRadio2");        
        </script>
        <%if (gender.equals("Male")) {%>
        <script>
                    male.checked = "true";
                    console.log(male);        
        </script>
        <%} else if (gender.equals("Female")) {%>
        <script>
                    female.checked = "true";
                    console.log(female);        4
       </script>
        <%}%>
        <script>
                    function check() {
                    let val = document.getElementById("customFile").value;
                            let frm = document.getElementById("updt");
                            if (val == '') {
                    frm.removeAttribute("enctype");
                            frm.action = "updateact.jsp";
                    } else {
                    frm.action = "update";
                    }
                    }
        </script>
    </body>
</html>
