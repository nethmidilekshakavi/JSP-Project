<%@ page import="java.util.List" %>
<%@ page import="com.example.lk.ijse.DTO.AdminDto" %>
<%@ page import="com.example.lk.ijse.Entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Table</title>
</head>
<body>

<%
  List<Admin> dataList = (List<Admin>) request.getAttribute("users");
  if (dataList != null && !dataList.isEmpty()) {
%>
<table class="table table-bordered" border="1">
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
  <tbody id="customer-Table">
  <% for (Admin adminDto : dataList) { %>
  <tr>
    <td><%= adminDto.getId() %></td>
    <td><%= adminDto.getName() %></td>
    <td><%= adminDto.getEmail() %></td>
    <td><%= adminDto.getPassword() %></td>
    <td><%= adminDto.getUsername() %></td>
    <td><%= adminDto.getRole() %></td>
  </tr>
  <% } %>
  </tbody>
</table>
<% } else { %>
<p>No users found.</p>
<% } %>

</body>
</html>
