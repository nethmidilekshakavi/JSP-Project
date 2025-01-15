<%@ page import="com.example.lk.ijse.Entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Category Management</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="css/CatgoryManagemt.css">


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
<form action="category-save" method="post" id="form">
  <label for="categoryId">Category ID:</label>
  <input type="text" id="categoryId" name="categoryId" required><br><br>

  <label for="categoryName">Category Name:</label>
  <input type="text" id="categoryName" name="categoryName" required><br><br>

  <label for="categoryDescription">Description:</label>
  <input type="text" id="categoryDescription" name="categoryDescription" required><br><br>

  <button type="submit" name="action" value="addCategory">Add Category</button>
</form>

<div id="button-set" class="button-set">
  <a href=""><button type="submit" name="action" value="viewTable" class="btn-view">View Table</button></a>
  <br><br>
  <a href="CatorgoryUpdate.jsp"><button type="submit" name="action" value="update" class="btn-update">Update</button></a>
  <br><br>
  <a href=""><button type="submit" name="action" value="delete" class="btn-delete">Delete</button></a>
</div>




<%
  List<Category> categoryList = (List<Category>) request.getAttribute("categories");
  if (categoryList != null && !categoryList.isEmpty()) {
%>
<table class="category-table">
  <thead>
  <tr>
    <th>Category ID</th>
    <th>Category Name</th>
    <th>Description</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <% for (Category category : categoryList) { %>
  <tr>
    <td><%= category.getCategory_id() %></td>
    <td><%= category.getCategory_name() %></td>
    <td><%= category.getDesc() %></td>
    <td>
      <form action="category-delete" method="post">
        <input type="hidden" name="categoryId" value="<%= category.getCategory_id() %>">
        <button type="submit">Delete</button>
      </form>
      <a href="category-edit?categoryId=<%= category.getCategory_id() %>">
        <button>Edit</button>
      </a>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>
<% } %>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
