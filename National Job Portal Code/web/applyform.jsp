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
        <link rel="stylesheet" href="stylesheets/loginstyle.css" />
        <link rel="stylesheet" href="stylesheets/animate.css" />
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
                background: linear-gradient(
                    to right,
                    #4b00e0da,
                    #8d2de2de
                    ); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
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
        <%
            String recruiter = request.getParameter("recruiter");
            String cname = request.getParameter("cname");
            String jrole = request.getParameter("jrole");
        %>
        <br />
        <div class="container-fluid">
            <div class="box zoomInDown animated hide">
                <h2>Application Form</h2>
                <form action="apply" method="POST" enctype="multipart/form-data">
                    <input type="hidden" value="<%=recruiter%>" name="recruiter">
                    <input type="hidden" value="<%=cname%>" name="cname">
                    <input type="hidden" value="<%=jrole%>" name="jrole">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Name</label>
                            <input
                                type="text"
                                class="form-control"
                                id="inputEmail4"
                                name="name"
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Date Of Birth</label>
                            <input
                                type="date"
                                name="dob"
                                class="form-control"
                                id="inputPassword4"
                                />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mob">Contact Number</label>
                            <input type="text" class="form-control" id="mob" name="mob" />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="mob">Alternative Contact Number</label>
                            <input type="text" class="form-control" id="mob" name="mob1" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="cname">Qualification</label>
                            <input
                                type="text"
                                class="form-control"
                                name="qualification"
                                id="cname"
                                value=""
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Highest Degree</label>
                            <input
                                type="text"
                                class="form-control"
                                name="hdegree"
                                id="address"
                                required
                                />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="cname">Percentage</label>
                            <input
                                type="text"
                                class="form-control"
                                name="percentage"
                                id="percent"
                                value=""
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Passed Out Year</label>
                            <input
                                type="text"
                                class="form-control"
                                name="passedyear"
                                id="poutyear"
                                required
                                />
                        </div>
                    </div>
                    <div class="form-row" style="width: 70%;margin: auto">
                        <div class="custom-file mb-3">
                            <input
                                type="file"
                                name="resume"
                                class="custom-file-input"
                                id="customFile"
                                style="cursor: pointer"
                                required
                                />
                            <label class="custom-file-label" for="customFile"
                                   >Upload Resume</label
                            >
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="button raise" style="width:150px">
                            Apply
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <br />
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
