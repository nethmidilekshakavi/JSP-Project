<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
      <div class="image-section">
        <img src="<%= request.getParameter("product_image") %>" alt="Product Image">
      </div>


      <!-- Product Details Section -->
      <div class="item-details">
        <h2><%= request.getParameter("product_name") %></h2>
        <p>Category: <span>Clothing</span></p>
        <p>Price: Rs.<%= request.getParameter("product_price") %></p>
        <div class="quantity">
          <label for="quantity">Quantity: </label>
          <input type="number" id="quantity" name="quantity" value="1" min="1">
        </div>
        <button class="remove-btn">Remove</button>
      </div>
    </div>
  </div>

  <div class="cart-summary">
    <h3>Cart Summary</h3>
    <p>Total: <span id="total-price">Rs.<%= request.getParameter("product_price") %></span></p>
    <button class="checkout-btn">Proceed to Checkout</button>
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
