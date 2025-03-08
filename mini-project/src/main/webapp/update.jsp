<%@ page language="java" contentType="text/html; charset=US-ASCII"
        pageEncoding="US-ASCII"%>
 <%@ page isELIgnored="false" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>X-Workz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
            .form {
                height: 20vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f8f9fa;
            }
            .custom-card {
                width: 40vw;  /* Adjust width */
                height: 95vh; /* Adjust height */
               padding: 20px;
                border-radius: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional: for better appearance */
            }
        </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="" width="125" height="70">
    </a>
    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
    <li class="nav-item">
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
</nav>
<c:if test="${not empty error}">
    <p style="color: black;">${error}</p>
</c:if>
<div class="d-flex justify-content-center align-items-center  mt-5 ">
<div class="card custom-card">
    <div class="card-body">
        <h4 class="card-title text-center">Edit Your Profile</h4>
        <form action="update" method="post">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control" value="${user.getName()}">

                <label class="form-label">Phone Number</label>
                <input type="text" name="phoneNumber" class="form-control" value="${user.getPhoneNumber()}">

                <label class="form-label">Email Id</label>
                <input type="text" name="emailId" class="form-control" value="${user.getEmailId()}">

                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control">

                <label class="form-label">Confirm Password</label>
                <input type="password" name="conformPassword" class="form-control">

                <label class="form-label">Location</label>
                <input type="text" name="location" class="form-control" value="${user.getLocation()}">

                <label class="form-label">Age</label>
                <input type="text" name="age" class="form-control" value="${user.getAge()}">

            </div>
            <div class="mb-3 text-center">
                <button type="submit" value="update" class="btn btn-primary mt-3">Submit</button>
            </div>
        </form>
    </div>
</div>
</div>
</body>
</html>
