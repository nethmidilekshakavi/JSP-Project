<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
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
        <h3 id="h3">Welcome to RFashion</h3>

        <img id="dashimg" src="Image/62d47950534f8f40eee92dde6f3dfb95-removebg-preview.png" alt="Dashboard Logo">

        <div class="admin-Access">
            <a href="javascript:void(0);" onclick="loadPage('ProductMangemt.jsp')"><button>Product Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('CategoryManagemt.jsp')"><button>Category Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('Users-List.jsp')"><button>User Management</button></a>
            <a href="javascript:void(0);" onclick="loadPage('OrderDetails.jsp')"><button>View Order Placement</button></a>
            <a href="index.jsp"><button id="logOut">Log Out</button></a>
        </div>
    </nav>

    <main id="main-content">



        <div class="container1" style="color: #9b59b6">  <div class="date-time"> <% Date now = new Date(); SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM dd, yyyy 'at' HH:mm:ss"); String formattedDate = dateFormatter.format(now); %> <p>Current Date and Time: <%= formattedDate %></p> </div> </div>


        <div class="cards">
            <div class="card">
                <h3>Total Products</h3>
                <p>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS total_products FROM products");
                            if (rs.next()) {
                                int totalProducts = rs.getInt("total_products");
                    %>
                    <%= totalProducts %>
                    <%
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                        } catch (Exception e) {
                            System.out.println("Error loading product count: " + e.getMessage());
                        }
                    %>
                </p>
            </div>



        <div class="card">
                <h3>Total Users</h3>
                <p> <p>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS total_users FROM Users");
                    if (rs.next()) {
                        int totalProducts = rs.getInt("total_users");
            %>
            <%= totalProducts %>
            <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    System.out.println("Error loading users count: " + e.getMessage());
                }
            %>
        </p>


            </div>
            <div class="card">
                <h3>Total Orders</h3>
                <p>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS total_orders FROM Orders");
                        if (rs.next()) {
                            int totalProducts = rs.getInt("total_orders");
                %>
                <%= totalProducts %>
                <%
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        System.out.println("Error loading users count: " + e.getMessage());
                    }
                %>
                </p>

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
