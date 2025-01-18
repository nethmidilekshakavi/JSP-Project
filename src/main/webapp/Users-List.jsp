<%@ page import="java.util.List" %>
<%@ page import="com.example.lk.ijse.Entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>User List</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/CategoryUpdatePage.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

    .update-password-form {
      text-align: center;
      margin-top: 20px;
    }

    .update-password-form input {
      margin-bottom: 10px;
    }

    /* Responsiveness */
    @media screen and (max-width: 600px) {
      table, th, td {
        font-size: 0.9em;
      }
    }


    .btn-delete { padding: 10px 20px; font-size: 1em; color: #fff; background-color: #dc3545; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease, transform 0.3s ease; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); } .btn-delete:hover { background-color: #c82333; transform: scale(1.05); } .btn-delete:active { background-color: #bd2130; transform: scale(1); }

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

    .toggle-button.active {
      background-color: #4caf50; /* Green for active */
      color: white;
    }

    .toggle-button:hover {
      background-color: #555; /* Hover effect */
      color: #f1f1f1;
    }



  </style>
</head>
<body>


<div class="container">
  <h1>User List</h1>
  <table class="user-table" align="center">
    <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Username</th>
      <th>Role</th>
      <th>Action</th>

    </tr>
    <tbody>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users");

        if(rs.next()) {
          do {
    %>
    <tr>
      <td><%= rs.getInt("user_id") %></td>
      <td><%= rs.getString("username") %></td>
      <td><%= rs.getString("email") %></td>
      <td><%= rs.getString("username") %></td>
      <td><%= rs.getString("role") %></td>
      <td>
        <form action="user-delete" method="post" style="display:inline;">
          <input type="hidden" name="name" value="<%= rs.getInt("user_id") %>">
          <button type="submit" class="toggle-button">Delete</button>
        </form>
      </td>
    </tr>
    <%
      } while (rs.next());
    } else {
    %>
    <tr>
      <td colspan="6" class="no-data">No users available.</td>
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

<form action="user-delete" method="post" id="ud" >
  <label for="username">User name:</label>
  <input type="text" id="username" name="name" required><br><br>

  <button type="submit" style="background-color: red" >Delete User</button>
</form>
<script src="js/jquery-3.7.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>



</script>
</body>
</html>
