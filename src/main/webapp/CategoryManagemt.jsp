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

<div class="button-set" id="button-set">
  <a href="CategoryList.jsp">
    <button type="button" class="btn-view" style="background-color:#71b7e6; width: 300px; display: block; margin: 10px auto;">View Table</button>
  </a>
  <a href="CatorgoryUpdate.jsp">
    <button type="button" class="btn-update" style="background-color: orange; width: 300px; display: block; margin: 10px auto;">Update</button>
  </a>
  <a href="CategoryDelete.jsp">
    <button type="button" class="btn-delete" style="background-color: red; width: 300px; display: block; margin: 10px auto;">Delete</button>
  </a>
</div>

<div id="img">
  <img src="Image/Categories/clothes/a23c134ebdc47581fa854c248633a8f5.jpg" alt="">
  <img src="Image/Categories/Footwear/248c1bb6beb29fa0c9f7f00ec4d8881a.jpg" alt="">
  <img src="Image/Categories/Furniture/3ec58fd41bb26d66150e8b63c8b03d0d.jpg" alt="">
  <img src="Image/Categories/Eeletronic/dbccb776620d025ab9b9fe5218b64a83.jpg" alt="">
  <img src="Image/Categories/Sports/61fa1cfd34c4379f2765f241dbcf8381.jpg" alt="">
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
