<%@ page import="com.example.lk.ijse.Entity.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/15/2025
  Time: 12:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9; /* Light grey background for the page */
      margin: 0;
      padding: 0;
    }

    h1, h2 {
      text-align: center;
      color: #333;
    }

    form {
      background-color: #ffffff;
      padding: 15px;
      margin: 20px auto;
      width: 60%;  /* Adjust width to make the form more compact */
      max-width: 500px;  /* Slightly smaller max width */
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    label {
      font-size: 14px;  /* Smaller label font */
      color: #333;
      margin-right: 10px;
      display: inline-block;
      margin-bottom: 5px;
    }

    input {
      width: 100%;
      padding: 8px;  /* Smaller padding */
      font-size: 12px;  /* Smaller font size */
      border-radius: 5px;
      border: 1px solid #ddd;
      margin-bottom: 10px;
      box-sizing: border-box;
      background-color: #f9f9f9;
    }

    input:focus {
      border-color: #007bff;
      outline: none;
      background-color: #e9f1ff;
    }

    button {
      background-color: #28a745; /* Popular green color */
      color: white;
      padding: 8px 16px;  /* Smaller padding */
      font-size: 14px;  /* Smaller font size */
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #218838; /* Darker green on hover */
    }

    /* Category Table Styling */
    .category-table {
      width: 100%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: #ffffff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .category-table th, .category-table td {
      padding: 12px;
      text-align: left;
      border: 1px solid #ddd;
    }

    .category-table th {
      background-color: #007bff; /* Blue header for table */
      color: white;
      font-size: 18px;
    }

    .category-table td {
      font-size: 16px;
      color: #333;
    }

    .category-table tr:hover {
      background-color: #f1f1f1;
    }

    .category-table button {
      background-color: #007bff; /* Blue color for action buttons */
      padding: 5px 10px;
      font-size: 14px;
      border: none;
      color: white;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .category-table button:hover {
      background-color: #0056b3; /* Darker blue on hover */
    }

    .category-table form {
      display: inline-block;
      margin-right: 10px;
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

<h1>Category Management</h1>

<!-- Category Form -->
<form action="product-save" method="post" id="form">
  <label for="productId">Product ID:</label>
  <input type="text" id="productId" name="pid" required><br><br>

  <label for="categoryName">Product Name:</label>
  <input type="text" id="categoryName" name="name" required><br><br>

  <label for="categoryDescription">Description:</label>
  <input type="text" id="categoryDescription" name="desc" required><br><br>

  <label for="price">Price:</label>
  <input type="text" id="price" name="price" required><br><br>

  <label for="stockqty">Stock Quantity:</label>
  <input type="text" id="stockqty" name="qty" required><br><br>

  <label for="caid">category ID:</label>
  <input type="text" id="caid" name="cid" required><br><br>

  <button type="submit" name="action" value="addCategory">Add Product</button>
</form>


<%
  List<Category> categoryList = (List<Category>) request.getAttribute("categories");
  if (categoryList != null && !categoryList.isEmpty()) {
%>

<!-- Category Table -->
<h2>Existing Categories</h2>
<table class="category-table">
  <thead>
  <tr>
    <th>Category ID</th>
    <th>Category Name</th>
    <th>Description</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody id="Category_Table">

  <%
    for(Category category : categoryList){
  %>
  <tr>
    <td><%=category.getCategory_id()%></td>
    <td><%=category.getCategory_name()%></td>
    <td><%=category.getDesc()%></td>
    <td>
      <form action="categoryManager" method="post" style="display:inline;">
        <input type="hidden" name="categoryId" value="${category.categoryId}">
        <button type="submit" name="action" value="editCategory">Edit</button>
      </form>
      <form action="categoryManager" method="post" style="display:inline;">
        <input type="hidden" name="categoryId" value="${category.categoryId}">
        <button type="submit" name="action" value="deleteCategory">Delete</button>
      </form>
    </td>
  </tr>
  <%
    }
  %>

  </tbody>
</table>

<% } %>

</body>
</html>
