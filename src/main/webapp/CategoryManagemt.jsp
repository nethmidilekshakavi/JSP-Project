<%@ page import="com.example.lk.ijse.Entity.categories" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Category Management</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="css/CatgoryManagemt.css">

  <style>
    /* Modal Styles */
    #addCategoryModal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    .modal-content {
      background-color: #fefefe;
      margin: 15% auto; /* 15% from the top and centered */
      padding: 20px;
      border: 1px solid #888;
      width: 80%; /* Could be more or less, depending on screen size */
    }
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }
    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
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

<%--
<button type="button" class="btn-view" style="background-color:#71b7e6; width: 300px; display: block; margin: 10px auto;" onclick="showModal()">Add Category</button>
--%>

<%--<div id="addCategoryModal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>--%>
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
<%--  </div>
</div>--%>

<div class="button-set" id="button-set">
  <a href="CategoryList.jsp">
    <button type="button" class="btn-view" style="background-color:#71b7e6; width: 300px; display: block; margin: 10px auto;">View Table</button>
  </a>
  <a href="CatorgoryUpdate.jsp">
    <button type="button" class="btn-update" style="background-color: orange; width: 300px; display: block; margin: 10px auto;">Update</button>
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
  List<categories> categoryList = (List<categories>) request.getAttribute("categories");
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
  <% for (categories category : categoryList) { %>
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

<script>
  function showModal() {
    var modal = document.getElementById('addCategoryModal');
    modal.style.display = 'block';
  }
  function closeModal() {
    var modal = document.getElementById('addCategoryModal');
    modal.style.display = 'none';
  }

  window.onclick = function(event) {
    var modal = document.getElementById('addCategoryModal');
    if (event.target == modal) {
      modal.style.display = 'none';
    }
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
