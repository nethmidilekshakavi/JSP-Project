<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Profile</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <style>



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

    #pic1{
      width: 450px;
      height: 450px;
      left: 70%;
      top: 30%;
      position: absolute;
    }

  </style>
</head>
<body>

<h1>Welcome to Your Profile!</h1>
<p>Hello, <strong>User!</strong> This is your personalized space where you can manage your account settings, view your activity, and update your information. Explore your profile to get the most out of your experience!</p>

<br><br>

<a href="UserChangePassWord.jsp">
  <button type="button" class="btn-change" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
    Change Personal Details
  </button>
</a>

<br><br>

<a href="UserProfileManagemnt.jsp">
  <button type="button" class="btn-change" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
    View Your Personal Details
  </button>
</a>

<br><br>

<a href="UserDelete.jsp">
  <button type="button" class="btn-change" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
    Delete Your Account
  </button>
</a>

<br><br>

<img id="pic1" src="Image/UserImg/d37fad8b92510d942ad621797c62bcd9-removebg-preview.png" alt="">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
