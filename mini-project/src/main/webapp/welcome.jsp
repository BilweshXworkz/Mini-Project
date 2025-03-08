<%@ page language="java" contentType="text/html; charset=US-ASCII"
        pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>X-Workz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
        .navbar {
            height: 70px; /* Fixed height */
          }

          .nav-item img {
            width: 40px; /* Adjust width */
            height: 40px; /* Adjust height */
            border-radius: 50%; /* Optional: Make circular */
          }

          .dropdown-menu {
            position: absolute !important;
            top: 100%; /* Ensures it opens below the navbar */
            left: auto;
            right: 0;
            z-index: 1050; /* Ensures it appears on top */
          }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#"> <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="" width="125" height="70"></a>
       <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
                 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                   <img src = "https://img.icons8.com/?size=50&id=65342&format=png&color=000000" alt = "">
                 </a>
                 <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                   <li><a class="dropdown-item" href="fetchByEmail?emailId=${user.emailId}">Edit Profile</a></li>
                   <li><a class="dropdown-item" href="#">Another action</a></li>
                   <li><hr class="dropdown-divider"></li>
                   <li><a class="dropdown-item" href="#">Something else here</a></li>
                 </ul>
            </li>
           </ul>
    </div>
  </div>
</nav>
<h2 class="me-2 mt-5"><center> Welcome TO The Main Page ${user.name}</center></h2>
</body>
</html>
