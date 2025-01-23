<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/18/2025
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="css/Electric.css">
</head>
<body>
<div class="content">
  <div class="card-container">
    <div class="card">
      <img src="../Image/Categories/Bags/5c4f554d13f7cc4a932a4af1ed43e004.jpg" alt="Yellow Office Bag">
      <h3>Yellow Office Bag</h3>
      <p class="description">Elegant and professional yellow office bag with a spacious interior for your essentials.</p>
      <p class="price">Rs.8000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Bags/7066757d4d7b36f79f89f9da626401b0.jpg" alt="Fancy Brown Bag">
      <h3>Fancy Brown Bag</h3>
      <p class="description">Stylish brown leather bag designed for both casual and formal occasions.</p>
      <p class="price">Rs.7500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Bags/5715e1e933f95779e0b6943305158ea1.jpg" alt="Black Side Bag">
      <h3>Black Side Bag</h3>
      <p class="description">Compact and versatile black side bag, perfect for everyday use and travel.</p>
      <p class="price">Rs.4500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Bags/9af40e5f05999eae9c6e5e8b5f5e166d.jpg" alt="Red School Bag">
      <h3>Red School Bag</h3>
      <p class="description">Durable and spacious red school bag with multiple compartments for students.</p>
      <p class="price">Rs.2700.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Bags/387377d5f9d27bc85c806bf3a0f39cf7.jpg" alt="Black and White Bag">
      <h3>Black and White Bag</h3>
      <p class="description">Trendy black and white handbag with a chic design for fashion enthusiasts.</p>
      <p class="price">Rs.5500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Bags/a7a367408ae9b806d95b2602b4acd237.jpg" alt="White Cute Bag">
      <h3>White Cute Bag</h3>
      <p class="description">Adorable white handbag with a compact size and elegant look for a casual outing.</p>
      <p class="price">Rs.4000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
  </div>
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
  <h3>Our Bags Collection</h3>
  <div class="row">
    <%
      try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM products WHERE category_id = ?");
        stmt.setInt(1, 2);
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
        <button class="order-now">Order Now</button>
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

