<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/15/2025
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category Delete</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="css/CategoryUpdatePage.css">
</head>
<body>

<h1>Category Delete</h1>

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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
