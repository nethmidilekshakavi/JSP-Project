<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/13/2025
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Categories - E-Commerce</title>

  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/Categories.css"> <!-- Custom Styles -->
  <title>Categories</title>
</head>
<body>
<!-- Navbar for navigation (optional) -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <%--<a class="navbar-brand" href="#">E-Commerce</a>--%>
    <%--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>--%>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
      <%--  <li class="nav-item">
          <a class="nav-link active" href="#">Home</a>
        </li>--%>

       <%-- <li class="nav-item">
          <a class="nav-link" href="#">Categories</a>
        </li>--%>
        <%--<li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>--%>
      </ul>
    </div>
  </div>
</nav>

<!-- Categories Section -->
<div class="container my-5">
  <div class="category-header">
    <h2>Shop by Categories</h2>
    <p class="lead">Browse through our wide selection of categories</p>
  </div>

  <div class="row">

    <div class="col-md-4 mb-4">
      <div class="category-card" id="02">
        <img src="Image/Categories/clothes/97a8b26b43a1dabc9d4b227dedb781ef.jpg" alt="Category 2">
        <img src="Image/Categories/clothes/123b8c354ba4f81d2f2bba92ed701178.jpg" alt="Category 2">
        <img src="Image/Categories/clothes/629c5c3dcca16da8552d29148adceebd.jpg" alt="Category 2">
        <img src="Image/Categories/clothes/d67eb3bcd67023a489e3f316ed33ddf8.jpg" alt="Category 2">
        <img src="Image/Categories/clothes/dfc155d44e2b8e6e51239347ba9e88d1.jpg" alt="Category 2">
        <img src="Image/Categories/clothes/efd928dd2416229891c1cc6c9d1e0e01.jpg" alt="Category 2">
        <div class="category-card-body">
          <h5 class="category-title">Clothing</h5>
          <p>Find the trendiest fashion for every season and occasion.</p>
          <a href="ClothingProducts.jsp" class="btn btn-primary"><button class="shopnow">Shop Now</button></a>
        </div>
      </div>
    </div>

    <div class="col-md-4 mb-4" id="6">
      <div class="category-card">
        <img src="Image/Categories/Bags/a7a367408ae9b806d95b2602b4acd237.jpg" alt="Category 5">
        <img src="Image/Categories/Bags/387377d5f9d27bc85c806bf3a0f39cf7.jpg" alt="Category 5">
        <img src="Image/Categories/Bags/9af40e5f05999eae9c6e5e8b5f5e166d.jpg" alt="Category 5">
        <img src="Image/Categories/Bags/5715e1e933f95779e0b6943305158ea1.jpg" alt="Category 5">
        <img src="Image/Categories/Bags/7066757d4d7b36f79f89f9da626401b0.jpg" alt="Category 5">
        <img src="Image/Categories/Bags/5c4f554d13f7cc4a932a4af1ed43e004.jpg" alt="Category 5">
        <div class="category-card-body">
          <h5 class="category-title">Bags</h5>
          <p>Discover our stylish and versatile collection of bags for every occasion.</p>
          <a href="Bags.jsp" class="btn btn-primary"><button class="shopnow">Shop Now</button></a>
        </div>
      </div>
    </div>



    <!-- Category Card 2 -->


    <!-- Category Card 3 -->
    <div class="col-md-4 mb-4" id="03">
      <div class="category-card border rounded shadow-sm">
        <img src="Image/Categories/Footwear/4ba07e052ded0e7289325931da5fb066.jpg" alt="Category 3">
        <img src="Image/Categories/Footwear/34bee783ff5048af69e1898a672d2866.jpg" alt="Category 3">
        <img src="Image/Categories/Footwear/042e692fc57a15c405283a57023f13e5.jpg" alt="Category 3">
        <img src="Image/Categories/Footwear/248c1bb6beb29fa0c9f7f00ec4d8881a.jpg" alt="Category 3">
        <img src="Image/Categories/Footwear/2401b7ba2ff005d334d4dbf9e3217ec1.jpg" alt="Category 3">
        <img src="Image/Categories/Footwear/da8c45406a0fd1a3066c0901c60ea442.jpg" alt="Category 3">
        <div class="category-card-body p-3">
          <h5 class="category-title font-weight-bold">Footwear</h5>
          <p class="category-description text-muted">Find the latest collection of stylish footwear to complete your look.</p>
          <a href="FootwareProducts.jsp" class="btn btn-primary"><button class="shopnow">Shop Now</button></a>
        </div>
      </div>
    </div>



    <!-- Category Card 4 -->
    <div class="col-md-4 mb-4" id="04">
      <div class="category-card">
        <img src="Image/Categories/Furniture/0dae0a9c97cc66e845e4dd1c49395462.jpg" alt="Category 4">
        <img src="Image/Categories/Furniture/3ec58fd41bb26d66150e8b63c8b03d0d.jpg" alt="Category 4">
        <img src="Image/Categories/Furniture/28efbe53ee53d285cfdcf8a03a413ea1.jpg" alt="Category 4">
        <img src="Image/Categories/Furniture/30bec170c96feb68822b7eacadff356f.jpg" alt="Category 4">
        <img src="Image/Categories/Furniture/608997b338d95e885ff9baf5bc4a1a36.jpg" alt="Category 4">
        <img src="Image/Categories/Furniture/fad2f0ee826d428c6dff4372c974ccaf.jpg" alt="Category 4">
        <div class="category-card-body">
          <h5 class="category-title">Furniture</h5>
          <p>Browse through our stunning furniture collection for your home.</p>
          <a href="FurnitureProducts.jsp" class="btn btn-primary"><button class="shopnow">Shop Now</button></a>
        </div>
      </div>
    </div>

    <!-- Category Card 5 -->
    <div class="col-md-4 mb-4" id="5">
      <div class="category-card">
        <img src="Image/Categories/Sports/5aeaa009e2ddbcc1bbe0febf7968d39b.jpg" alt="Category 5">
        <img src="Image/Categories/Sports/57dcb7942290828ddd76af5d612be9eb.jpg" alt="Category 5">
        <img src="Image/Categories/Sports/61fa1cfd34c4379f2765f241dbcf8381.jpg" alt="Category 5">
        <img src="Image/Categories/Sports/283f3e14b0d100b724786b2f66e59ce4.jpg" alt="Category 5">
        <img src="Image/Categories/Sports/8609cb178a026f536498c8a7363177a6.jpg" alt="Category 5">
        <img src="Image/Categories/Sports/f9bc2ae4645b85848106aeb3ba219ab7.jpg" alt="Category 5">
        <div class="category-card-body">
          <h5 class="category-title">Sports</h5>
          <p>Get the best sports gear for every athlete and enthusiast.</p>
          <a href="SportsProducts.jsp" class="btn btn-primary"><button class="shopnow">Shop Now</button></a>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- Footer (optional) -->
<footer class="bg-dark text-white text-center py-3">
  <p> 2025 E-Commerce. All rights reserved.</p>
</footer>

<script src="js/jquery-3.7.1.min.js"></script>
<script>
  function openPopup(url) {
    window.open(url, 'popupWindow', 'width=800,height=600,scrollbars=yes,resizable=yes');
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>
