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
                height: 115vh; /* Adjust height */
                padding-top:100px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional: for better appearance */
            }
        </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="" width="125" height="70" class="me-2">
    </a>
    <li class="nav-item">
       </ul>
          <form class="d-flex" action="">
              <a class="nav-link btn-outline-light me-2 px-3 text-info" href="signin">Sign Up</a>
               <a class="nav-link btn-primary px-3 text-dark fw-bold" href="index">Home</a>
          </form>
       </li>
  </div>
</nav>
<c:if test="${not empty error}">
    <h4 style="color: black;"><center>${error}</center><h4>
</c:if>
<div class="d-flex justify-content-center align-items-center mt-5">
<div class="card custom-card">
    <div class="card-body">
        <h4 class="card-title text-center">User Registration</h4>
        <form action="addUser" method="post">
            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control">

                <label class="form-label">Phone Number</label>
                <input type="text" name="phoneNumber" class="form-control">

                <label class="form-label">Email Id</label>
                <input type="text" name="emailId" class="form-control">

                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control">

                <label class="form-label">Confirm Password</label>
                <input type="password" name="conformPassword" class="form-control">

                <label class="form-label">Location</label>
                <input type="text" name="location" class="form-control">

                <label form="form-label">Gender </label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="Female" checked>
                        <label class="form-check-label" for="female">Female</label>
                    </div><br>

                <label class="form-label">Age</label>
                <input type="text" name="age" class="form-control">

                <label class="form-label">DOB</label>
               <input type="date" name="date" class="form-control">
            </div>
            <div class="mb-3 text-center">
                <button type="submit" class="btn btn-primary mt-3">Submit</button>
            </div>
        </form>
    </div>
</div>
</div>
</body>
</html>
