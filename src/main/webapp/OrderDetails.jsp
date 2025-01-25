<%@ page import="java.sql.*" %>
<%@ page import="com.example.lk.ijse.LoginServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .order-success {
            color: green;
            font-weight: bold;
        }
        /* Enhanced Styles */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        h1 {
            color: #007bff;
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .order-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .order-btn:hover {
            background-color: #218838;
        }
        .order-success {
            color: green;
            font-weight: bold;
        }
        .no-data {
            color: red;
            font-weight: bold;
            text-align: center;
            padding: 20px;
        }
        .alert-custom {
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .alert-custom.success {
            background-color: #d4edda;
            color: #155724;
        }
        .alert-custom.error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>

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


<div class="container">
    <h1>Cart Details</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Detail ID</th>
            <th>order ID</th>
            <th>user ID</th>
            <th>Time/Date</th>
            <th>Statues</th>
        </tr>
        </thead>
        <tbody>

        <%
            try {
                // Check if user_id is in session
                int uid = LoginServlet.useriD;
                // User is logged in, proceed with the query
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
                String query = "SELECT * FROM orders ;";
                PreparedStatement ps = con.prepareStatement(query);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    do {
        %>
        <tr>
            <form action="OrderDetails" method="post">
                <td><input type="hidden" name="detailID" value="<%= rs.getInt("id") %>"><%= rs.getInt("id") %></td>
                <td><input type="hidden" name="order_id" value="<%= rs.getInt("order_id") %>"><%= rs.getInt("order_id") %></td>
                <td><input type="hidden" name="user_id" value="<%= rs.getInt("user_id") %>"><%= uid %></td>
                <td><input type="hidden" name="added_at" value="<%= rs.getString("order_date") %>"><%= rs.getString("order_date") %></td>
                <td><input type="hidden" name="status" value="<%= rs.getString("status") %>"><%= rs.getString("status") %></td>
            </form>
        </tr>
        <%
            } while (rs.next());
        } else {
        %>
        <tr>
            <td colspan="9" class="no-data">No Products available.</td>
        </tr>
        <%
            }
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        %>
        <tr>
            <td colspan="9" class="text-danger text-center">Error fetching products.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>



</body>
</html>
