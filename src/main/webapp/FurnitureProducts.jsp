<%--

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furniture Products</title>
  <link rel="stylesheet" href="css/ClothingProduct.css">
</head>
<body>
<div class="content">
  <div class="card-container">
    <div class="card">
      <img src="../Image/Categories/Furniture/fad2f0ee826d428c6dff4372c974ccaf.jpg" alt="Shoo Rack">
      <h3>Shoe Rack</h3>
      <p class="description">A spacious and stylish shoe rack for organizing your footwear collection.</p>
      <p class="price">Rs.16500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Furniture/30bec170c96feb68822b7eacadff356f.jpg" alt="White Sorfar">
      <h3>White Sofa</h3>
      <p class="description">Elegant white sofa that adds comfort and style to any living space.</p>
      <p class="price">Rs.90000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Furniture/608997b338d95e885ff9baf5bc4a1a36.jpg" alt="White Chair">
      <h3>White Chair</h3>
      <p class="description">A modern white chair, perfect for any home or office setup.</p>
      <p class="price">Rs.15000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Furniture/28efbe53ee53d285cfdcf8a03a413ea1.jpg" alt="Fancy Chair">
      <h3>Fancy Chair</h3>
      <p class="description">Luxurious and comfortable chair that brings elegance to your space.</p>
      <p class="price">Rs.12000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Furniture/3ec58fd41bb26d66150e8b63c8b03d0d.jpg" alt="Bed Lamp">
      <h3>Bed Lamp</h3>
      <p class="description">Sleek and modern bed lamp with adjustable brightness for a cozy ambiance.</p>
      <p class="price">Rs.7500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Furniture/0dae0a9c97cc66e845e4dd1c49395462.jpg" alt="Study Lamp">
      <h3>Study Lamp</h3>
      <p class="description">A functional study lamp providing bright, focused light for work and study.</p>
      <p class="price">Rs.5500.00</p>
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
  <h3>Our Furniture Collection ❤️</h3>
  <div class="row">
    <%
      try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM products WHERE category_id = ?");
        stmt.setInt(1, 5); // Filtering by category_id 1
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

