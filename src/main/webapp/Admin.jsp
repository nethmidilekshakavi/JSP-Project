<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/signup.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Admin Management</title>
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

<div class="form-container">
    <h2>User Registration</h2>
    <form action="admin-save" method="POST" id="form">
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

<script src="sweetalert2.all.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
