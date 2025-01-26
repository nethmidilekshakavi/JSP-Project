<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/15/2025
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Category List</title>
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
  <h1>Category List</h1>
  <table class="user-table" align="center">
    <thead>
    <tr>
      <th>Category ID</th>
      <th>Category Name</th>
      <th>Description</th>
      <th>Action</th>

    </tr>
    </thead>
    <tbody>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM categories");
        if(rs.next()) {
          do {
    %>
    <tr>
      <td><%= rs.getInt("category_id") %></td>
      <td><%= rs.getString("category_name") %></td>
      <td><%= rs.getString("description") %></td>
      <td>
        <form action="category-delete" method="post" style="display:inline;">
          <input type="hidden" name="Cid" value="<%= rs.getInt("category_id") %>">
          <button type="submit" class="btn-delete" onclick="return confirm('Are you sure you want to delete this Category? This action cannot be undone.');">Delete</button>
        </form>
      </td>
    </tr>
    <%
      } while (rs.next());
    } else {
    %>
    <tr>
      <td colspan="6" class="no-data">No Category available.</td>
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
<script>  function confirmDelete(userId) {
  return confirm('Are you sure you want to delete this category? This action cannot be undone.');
}</script>
</body>
</html>
