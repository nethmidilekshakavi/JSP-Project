<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
        }
        .no-data {
            color: #777;
            font-size: 1.2em;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 1.1em;
        }
        th {
            background-color: #9b59b6;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        img {
            cursor: pointer;
            width: 100px;
            height: auto;
        }
        .order-btn {
            background-color: #28a745;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .order-btn:hover {
            background-color: #218838;
        }
        @media screen and (max-width: 600px) {
            table, th, td {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Cart Details</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Cart ID</th>
            <th>User ID</th>
            <th>Product ID</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Time & Date</th>
            <th>Total</th>
            <th>Size</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>

        <%
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM cart");

                if (rs.next()) {
                    do {
        %>
        <tr>
            <form action="OrderServlet" method="post" enctype="multipart/form-data">
                <td><input type="hidden" name="cart_id" value="<%= rs.getInt("cart_id") %>"><%= rs.getInt("cart_id") %></td>
                <td><input type="hidden" name="user_id" value="<%= rs.getInt("user_id") %>"><%= rs.getInt("user_id") %></td>
                <td><input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>"><%= rs.getInt("product_id") %></td>
                <td><input type="hidden" name="quantity" value="<%= rs.getInt("quantity") %>"><%= rs.getInt("quantity") %></td>
                <td><input type="hidden" name="price" value="<%= rs.getString("price") %>"><%= rs.getString("price") %></td>
                <td><input type="hidden" name="added_at" value="<%= rs.getString("added_at") %>"><%= rs.getString("added_at") %></td>
                <td><input type="hidden" name="total" value="<%= rs.getDouble("total") %>"><%= rs.getDouble("total") %></td>
                <td><input type="hidden" name="product_size" value="<%= rs.getString("product_Size") %>"><%= rs.getString("product_Size") %></td>
                <td><button type="submit" class="order-btn">Order Now</button></td>
            </form>
        </tr>
        <%
            } while (rs.next());
        } else {
        %>
        <tr>
            <td colspan="10" class="no-data">No Products available.</td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <tr>
            <td colspan="10" class="text-danger text-center">Error fetching products.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script>
    // JavaScript function to show an image in a popup
    function showImagePopup(imageSrc) {
        const popup = window.open("", "_blank", "width=600,height=400");
        popup.document.write(`<img src="${imageSrc}" style="width:100%;height:auto;">`);
    }
</script>

</body>
</html>
