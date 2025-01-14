<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/14/2025
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
  <link rel="stylesheet" href="css/order.css">
</head>
<body>
<div class="orders-container">
  <h1>Order Management</h1>
  <table class="orders-table">
    <thead>
    <tr>
      <th>Order ID</th>
      <th>User ID</th>
      <th>Order Date</th>
      <th>Total Amount</th>
      <th>Status</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <!-- Loop through orders to display each one -->
    <c:forEach var="order" items="${orders}">
      <tr>
        <td>${order.orderId}</td>
        <td>${order.userId}</td>
        <td>${order.orderDate}</td>
        <td>${order.totalAmount}</td>
        <td>${order.status}</td>
        <td>
          <form action="OrderServlet" method="post">
            <input type="hidden" name="orderId" value="${order.orderId}">
            <%--<button type="submit" name="action" value="update">Update</button>--%>
            <button type="submit" name="action" value="Delete">Delete</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <br><br>
  <a href="order_details.jsp"><button class="buy-now">Buy Now</button></a>
</div>

</body>
</html>
