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
  </head>
      <%
        if (request.getParameter("msg") != null) {%>
    <script>alert('Job Added...');</script>
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
        <li class="active">
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

    <!-- Registration Form -->
    <div class="container-fluid">
      <div class="box zoomInDown animated hide">
        <h2 style="text-decoration: underline">Add Job Description</h2>
        <form action="addjob" method="POST" enctype="multipart/form-data">
          <input id="utype" type="hidden" name="utype" />
          <div class="inputBox">
            <input type="text" name="requirment" required value="" />
            <label>Requirments</label>
          </div>
          <div class="inputBox">
            <input type="text" name="jrole" required value="" />
            <label>Job Role</label>
          </div>
          <div class="inputBox">
            <input
              type="text"
              id="pkg"
              class="mb-2"
              name="package"
              value=""
              required
            />
            <label>Package</label>
          </div>
          <div class="custom-file mt-3">
            <input
              type="file"
              name="cdetails"
              class="custom-file-input"
              id="customFile"
              required
            />
            <label class="custom-file-label" for="customFile"
              >Company Details</label
            >
          </div>
          <input type="submit" class="raise mt-4" value="Add" />
        </form>
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
