<%@ page import="java.util.List" %>
<%@ page import="com.example.lk.ijse.Entity.Admin" %>
<%@ page import="com.example.lk.ijse.DTO.AdminDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Table</title>
</head>
<body>
<%
List <AdminDto> DataList =(List<AdminDto>) request.getAttribute("Users");
  if (DataList != null && !DataList.isEmpty()){
  %>
  <table class="table table-bordered" border="1">
    <thead>
    <tr>
      <td>ID</td>
      <td>Name</td>
      <td>Email</td>
      <td>Password</td>
      <td>Username</td>
      <td>Role</td>
    </tr>
    </thead>
    <tbody id="customer-Table">

    <%
      for(AdminDto adminDto : DataList){
    %>
    <tr>
      <td><%=adminDto.getId()%></td>
      <td><%=adminDto.getName()%></td>
      <td><%=adminDto.getEmail()%></td>
      <td><%=adminDto.getPassword()%></td>
      <td><%=adminDto.getUsername()%></td>
      <td><%=adminDto.getRole()%></td>
    </tr>
    <%
      }

    %>
    </tbody>
  </table>
    <%
    }
%>
</body>
</html>
