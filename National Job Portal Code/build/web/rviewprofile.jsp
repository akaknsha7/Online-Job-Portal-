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
                border: 5px double white;
                border-radius: 20px;
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
                background-color: rgba(255, 255, 255, 0.1) !important;
                color: white !important;
                border: none !important;
            }
            input:focus {
                box-shadow: none !important;
            }
            .box {
                background-image: radial-gradient(
                    circle 926px at 2.7% 11%,
                    rgba(17, 29, 94, 0.8) 0%,
                    rgba(178, 31, 102, 0.8) 90%
                    );
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
        <%
        if (request.getParameter("msg") != null) {%>
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
                <li><a href="recruiterhome.jsp">Home</a></li>
                <li class="active">
                    <a href="rviewprofile.jsp">Update Profile</a>
                </li>
                <li>
                    <a href="addjob.jsp">Add Job</a>
                </li>
                <li>
                   
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
            PreparedStatement pst = con.prepareStatement("select *from recruiter where username='" + username + "'");
            ResultSet rs = pst.executeQuery();
            String img = null;
            String name = null;
            String pwd = null;
            String email = null;
            String jrole = null;
            String cname = null;
            String cmobile = null;
            String mob = null;
            String add = null;
            if (rs.next()) {
                img = rs.getString(10);
                name = rs.getString(4);
                pwd = rs.getString(3);
                email = rs.getString(2);
                jrole = rs.getString(5);
                cname = rs.getString(6);
                cmobile = rs.getString(7);
                mob = rs.getString(8);
                add = rs.getString(9);

            }
        %> 
        <br />
        <div class="container-fluid">
            <div class="box zoomInDown animated hide">
                <form id="updt" action="update" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="utype" value="recruiter">
                    <div class="card-custom-img">
                        <input type="file" id="profile" value="<%=img%>" name="icard" hidden="" />
                        <div
                            class="container1"
                            for="profile"
                            title="Update"
                            style="cursor:pointer"
                            >
                            <img src="photos\<%=img%>" onclick="update()" class="image img-fluid"/>
                            <div class="middle">
                                <i class="fas fa-edit" onclick="update()" style="font-size: 20px;font-weight: 0;color:rgb(248, 248, 248)"></i>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Name</label>
                            <input type="text" name="name" class="form-control" id="inputEmail4" value="<%=name%>"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Password</label>
                            <input
                                type="password"
                                name="password"
                                class="form-control"
                                id="inputPassword4"
                                value="<%=pwd%>"
                                />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="email">Email Id</label>
                            <input
                                type="email"
                                class="form-control"
                                id="email"
                                name="email"
                                value="<%=email%>"
                                placeholder=""
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="jrole">Job Role</label>
                            <input
                                type="text"
                                class="form-control"
                                id="jrole"
                                name="jobrole"
                                value="<%=jrole%>"
                                placeholder=""
                                />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="cname">Company Name</label>
                            <input type="text" name="company" class="form-control" value="<%=cname%>" id="cname" value="" />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cmob">Company Mobile</label>
                            <input
                                type="text"
                                class="form-control"
                                id="cmob"
                                name="cmobile"
                                value="<%=cmobile%>"
                                required
                                title="Please Enter Valid Mobile Number"
                                />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mob">Mobile Number</label>
                            <input
                                type="text"
                                class="form-control"
                                id="mob"
                                name="pmobile"
                                value="<%=mob%>"
                                title="Please Enter Valid Mobile Number"
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Address</label>
                            <input type="text" name="address" value="<%=add%>" class="form-control" id="address" required />
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" onclick="check()" class="button raise">Update</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- <footer class="footer">
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
        </footer> -->
        <script>
            function check() {
                let val = document.getElementById("profile").value;
                let frm = document.getElementById("updt");
                if (val == '') {
                    frm.removeAttribute("enctype");
                    frm.action = "updateact.jsp";
                } else {
                    frm.action = "update";
                }
            }
        </script>

        <script>
            function update() {
                document.getElementById("profile").click();
            }
        </script>
    </body>
</html>
