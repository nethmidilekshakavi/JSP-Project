<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Update Password</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(to top, #71b7e6, #9b59b6);
      margin: 0;
      padding: 0;
    }

    .container {
      width: 50%;
      margin: 50px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease;
    }

    .container:hover {
      transform: scale(1.02);
    }

    h1 {
      text-align: center;
      color: #343a40;
      font-size: 2.5em;
      margin-bottom: 20px;
    }

    form {
      text-align: center;
    }

    input[type="text"], input[type="password"] ,input[type="email"] {
      width: 80%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1.1em;
    }

    input:focus {
      border-color: #007bff;
      outline: none;
      background-color: #f1f8ff;
    }

    button {
      padding: 12px 24px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1.2em;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #0056b3;
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #007bff;
      text-decoration: none;
      font-size: 1.1em;
    }

    .back-link:hover {
      text-decoration: underline;
    }
    #img{
      width: 150px;
      height: 150px;
    }
  </style>
</head>
<body>

<%
  String msg = request.getParameter("message");
  String error = request.getParameter("error");

  if (msg != null) {
%>
<script>
  Swal.fire({
    icon: 'success',
    title: 'Success!',
    text: '<%= msg %>',
    showConfirmButton: true,
    timer: 3000
  });
</script>
<% } else if (error != null) { %>
<script>
  Swal.fire({
    icon: 'error',
    title: 'Error!',
    text: '<%= error %>',
    showConfirmButton: true,
    timer: 3000
  });
</script>
<% } %>

<div class="container">
  <h1>Update Password</h1>
  <form action="user-update" method="post">
    <input type="text" name="userNamee" placeholder="Enter Your User Name ?" required>
    <input type="text" name="userName" placeholder="New User Name" required>
    <input type="text" name="name" placeholder="New Name" required><br><br>
    <input type="email" name="email" placeholder="New Email" required><br><br>
    <input type="text" name="NewPassword" placeholder="New Password" required><br><br>

    <button type="submit">Update</button>
  </form>
  <a href="index.jsp" class="back-link">Back to User Login</a>
 <%-- <img id="img" src="Image/7542f9fec54a3e542986733407971424-removebg-preview.png" alt="">--%>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
