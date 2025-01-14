<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/14/2025
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
  <link rel="stylesheet" href="css/cart.css">
</head>
<body>
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
    <!-- Example of looping cart items from backend -->
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
