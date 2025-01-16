<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/DashBoard.css">



</head>
<body>
<div class="dashboard-container">
    <nav class="sidebar">
        <img id="dashimg" src="Image/62d47950534f8f40eee92dde6f3dfb95-removebg-preview.png" alt="Dashboard Logo">

        <div class="admin-Access">
            <a href="javascript:void(0);" onclick="loadPage('UserProfile.jsp')"><button>User Profile Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('Cart.jsp')"><button>Shopping Cart</button></a>
            <a href="javascript:void(0);" onclick="loadPage('Categories.jsp')"><button>Products</button></a>
            <a href="javascript:void(0);" onclick="loadPage('ProductMangemt.jsp')"><button>Product Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('CategoryManagemt.jsp')"><button>Category Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('Users-List.jsp')"><button>User Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('order_details.jsp')"><button>View Order Placement</button></a>
            <a href="index.jsp"><button id="logOut">Log Out</button></a>
        </div>
    </nav>

    <main id="main-content">
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
    </main>
</div>

<script src="js/jquery-3.7.1.min.js"></script>
<script>
    function loadPage(page) {
        const contentArea = document.getElementById('main-content');
        const xhr = new XMLHttpRequest();
        xhr.open('GET', page, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                contentArea.innerHTML = xhr.responseText;
                contentArea.style.overflowY = 'auto';
            } else {
                contentArea.innerHTML = '<p>Error loading page</p>';
            }
        };
        xhr.send();
    }
</script>

<script src="../https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
