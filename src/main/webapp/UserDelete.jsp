<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/16/2025
  Time: 7:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Delete</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="css/CategoryUpdatePage.css">
</head>
<body>


<%
  String msg = request.getParameter("message");
  String error = request.getParameter("error");
%>

<% if (msg != null) { %>
<script>
  Swal.fire({
    icon: 'success',
    title: 'Success!',
    text: '<%= msg %>',
    showConfirmButton: true,
    timer: 3000
  });
</script>
<% } %>

<% if (error != null) { %>
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

<form action="deletebyUser" method="post">
  <label for="username">Enter Your  Username:</label>
  <input type="text" id="username" name="username" required><br><br>

  <label for="password">Enter Your  Password:</label>
  <input type="text" id="password" name="password" required><br><br>

  <button type="submit" style="background-color: red" >Delete Your Account</button>
</form>



</body>
</html>
