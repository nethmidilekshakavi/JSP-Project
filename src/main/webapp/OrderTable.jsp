<%@ page import="java.sql.*" %>
<%@ page import="com.example.lk.ijse.LoginServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* your existing styles */
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
                // Check if user_id is in session
                int uid = LoginServlet.useriD;
{
                    // User is logged in, proceed with the query
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
                    String query = "SELECT * FROM cart WHERE user_id = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setInt(1, uid);
                    ResultSet rs = ps.executeQuery();

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
            <td colspan="9" class="no-data">No Products available.</td>
        </tr>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            }
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

<script>
    // JavaScript function to show an image in a popup
    function showImagePopup(imageSrc) {
        const popup = window.open("", "_blank", "width=600,height=400");
        popup.document.write(`<img src="${imageSrc}" style="width:100%;height:auto;">`);
    }
</script>

</body>
</html>
