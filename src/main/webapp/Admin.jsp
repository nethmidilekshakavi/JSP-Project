
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/admin.css">
    <title>Admin Management</title>
</head>
<body>

<h1>Save Admin</h1> <br>

<%
    String msg = request.getParameter("message");
    String error = request.getParameter("error");
%>

<%
    if (msg != null){
%>

<div style="color: green"><%=msg%></div>

<% }

%>

<%
    if (error != null){
%>

<div style="color: red"><%=error%></div>

<% }

%>

<div class="form-container">
    <h2>Admin Registration</h2>
    <form action="Admin-save" method="POST">
        <div class="form-group">
            <label for="id">Full Name</label>
            <input type="text" id="id" name="adminId" required>
        </div>
        <div class="form-group">
            <label for="fullName">Full Name</label>
            <input type="text" id="fullName" name="adminName" placeholder="Enter your full name" required>
        </div>
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="adminEmail" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>
        </div>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <button type="submit" class="btn">Register</button>
    </form>
    <div class="form-footer">
        <p>Already have an account? <a href="index.jsp">Login here</a></p>
    </div>
</div>
</body>
</html>
