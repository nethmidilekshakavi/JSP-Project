<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Dynamic Product Loading</title>
  <link rel="stylesheet" href="css/cart.css">

 <style>
   body {
     font-family: Arial, sans-serif;
     background-color: #f4f4f9;
     margin: 0;
     padding: 0;
     display: flex;
     justify-content: center;
     align-items: center;
     height: 100vh;
   }

   form {
     background-color: #ffffff;
     padding: 15px;
     margin: 20px auto;
     width: 60%;
     max-width: 500px;
     box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
     border-radius: 8px;
     display: flex;
     flex-direction: column;
   }

   label {
     font-size: 14px;
     color: #333;
     margin-bottom: 5px;
   }

   select {
     width: 100%;
     padding: 8px;
     font-size: 14px;
     border-radius: 5px;
     border: 1px solid #ddd;
     margin-bottom: 15px;
     box-sizing: border-box;
     background-color: #f9f9f9;
   }

   select:focus {
     border-color: #007bff;
     outline: none;
     background-color: #e9f1ff;
   }

   button {
     background-color: #28a745;
     color: white;
     padding: 8px 16px;
     font-size: 14px;
     border: none;
     border-radius: 5px;
     cursor: pointer;
     transition: background-color 0.3s ease;
     align-self: flex-end;
   }

   button:hover {
     background-color: #218838;
   }

 </style>

</head>
<body>

<form> <label for="cid">Category:</label>
  <select id="cid" name="cid" required onchange="loadProducts()">
    <option value="">Select</option> <% try { Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT category_id, category_name FROM categories");
      while (rs.next()) { %> <option value="<%= rs.getInt("category_id") %>"><%= rs.getString("category_id") %>
  </option> <% } rs.close(); stmt.close(); con.close(); }
  catch (Exception e) { e.printStackTrace(); } %>
  </select> <br><br>

  <label for="product">Select Product:</label>
  <select id="product" name="product">
    <option value="">Select a product</option>
  </select>
 </form>

<%--
  <div class="cart-summary">
    <h3>Cart Summary</h3>
    <p>Total: <span id="total-price">Rs.<%= request.getParameter("product_price") %></span></p>
    <button class="checkout-btn">Proceed to Checkout</button>
  </div>
--%>


<script src="js/jquery-3.7.1.min.js"></script>

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


</body>
</html>
