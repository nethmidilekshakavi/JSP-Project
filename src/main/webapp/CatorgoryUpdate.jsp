<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/15/2025
  Time: 1:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category Update</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="css/CategoryUpdatePage.css">
</head>
<body>

<h1>Category Update</h1>

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

<!-- Category Form -->
<form action="category-update" method="post">
  <label for="categoryId">Category ID:</label>
  <input type="text" id="categoryId" name="Cid" required><br><br>

  <label for="categoryName">Category Name:</label>
  <input type="text" id="categoryName" name="name" required><br><br>

  <label for="categoryDescription">Description:</label>
  <input type="text" id="categoryDescription" name="Cdesc" required><br><br>

  <button type="submit" style="background-color: yellow" >Update Customer</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
