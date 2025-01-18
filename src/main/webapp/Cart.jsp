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

<label>User ID:</label>
<input id="userId"></input>

<label for="options1">Choose a Category:</label>
<select id="options1">
  <option value="">Select</option>
  <%
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT category_id, category_name FROM categories");
      while (rs.next()) {
  %>
  <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("category_name") %></option>
  <%
      }
      rs.close();
      stmt.close();
      con.close();
    } catch (Exception e) {
      System.out.println("Error loading categories: " + e.getMessage());
    }
  %>
</select>

<label for="options2">Product:</label>
<select id="options2">
  <%
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT category_id, category_name FROM products");
      while (rs.next()) {
  %>
  <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("category_name") %></option>
  <%
      }
      rs.close();
      stmt.close();
      con.close();
    } catch (Exception e) {
      System.out.println("Error loading categories: " + e.getMessage());
    }
  %>
</select>

<label>Quantity:</label>
<input id="getqty"></input>


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
