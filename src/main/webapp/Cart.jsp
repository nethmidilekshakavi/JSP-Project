<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Cart</title>
  <link rel="stylesheet" href="css/cart.css">
</head>
<body>

<label for="options1">Choose a Category:</label>
<select id="options1">
  <option value="option1">Electronic Items</option>
  <option value="option2">Clothes</option>
  <option value="option3">Footwear</option>
  <option value="option4">Furniture</option>
  <option value="option4">Sports</option>
</select>
<label for="options2">Product:</label>
<select id="options2">
  <option value="option1">Option 1</option>
  <option value="option2">Option 2</option>
  <option value="option3">Option 3</option>
  <option value="option4">Option 4</option>
</select>

<label for="options3">Qty:</label>
<select id="options3">
  <option value="option1">Option 1</option>
  <option value="option2">Option 2</option>
  <option value="option3">Option 3</option>
  <option value="option4">Option 4</option>
</select>
<br><br>
<label for="options4">Price:</label>
<select id="options4">
  <option value="option1">Option 1</option>
  <option value="option2">Option 2</option>
  <option value="option3">Option 3</option>
  <option value="option4">Option 4</option>
</select>

<label>Quantity:</label>
<input id="getqty"></input>

<div class="cart-container">
  <h1>Your Shopping Cart</h1>


  <table class="cart-table">
    <thead>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Total</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <!-- Loop through cart items dynamically -->
    <c:forEach var="item" items="${cartItems}">
      <tr>
        <td>${item.productName}</td>
        <td>${item.quantity}</td>
        <td>${item.price}</td>
        <td>${item.totalPrice}</td>
        <td>
          <form action="cart" method="post">
            <input type="hidden" name="productId" value="${item.productId}">
            <button type="submit" name="action" value="remove">Remove</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <div class="cart-summary">
    <p>Total Items: ${totalItems}</p>
    <p>Grand Total: ${grandTotal}</p>
    <a href="Order.jsp" class="btn-checkout">Proceed to Checkout</a>
  </div>
</div>
</body>
</html>
