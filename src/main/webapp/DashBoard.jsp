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
<div class="dashboard-container">
    <nav class="sidebar">

        <h2 id="db">DashBoard</h2>
<h6> Welcome to our **E-Commerce Platform**! <br> Explore products, manage your cart, and enjoy a seamless shopping experience.
    <br> Admins can efficiently handle products, orders, <br> and users for smooth operations. Happy shopping!
</h6>
        <img id="dashimg" src="Image/62d47950534f8f40eee92dde6f3dfb95-removebg-preview.png" alt="">
        <ul>
            <li><a href="viewProducts.jsp">Manage Products</a></li>
            <li><a href="viewCategories.jsp">Manage Categories</a></li>

            <li><a href="viewOrders.jsp">View Orders</a></li>

            <li><a href="Users-List.jsp">Manage Users</a></li>
        </ul>
        <a href="index.jsp"><button id="logOut">Log Out</button></a>
    </nav>
    <main>
        <h2>Dashboard Overview</h2>
        <div class="cards">
            <div class="card">
                <h3>Total Products</h3>
                <p>100</p>
            </div>
            <div class="card">
                <h3>Total Orders</h3>
                <p>250</p>
            </div>
            <div class="card">
                <h3>Total Users</h3>
                <p>500</p>
            </div>
            <div class="card">
                <h3>Pending Orders</h3>
                <p>15</p>
            </div>
        </div>
    </main>

</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
