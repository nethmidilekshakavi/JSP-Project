<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Dynamic Product Loading</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="css/cart.css">
</head>
<body>

<form id="form" method="post" action="cartSave">
  <div class="cart-container">
    <!-- Left Side (Form Section) -->
    <div class="form-section">
      <h1>Your Shopping Cart</h1>

      <input type="text" id="user_id" name="user_id">
        <br>
      <label for="cid">Category:</label>
      <select class="form-select" aria-label="Disabled select example" id="cid" name="cid" required onchange="loadProducts()">
        <option selected>Category:</option>
        <%
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT category_id , category_name FROM categories");
            while (rs.next()) {
        %>
        <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("category_name") %></option>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
          } catch (Exception e) {
            e.printStackTrace();
          }
        %>
      </select>
      <br>

      <label for="product">Select Product:</label>
      <select class="form-select" aria-label="Disabled select example" id="product" name="product" required onchange="showProductDetails()">
        <option selected>Select Product:</option>
      </select>

      <!-- Product Details -->
      <div class="item-details">
       <%-- <p><%= request.getParameter("getProduct") %></p>--%>
        <h2 id="product-name" style="font-size: 25px">Product Name</h2>
        <p style="font-size: 30px"><strong>Price: Rs.<%= request.getParameter("product_price") %></strong></p>



        <label>Stock Quantity:</label><p id="stock-quantity"></p>


        <p id="product_ID"></p>


        <div class="quantity">
          <label for="quantity">Quantity: </label>
          <input type="number" id="quantity" name="quantity" value="1" min="1">
        </div>

        <div class="image-section">
          <img src="<%= request.getParameter("product_image") %>"  alt="Product Image">
        </div>

      </div>
    </div>

    <div class="cart-summary">
      <h3>Cart Summary</h3>
      <p><span id="total-price" style="font-weight: bold; font-size: 30px; color: red;">Rs.<%= request.getParameter("product_price") %></span></p> <button class="remove-btn">Remove</button>
      <button class="checkout-btn" type="submit">Add to Cart</button>
      <img  style="height: 450px" src="Image/b37a66a9eeabbcd3e900ced1b4830532-removebg-preview.png" alt="">
    </div>
  </div>
</form>



<script src="js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
  function loadProducts() {
    var categoryId = $('#cid').val();
    if (categoryId) {
      $.ajax({
        url: 'loadProduts.jsp',
        type: 'GET',
        data: {cid: categoryId},
        success: function(data) {
          $('#product').html(data);
        },
        error: function(xhr, status, error) {
          console.error("AJAX error: " + status + ", " + error);
        }
      });
    } else {
      $('#product').html('<option value="">Select a product</option>');
    }
  }
</script>

<script>


  function showProductDetails() {
    var selectedOption = $('#product option:selected');
    var productPrice = selectedOption.data('price');
    var productQuantity = selectedOption.data('quantity');
    var productImage = selectedOption.data('image');
    var productId = selectedOption.data('id'); // Get product ID

    if (productPrice !== undefined && productQuantity !== undefined) {
      // Set product name
      $('#product-name').text(selectedOption.text());

      // Set product price
      $('.item-details p:contains("Price")').text("Price: Rs." + productPrice);

      // Set product ID
      $('#product_ID').text("Product ID: " + productId); // Display product ID
    }

    if (productPrice !== undefined && productQuantity !== undefined) {
      var initialQuantity = 1; // Set initial quantity to 1
      var totalPrice = productPrice * initialQuantity;

      // Display product details
      $('#stock-quantity').text(productQuantity);
      $('.quantity input').attr("max", productQuantity);
      $('.quantity input').val(initialQuantity);
      $('#product-image').attr("src", productImage || "default-image.jpg");
      $('#total-price').text("Total Price: Rs. " + totalPrice);

      // Handle quantity change
      $('.quantity input').on('input', function () {
        var enteredQuantity = $(this).val();
        if (enteredQuantity > productQuantity) {
          alert("Quantity exceeds available stock!");
          $(this).val(productQuantity); // Reset to max quantity if exceeded
          enteredQuantity = productQuantity;
        }
        var updatedTotalPrice = productPrice * enteredQuantity;
        $('#total-price').text("Total Price: Rs. " + updatedTotalPrice);
      });
    }
  }




</script>

</body>
</html>
