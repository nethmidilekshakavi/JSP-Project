<%--
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Electric Items</title>
  <link rel="stylesheet" href="css/Electric.css">
</head>
<body>
<div class="content">
  <div class="card-container">
    <div class="card">
      <img src="../Image/Categories/Eeletronic/a8337f50ffaf22a9f4c350ed63362ec8.jpg" alt="Item 3">
      <h3>Headphone</h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.3000.00</p>
      <a href="Cart.jsp"><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/6b07dc8a2d28374ff5d01ba6dc148703.jpg" alt="Item 1">
      <h3>Maxkon Air Fryer</h3>
      <p class="description">A delicious coffee to start your day.</p>
      <p class="price">Rs.18000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/5dba612dd9931919daf3b784533a83df.jpg" alt="Item 2">
      <h3>PowerBank</h3>
      <p class="description">A refreshing iced coffee for hot days.</p>
      <p class="price">Rs.7500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/f30582afd1b9213faca85ee312a77164.jpg" alt="Item 3">
      <h3>USB Microphone</h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.6000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/225df0cf45c4d1bfc5d9a31c1de0772a.jpg" alt="Item 3">
      <h3>Galaxy Phone 13pro</h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.60000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/a2911d64b84936d16e01da5627f7eb1c.jpg" alt="Item 3">
      <h3>Smooth PowerBank</h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.4000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/557b6cbe0b85cbd2cf4040dda07abcb1.jpg" alt="Item 3">
      <h3>Galaxy Laptop</h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.15000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/dbccb776620d025ab9b9fe5218b64a83.jpg" alt="Item 3">
      <h3>Multifunctional Alarm Clock</h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.3500.00</p>
      <a href=""><button>Order Now</button></a>

    </div>
    <div class="card">
      <img src="../Image/Categories/Eeletronic/7b56cb5ec005d502daac10808a086de0.jpg" alt="Item 3">
      <h3>Stand Mixer </h3>
      <p class="description">A creamy latte with a smooth finish.</p>
      <p class="price">Rs.21000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>

  </div>
</div>

</body>
</html>
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product List</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 120%;
      margin: 10px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      color: #333;
      font-size: 2em;
    }
    .product-card {
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 10px;
      margin: 10px;
      text-align: center;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      background-color: #fff;
      width: 300px;
      flex: 0 0 23%; /* Adjusted to fit four cards in one line */
      box-sizing: border-box; /* Ensures padding and border are included in width */
    }
    .product-card img {
      width: 50%;
      height: auto;
      border-radius: 5px;
    }
    .product-card h2 {
      font-size: 18px;
      color: #333;
    }
    .product-card p {
      font-size: 14px;
      color: #666;
    }
    .product-card .price {
      font-size: 16px;
      color: #28a745;
      margin-top: 10px;
    }
    .product-card .order-now {
      background-color: #28a745;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      margin-top: 10px;
    }
    .product-card .order-now:hover {
      background-color: #218838;
    }
    .product-container {
      display: flex;
      flex-wrap: nowrap; /* Prevents wrapping */
      justify-content: space-between;
      margin: 0 auto;
    }
  </style>

</head>
<body>

<div class="container">
  <h3>Our Fashion Collection</h3>
  <div class="row">
    <%
      try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM products WHERE category_id = ?");
        stmt.setInt(1, 1); // Filtering by category_id 1
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
          do {
    %>
    <div class="col-md-4">
      <div class="product-card">
        <% String imgFileName = rs.getString("product_img"); %>
        <img src="img/<%= imgFileName %>" alt="Product Image">
        <h2><%= rs.getString("product_name") %></h2>
        <%--<h2><%= rs.getString("stock_quantity") %></h2>--%>
        <%--<h4><%= rs.getString("product_id") %></h4>--%>
        <p><%= rs.getString("description") %></p>
        <p class="price">Rs. <%= rs.getDouble("price") %></p>
        <form action="Cart.jsp" method="post">
          <input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>">
          <input type="hidden" name="productName" value="<%= rs.getString("product_name") %>">
          <input type="hidden" name="stock_quantity" value="<%= rs.getInt("stock_quantity") %>">
          <input type="hidden" name="productDescription" value="<%= rs.getString("description") %>">
          <input type="hidden" name="productPrice" value="<%= rs.getDouble("price") %>">
          <input type="hidden" name="productImage" value="<%= imgFileName %>">
          <button type="submit" class="order-now">Order Now</button>
        </form>
      </div>
    </div>
    <%
      } while (rs.next());
    } else {
    %>
    <p class="no-data">No Products available.</p>
    <%
      }
      rs.close();
      stmt.close();
      con.close();
    } catch (Exception e) {
      e.printStackTrace();
    %>
    <p class="text-danger text-center">Error fetching products.</p>
    <%
      }
    %>
  </div>
</div>

</body>
</html>

