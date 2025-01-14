<%@ page import="java.util.List" %>
<%@ page import="com.example.lk.ijse.Entity.Admin" %>
<%@ page import="com.example.lk.ijse.DTO.AdminDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User List</title>
</head>
<body>

<div class="container">
  <h1>User List</h1>

  <%
    List<AdminDto> DataList = (List<AdminDto>) request.getAttribute("Users");
    if (DataList != null && !DataList.isEmpty()) {
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
      for(AdminDto admin : DataList) {
        System.out.println(admin.getId());
    %>
    <tr>
      <td><%=admin.getId()%></td>
      <td><%=admin.getName()%></td>
      <td><%=admin.getEmail()%></td>
      <td><%=admin.getPassword()%></td>
      <td><%=admin.getUsername()%></td>
      <td><%=admin.getRole()%></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <%
  } else {
  %>
  <p>No users available.</p>
  <%
    }
  %>
</div>

</body>
</html>
