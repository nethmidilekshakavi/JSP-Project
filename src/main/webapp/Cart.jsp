<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Cart</title>
  <link rel="stylesheet" href="css/cart.css">
</head>
<body>

<div class="cart-container">
  <h1>Your Shopping Cart</h1>

  <div class="cart-items">
    <!-- Cart item dynamically populated -->
    <div class="cart-item">

      <!-- Image Section -->
      <%
        String productImage = request.getParameter("product_image");
      %>
      <div class="image-section">
        <img src="<%= productImage %>" alt="Product Image" style="width: 200px;">
      </div>

      <br><br>
      <!-- Product Details Section -->
      <div class="item-details">
        <h2><%= request.getParameter("product_name") %></h2>
        <br><br>
        <p>Category: <span>Clothing</span></p>
        <br>
        <p>Price: Rs.<%= request.getParameter("product_price") %></p> <br><br>
        <div class="quantity">
          <label for="quantity">Quantity: </label>
          <input type="number" id="quantity" name="quantity" value="1" min="1">
        </div>
        <h3><%= request.getParameter("product_stock") %></h3>
        <br>
        <button class="remove-btn">Remove</button>
      </div>
    </div
  <div class="cart-summary">
    <h3>Cart Summary</h3>
    <p>Total: <span id="total-price">Rs.<%= request.getParameter("product_price") %></span></p>
    <button class="checkout-btn">Proceed to Checkout</button>
  </div>

  </div>
</div>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
  // Function to preview the selected image
  function previewImage(event) {
    const previewContainer = document.getElementById('image-preview');
    const file = event.target.files[0];

    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        // Create an image element and display it
        const imgElement = document.createElement('img');
        imgElement.src = e.target.result;
        previewContainer.innerHTML = '';  // Clear the previous preview
        previewContainer.appendChild(imgElement);
      };
      reader.readAsDataURL(file);
    } else {
      previewContainer.innerHTML = '<span>No image selected</span>';
    }
  }

  // Function to handle the image upload (you can replace with actual server-side logic)
  function uploadImage() {
    const fileInput = document.getElementById('image-upload');
    const file = fileInput.files[0];

    if (file) {
      // Here, you can send the file to the server using AJAX or a form submission
      alert('Image uploaded successfully (this is a demo).');
    } else {
      alert('Please select an image to upload.');
    }
  }
</script>

</body>
</html>
