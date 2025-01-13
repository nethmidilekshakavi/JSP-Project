<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/14/2025
  Time: 12:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <title>Electric Products</title>
  <link rel="stylesheet" href="css/Electric.css"> <!-- Custom Styles -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center mb-5">Electric Products</h2>
  <div class="row">
    <!-- Product Card 1 -->
    <div class="col-md-4 mb-4">
      <div class="product-card">
        <img src="Image/Categories/Eeletronic/6b07dc8a2d28374ff5d01ba6dc148703.jpg" alt="Product 1">
        <div class="product-details">
          <h5 class="product-title">Electric Kettle</h5>
          <p class="product-description">High-quality electric kettle for boiling water quickly and efficiently.</p>
          <p class="product-price">$29.99</p>
          <button class="buy-btn" onclick="navigateToOrderPage('Electric Kettle', 29.99)">Buy Now</button>
        </div>
      </div>
    </div>

    <!-- Product Card 2 -->
    <div class="col-md-4 mb-4">
      <div class="product-card">
        <img src="https://via.placeholder.com/300x200" alt="Product 2">
        <div class="product-details">
          <h5 class="product-title">Electric Blender</h5>
          <p class="product-description">Blend your favorite beverages with ease using this powerful blender.</p>
          <p class="product-price">$59.99</p>
          <button class="buy-btn" onclick="navigateToOrderPage('Electric Blender', 59.99)">Buy Now</button>
        </div>
      </div>
    </div>

    <!-- Product Card 3 -->
    <div class="col-md-4 mb-4">
      <div class="product-card">
        <img src="https://via.placeholder.com/300x200" alt="Product 3">
        <div class="product-details">
          <h5 class="product-title">Electric Heater</h5>
          <p class="product-description">Stay warm during winter with this efficient electric heater.</p>
          <p class="product-price">$89.99</p>
          <button class="buy-btn" onclick="navigateToOrderPage('Electric Heater', 89.99)">Buy Now</button>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
