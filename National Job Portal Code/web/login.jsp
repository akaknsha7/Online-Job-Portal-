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
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="stylesheets/footerstyle.css" />
        <link rel="stylesheet" href="stylesheets/modalstyle.css" />
        <link rel="stylesheet" href="stylesheets/loginstyle.css" />
        <link rel="stylesheet" href="stylesheets/animate.css" />
    </head>
    <%String utype = request.getParameter("utype");%>
    <body onload="createCaptcha()">
        <section class="top-nav">
            <div class="logo">
                National Job Portal
            </div>
            <input id="menu-toggle" type="checkbox" />
            <label class="menu-button-container" for="menu-toggle">
                <div class="menu-button"></div>
            </label>
            <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
               
                <li id="recruiter">
                    <a href="login.jsp?utype=recruiter">Recruiter</a>
                </li>
                <li id="user"><a href="login.jsp?utype=user">User</a></li>
            </ul>
        </section>

        <!-- Login Form -->
        <div class="container-fluid">
            <div class="box flipInX animated hide">
                <h2>Login</h2>
                <form action="loginact.jsp">
                    <input id="utype" type="hidden" name="utype" />
                    <div class="inputBox">
                        <input type="email" id="uname" name="username" required value="" />
                        <label>Username</label>
                    </div>
                    <div class="inputBox">
                        <input
                            type="password"
                            id="pwd"
                            class="mb-2"
                            name="password"
                            value=""
                            required
                            />
                        <label>Password</label>
                    </div>
                    <div class="text-right">
                        <a
                            href=""
                            id="fp"
                            data-toggle="modal"
                            data-target="#loginModal"
                            style="text-decoration: none;color:white"
                            class="mt-0"
                            >Forgot Password?</a
                        >
                    </div>
                
                    <input
                        type="submit"
                        class="raise"
                        value="Sign In"
                        />
                </form>
                <p class="mt-3 text-center text-white" id="reg">
                    Need an account?
                    <a
                        href="registration.jsp?utype=<%=utype%>"
                        style="color:black;font-weight: 900;font-family: Courgette, cursive;"
                        >Sign up now!</a
                    >
                </p>
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

        <!-- Modal -->
        <div
            class="modal zoomIn animated"
            id="loginModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="box modal-content">
                    <div class="modal-header border-bottom-0">
                        <button
                            type="button"
                            style="color: tomato;font-size: 25px"
                            class="close"
                            data-dismiss="modal"
                            aria-label="Close"
                            >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex flex-column text-center">
                            <form action="getpassword.jsp" method="POST">
                                <input type="hidden" name="utype" value="<%=utype%>">
                                <div class="inputBox">
                                    <input type="email" name="email" required value="" />
                                    <label>Enter Your Email Id</label>
                                </div>
                                <input type="submit" value="Get Password" class="raise" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/cpatcha.js"></script>

        <script>
                    $("#fp").click(function () {
                        $(".hide").hide();
                    });
                    $("#loginModal").on("hidden.bs.modal", function () {
                        $(".hide").css("display", "block");
                    });
                    $(document).ready(function () {
                        $("#cpatchaTextBox").val("");
                        function getUrlVars() {
                            let vars = [],
                                    hash;
                            let hashes = window.location.href
                                    .slice(window.location.href.indexOf("?") + 1)
                                    .split("&");
                            for (let i = 0; i < hashes.length; i++) {
                                hash = hashes[i].split("=");
                                vars.push(hash[0]);
                                vars[hash[0]] = hash[1];
                            }
                            return vars;
                        }
                        let me = getUrlVars()["utype"];
                        if (me === "recruiter") {
                            $("#recruiter").addClass("active");
                            $("#utype").val("recruiter");
                        } else if (me == "user"){
                            $("#user").addClass("active");
                            $("#utype").val("user");
                        } else {
                            $("#admin").addClass("active");
                            $("#fp").hide();
                            $("#reg").hide();
                            $("#uname").prop('type', 'text');
                            $("#utype").val("admin");
                        }
                    });
        </script>
    </body>
</html>
