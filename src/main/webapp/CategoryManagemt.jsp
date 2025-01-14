<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Category Management</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
<form action="category-save" method="post" id="form">
  <label for="categoryId">Category ID:</label>
  <input type="text" id="categoryId" name="categoryId" required><br><br>

  <label for="categoryName">Category Name:</label>
  <input type="text" id="categoryName" name="categoryName" required><br><br>

  <label for="categoryDescription">Description:</label>
  <input type="text" id="categoryDescription" name="categoryDescription" required><br><br>

  <button type="submit" name="action" value="addCategory">Add Category</button>
</form>

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
  <tbody>
  <!-- Loop through categories dynamically (assuming 'categories' is a list of categories) -->
  <c:forEach var="category" items="${categories}">
    <tr>
      <td>${category.categoryId}</td>
      <td>${category.categoryName}</td>
      <td>${category.categoryDescription}</td>
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
  </c:forEach>
  </tbody>
</table>

<script src="sweetalert2.all.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
