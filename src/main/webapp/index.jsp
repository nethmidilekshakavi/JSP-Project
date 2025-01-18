<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%

    String errorMessage = request.getParameter("error");
    String successMessage = request.getParameter("message");

    if (errorMessage != null) {
%>
<script>
    Swal.fire({
        icon: 'error',
        title: 'Login Failed!',
        text: '<%= errorMessage %>',
        showConfirmButton: true,
        timer: 3000
    });
</script>
<%
    }

    if (successMessage != null) {
%>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success!',
        text: '<%= successMessage %>',
        showConfirmButton: true,
        timer: 3000
    });
</script>
<%
    }
%>

<img id="loginImg2" src="Image/UserImg/6ee71f2a94255d6961c2110c1c6bb204-removebg-preview.png" alt="">

<div class="login-container">
    <form class="login-form" action="login" method="POST">
        <h2>Welcome Back</h2>


        <div class="input-box">
            <input type="text" name="username" id="username" required>
            <label for="username">Username</label>
        </div>


        <div class="input-box">
            <input type="password" name="password" id="password" required>
            <label for="password">Password</label>
        </div>


        <div class="button-group">
            <button type="submit">Login</button>
        </div>


        <p class="signup-link">
            Don't have an account? <a href="Admin.jsp">Sign up</a>
        </p>

        <br>

        <a href="UserChangePassWord.jsp">User Change Password</a>

    </form>
</div>

<script src="sweetalert2.all.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
