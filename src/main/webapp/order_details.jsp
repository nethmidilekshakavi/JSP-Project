<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/14/2025
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Details</title>

  <style>body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
  }

  .order-details-container {
    width: 80%;
    margin: 40px auto;
    padding: 20px;
    background: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  h1 {
    text-align: center;
    margin-bottom: 20px;
  }

  .order-details-table {
    width: 100%;
    border-collapse: collapse;
  }

  .order-details-table th, .order-details-table td {
    padding: 12px;
    text-align: center;
    border: 1px solid #ddd;
  }

  .order-details-table th {
    background-color: #f1f1f1;
  }

  button {
    padding: 8px 16px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 20px;
    display: block;
    width: 100%;
  }

  button:hover {
    background-color: #218838;
  }
  </style>

</head>
<body>
<div class="order-details-container">
  <h1>Order Details</h1>
  <table class="order-details-table">
    <thead>
    <tr>
      <th>Order Detail ID</th>
      <th>Order ID</th>
      <th>Product ID</th>
      <th>Quantity</th>
      <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <!-- Loop through order details to display each one -->
    <c:forEach var="orderDetail" items="${orderDetails}">
      <tr>
        <td>${orderDetail.orderDetailId}</td>
        <td>${orderDetail.orderId}</td>
        <td>${orderDetail.productId}</td>
        <td>${orderDetail.quantity}</td>
        <td>${orderDetail.price}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
