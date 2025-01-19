<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/15/2025
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

<title>Product List</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
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
  .error-message {
    color: red;
    font-size: 1.2em;
    text-align: center;
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
  @media screen and (max-width: 600px) {
    table, th, td {
      font-size: 0.9em;
    }
  }
</style>
</head>
<body>
<div class="container">
  <h1>Product List</h1>
  <table class="user-table" align="center">
    <thead>
    <tr>
      <th>Product ID</th>
      <th>Product Name</th>
      <th>Description</th>
      <th>Price</th>
      <th>Stock Quantity</th>
      <th>Category ID</th>
      <th>Product Image</th>

    </tr>
    </thead>
    <tbody>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM products");



        if (rs.next()) {
          do {
            int stockQuantity = rs.getInt("stock_quantity");
    %>
    <tr>
      <td><%= rs.getInt("product_id") %></td>
      <td><%= rs.getString("product_name") %></td>
      <td><%= rs.getString("description") %></td>
      <td><%= rs.getDouble("price") %></td>
      <td><%= stockQuantity %></td>
      <td><%= rs.getInt("category_id") %></td>
      <td>
        <img src="<%= rs.getString("product_img") %>" alt="Product Image" style="width: 100px; height: auto;">
      </td>
  <%--    <td>
        <% if (stockQuantity > 0) { %>
&lt;%&ndash;
        <button type="submit" class="btn btn-primary" name="add_to_cart">Add to Cart</button>
&ndash;%&gt;
        <% } else { %>
        <span class="text-danger">Out of Stock</span>
        <% } %>
      </td>--%>
    </tr>

    <%
      } while (rs.next());
    } else {
    %>
    <tr>
      <td colspan="6" class="no-data">No Products available.</td>
    </tr>
    <%
        }
        rs.close();
        stmt.close();
        con.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
    </tbody>

  </table>



</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
