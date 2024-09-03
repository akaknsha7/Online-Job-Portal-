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
      <%
        if (request.getParameter("msg") != null) {%>
    <script>alert('Test Added Successfully...');</script>
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
        <li><a href="adminhome.jsp">Home</a></li>
        <li>
          <a href="users.jsp?utype=user">View Users</a>
        </li>
        <li>
          <a href="users.jsp?utype=recruiter">View Recruiters</a>
        </li>
        <li class="active">
          <a href="addtest.jsp">Add Test Links</a>
        </li>
        <li>
          <a href="index.jsp">Logout</a>
        </li>
      </ul>
    </section>

    <!-- Login Form -->
    <div class="container-fluid">
      <div class="box jackInTheBox animated hide">
        <h2>Add Test Links</h2>
        <form action="addtestact.jsp">
          <input id="utype" type="hidden" name="utype" />
          <div class="inputBox">
            <input type="text" name="sub" required value="" />
            <label>Subject Name</label>
          </div>
          <div class="inputBox">
            <input
              type="text"
              id="pwd"
              class="mb-2"
              name="link"
              value=""
              required
            />
            <label>Link</label>
          </div>
          <input type="submit" class="raise mt-3" value="Add" />
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
