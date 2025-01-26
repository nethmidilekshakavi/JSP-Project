<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
            width: 80%;
            max-width: 1000px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background: white;
        }

        .form-section {
            flex: 1;
            padding: 40px;
        }

        .form-section h2 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .form-section p {
            margin-bottom: 20px;
            color: #666;
        }

        .form-section button {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 10px 0;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .google {
            background-color: #4285F4;
            color: white;
        }

        .facebook {
            background-color: #3b5998;
            color: white;
        }

        .form-section form {
            margin-top: 20px;
        }

        .form-section label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-section input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-section a {
            display: block;
            margin-bottom: 20px;
            font-size: 14px;
            color: #4285F4;
            text-decoration: none;
            text-align: right;
        }

        .form-section .login-btn {
            background-color: #6A5ACD;
            color: white;
        }

        .form-section .login-btn:hover {
            background-color: #584FC8;
        }

        .image-section {
            flex: 1;
            background-color: #f7f8fd;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            position: relative;
        }

        .image-section h3 {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }

        .image-section p {
            color: #666;
            text-align: center;
        }

        .image-section img {
            max-width: 80%;
            border-radius: 5px;
        }

        .image-section .badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: gold;
            padding: 5px 10px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-section">
        <h2>Login ✌️</h2>
        <p>How do I get started lorem ipsum dolor sit?</p>

        <button class="google">Sign in with Google</button>
        <button class="facebook">Sign in with Facebook</button>

        <form>
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter your email">

            <label for="password">Password</label>
            <input type="password" id="password" placeholder="Enter your Password">

            <a href="#">Forgot Password?</a>

            <button type="submit" class="login-btn">Login</button>
        </form>
    </div>

    <div class="image-section">
        <div class="badge">💎</div>
        <h3>Very good works are waiting for you ✌️</h3>
        <p>Login Now</p>
    </div>
</div>
</body>
</html>
