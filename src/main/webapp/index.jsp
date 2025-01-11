<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">

</head>
<body>
<br/>

<div class="login-container">
    <form class="login-form">
        <h2>Welcome Back</h2>
        <div class="input-box">
            <input type="text" required>
            <label>Username</label>
        </div>
        <div class="input-box">
            <input type="password" required>
            <label>Password</label>
        </div>
        <div class="button-group">
            <button type="submit">Login</button>
        </div>
        <p class="signup-link">
            Don't have an account? <a href="Admin.jsp">Sign up</a>
        </p>
    </form>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>