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
    @media screen and (max-width: 600px) {
      table, th, td {
        font-size: 0.9em;
      }
    }
    .btn-delete {
      padding: 10px 20px;
      font-size: 1em;
      color: #fff;
      background-color: #dc3545;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.3s ease;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .btn-delete:hover {
      background-color: #c82333;
      transform: scale(1.05);
    }

    .btn-delete:active {
      background-color: #bd2130;
      transform: scale(1);
    }

    .toggle-button {
      padding: 10px 20px;
      font-size: 14px;
      border: none;
      border-radius: 25px;
      cursor: pointer;
      transition: background-color 0.3s ease, color 0.3s ease;
      background-color: #f44336;
      color: white;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Product List</h1>
  <table class="table table-striped">
    <thead>
    <tr>
      <th>Product ID</th>
      <th>Name</th>
      <th>Description</th>
      <th>Price</th>
      <th>Stock Quantity</th>
      <th>Category ID</th>
      <th>Image</th>
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
        ResultSet rs = stmt.executeQuery("SELECT * FROM products");

        if (rs.next()) {
          do {
    %>
    <tr>
      <td><%= rs.getInt("product_id") %></td>
      <td><%= rs.getString("product_name") %></td>
      <td><%= rs.getString("description") %></td>
      <td><%= rs.getDouble("price") %></td>
      <td><%= rs.getInt("stock_quantity") %></td>
      <td><%= rs.getInt("category_id") %></td>
      <td>
        <% String imgFileName = rs.getString("product_img");
          if (imgFileName != null && !imgFileName.isEmpty()) { %>
        <img src="img/<%= imgFileName %>" alt="Product Image" onclick="showImagePopup('img/<%= imgFileName %>')">
        <% } else { %>
        No image available
        <% } %>
      </td>
      <td>
        <form action="product-Delete" method="post" style="display:inline;">
          <input type="hidden" name="id" value="<%= rs.getInt("product_id") %>">
          <button type="submit" class="btn-delete" onclick="return confirm('Are you sure you want to delete this Product? This action cannot be undone.');">Delete</button>
        </form>
      </td>
    </tr>
    <%
      } while (rs.next());
    } else {
    %>
    <tr>
      <td colspan="7" class="no-data">No Products available.</td>
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
      <td colspan="7" class="text-danger text-center">Error fetching products.</td>
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
<script>  function confirmDelete(userId) {
  return confirm('Are you sure you want to delete this Product? This action cannot be undone.');
}</script>
</body>
</html>
