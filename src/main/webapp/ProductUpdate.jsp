<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/15/2025
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Update</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="css/CategoryUpdatePage.css">

  <style>
    body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 0; }
    h1, h2 { text-align: center; color: #333; }
    form { background-color: #ffffff; padding: 15px; margin: 20px auto; width: 60%; max-width: 500px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); border-radius: 8px; }
    label { font-size: 14px; color: #333; margin-right: 10px; display: inline-block; margin-bottom: 5px; }
    input, select { width: 100%; padding: 8px; font-size: 12px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 10px; box-sizing: border-box; background-color: #f9f9f9; }
    input:focus, select:focus { border-color: #007bff; outline: none; background-color: #e9f1ff; }
    button { background-color: #28a745; color: white; padding: 8px 16px; font-size: 14px; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease; }
    button:hover { background-color: #218838; }
  </style>

</head>
<body>

<h1>Product Update</h1>

<%
  String msg = request.getParameter("message");
  String error = request.getParameter("error");

  if (msg != null) {
%>
<script>
  Swal.fire({
    icon: 'success',
    title: 'Success!',
    text: '<%= msg %>',
    showConfirmButton: true,
    timer: 3000
  });
</script>
<% } else if (error != null) { %>
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

<!-- Product Form -->
<form action="product-Update
" method="post">
  <label for="productId">Product ID:</label>
  <input type="text" id="productId" name="pid" required><br>

  <label for="productName">Product Name:</label>
  <input type="text" id="productName" name="name" required><br>

  <label for="description">Description:</label>
  <input type="text" id="description" name="desc" required><br>

  <label for="price">Price:</label>
  <input type="text" id="price" name="price" required><br>

  <label for="qty">Stock Quantity:</label>
  <input type="text" id="qty" name="qty" required><br>

  <label for="cid">Category:</label>
  <select id="cid" name="cid" required>
    <option value="">Select</option>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT category_id, category_name FROM categories");
        while (rs.next()) {
    %>
    <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("category_id") %></option>
    <%
        }
        rs.close();
        stmt.close();
        con.close();
      } catch (Exception e) {
        System.out.println("Error loading categories: " + e.getMessage());
      }
    %>
  </select>

  <button type="submit" style="background-color: yellow">Update Product</button>
</form>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
  $(document).ready(function() {
    function getCategories() {
      $.ajax({
        type: "GET",
        url: "get_Category.jsp",
        dataType: "JSON",
        success: function(data) {
          var categoryDropdown = $('#cid');
          categoryDropdown.empty().append('<option value="">Select</option>');
          $.each(data, function(index, item) {
            categoryDropdown.append($('<option/>', {
              value: item.category_id,
              text: item.category_name
            }));
          });
        },
        error: function(xhr, status, error) {
          console.error("Error: " + error);
        }
      });
    }

    getCategories();
  });
</script>
</body>
</html>
