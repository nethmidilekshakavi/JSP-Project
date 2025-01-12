<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/12/2025
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/DashBoard.css">
</head>
<body>
<div class="container">
    <div class="dashboard-header">
        <h1>Admin Dashboard</h1>
        <p>Manage your platform with ease</p>
    </div>

    <div class="button-container">
        <button class="dashboard-btn btn-product">Product Management</button>
        <button class="dashboard-btn btn-category">Category Management</button>
        <button class="dashboard-btn btn-order">Order Management</button>
        <button class="dashboard-btn btn-user">User Management</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
