<%@ page import="java.util.List" %>
<%@ page import="com.example.lk.ijse.Entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User List</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Basic styling for the page */
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

    /* Table styling */
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
      background-color: #4CAF50;
      color: white;
      font-weight: bold;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #ddd;
    }

    /* Responsiveness */
    @media screen and (max-width: 600px) {
      table, th, td {
        font-size: 0.9em;
      }
    }
  </style>
</head>
<body>

<div class="container">
  <h1>User List</h1>

  <%
    // Display error message if present
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
  %>
  <p class="error-message"><%= errorMessage %></p>
  <%
    }

    List<Admin> userList = (List<Admin>) request.getAttribute("users");  // Updated to match attribute name
    if (userList != null && !userList.isEmpty()) {
  %>
  <table class="user-table">
    <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Password</th>
      <th>Username</th>
      <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <%
      for(Admin admin : userList) {
    %>
    <tr>
      <td><%= admin.getId() %></td>
      <td><%= admin.getName() %></td>
      <td><%= admin.getEmail() %></td>
      <td><%= admin.getPassword() %></td>
      <td><%= admin.getUsername() %></td>
      <td><%= admin.getRole() %></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <%
  } else {
  %>
  <p class="no-data">No users available.</p>
  <%
    }
  %>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
