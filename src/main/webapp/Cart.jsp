<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Dynamic Product Loading</title>
  <link rel="stylesheet" href="css/cart.css">
</head>
<body>
<div class="cart-container">
  <h1>Select Category and Product</h1>

  <label for="cid">Category:</label>
  <select id="cid" name="cid" onchange="loadProducts()" required>
    <option value="">Select</option>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT category_id, category_name FROM categories");
        while (rs.next()) {
    %>
    <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("category_id") %></option>
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

  <br><br>

  <label for="product">Select Product:</label>
  <select id="product" name="product">
    <option value="">Select a product</option>
  </select>

  <div class="cart-summary">
    <h3>Cart Summary</h3>
    <p>Total: <span id="total-price">Rs.<%= request.getParameter("product_price") %></span></p>
    <button class="checkout-btn">Proceed to Checkout</button>
  </div>
</div>

<script>
  // AJAX function to load products based on selected category
  function loadProducts() {
    const categoryId = document.getElementById("cid").value;
    const productDropdown = document.getElementById("product");

    // Clear the previous product options
    productDropdown.innerHTML = '<option value="">Select a product</option>';

    if (categoryId) {
      const xhr = new XMLHttpRequest();
      xhr.open("GET", "loadProduts.jsp?product_name=" + encodeURIComponent(categoryId), true);
      xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
          productDropdown.innerHTML += xhr.responseText;
        }
      };
      xhr.send();
    }
  }
</script>

</body>
</html>
