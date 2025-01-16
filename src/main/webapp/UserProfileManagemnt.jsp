<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/16/2025
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile Management</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/CategoryUpdatePage.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    .btn-profile { display: inline-block; padding: 10px 20px; font-size: 1.2em; color: #fff; background-color: #007bff; border-radius: 5px; text-decoration: none; transition: background-color 0.3s ease, transform 0.3s ease; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); } .btn-profile:hover { background-color: #0056b3; transform: scale(1.05); } .btn-profile:active { background-color: #003f7f; }

     body {
       font-family: 'Roboto', sans-serif;
       background: linear-gradient(to top, #71b7e6, #9b59b6);
       margin: 0;
       padding: 0;
     }

    .container {
      width: 50%;
      margin: 50px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    h1 {
      text-align: center;
      color: #343a40;
      font-size: 2.5em;
      margin-bottom: 20px;
    }

    form {
      text-align: center;
      margin-bottom: 20px;
    }

    input[type="text"] {
      width: 80%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1.1em;
    }

    input:focus {
      border-color: #007bff;
      outline: none;
      background-color: #f1f8ff;
    }

    button {
      padding: 12px 24px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1.2em;
    }

    button:hover {
      background-color: #0056b3;
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
      height: 30px;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #ddd;
    }

    .no-data {
      color: #777;
      font-size: 1.2em;
      text-align: center;
    }
    .btn-change {
      font-size: 1em;
      font-family: 'Arial', sans-serif;
      transition: background-color 0.3s ease;
    }

    .btn-change:hover {
      background-color: #45a049;
    }
  </style>

</head>
<body>



<div class="container">
  <h1>View Your Personal Details</h1>

  <form method="post" action="UserProfileManagemnt.jsp">
    <input type="text" name="email" placeholder="Enter your Email" required>
    <button type="submit">Search</button>
  </form>

  <table class="user-table" align="center">
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
      String email = request.getParameter("email");
      if (email != null && !email.trim().isEmpty()) {
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
          String query = "SELECT id, name, email, password, username, role FROM users WHERE email = ?";
          PreparedStatement pstmt = con.prepareStatement(query);
          pstmt.setString(1, email);
          ResultSet rs = pstmt.executeQuery();

          if (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getString("email") %></td>
      <td><%= rs.getString("password") %></td>
      <td><%= rs.getString("username") %></td>
      <td><%= rs.getString("role") %></td>
    </tr>
    <%
    } else {
    %>
    <tr>
      <td colspan="6" class="no-data">No user found with that username.</td>
    </tr>
    <%
          }
          rs.close();
          pstmt.close();
          con.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    %>
    </tbody>
  </table>
</div>

</body>
</html>
