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


        <div class="admin-Access">
            <a href=""><button>Product Management</button></a>
            <a href=""><button>Category Management</button></a>
            <a href=""><button>Order Management</button></a>
            <a href=""><button>User Management</button></a>
        </div>

        <a href="index.jsp"></a><button id="logOut">Log Out</button>
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
        </div>

        <%--Users--%>

        <br><br>

        <div class="user-access">
            <h3>Welcome to the User Dashboard, You Have Access to the Following Features:</h3>
            <a href="Users-List.jsp"><button>User Profile Management</button></a>
            <a href="order_details.jsp"><button>View Order Placement</button></a>
            <a href="Cart.jsp"><button>Shopping Cart</button></a>
            <a href="Categories.jsp"><button>Product Management</button></a>
        </div>


    <%--Admin--%>
    </main>

</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
