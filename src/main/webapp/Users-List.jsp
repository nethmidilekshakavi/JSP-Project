<%@ page import="java.util.List" %>
<%@ page import="com.example.lk.ijse.Entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Table</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/UserTable.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
  List<Admin> dataList = (List<Admin>) request.getAttribute("Users");
  if (dataList != null && !dataList.isEmpty()) {
%>

  <div class="table-container">
    <table class="user-details-table" border="1">
      <thead>
      <tr>
        <th>User ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody id="User-Table">
      <% for (Admin adminDto : dataList) { %>
      <tr>
        <td><%= adminDto.getId() %></td>
        <td><%= adminDto.getName() %></td>
        <td><%= adminDto.getEmail() %></td>
        <td><%= adminDto.getRole() %></td>
      </tr>
      <% } %>
      <% } else { %>
      <p>No users found.</p>
      <% } %>

      <tr>
        <td>hello</td>
        <td>java</td>
        <td>dfghj</td>
        <td>cvbnm</td>
        <td>
          <button class="edit-btn" id="e">Edit</button>
          <button class="delete-btn" id="d">Delete</button>
        </td>
      </tr>
      <!-- Repeat for other users -->
      </tbody>
    </table>
  </div>

<script src="sweetalert2.all.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
