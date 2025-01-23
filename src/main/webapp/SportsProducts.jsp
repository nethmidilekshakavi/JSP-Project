<%--

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sports Items</title>
  <link rel="stylesheet" href="css/ClothingProduct.css">
</head>
<body>
<div class="content">
  <div class="card-container">
    <div class="card">
      <img src="../Image/Categories/Sports/f9bc2ae4645b85848106aeb3ba219ab7.jpg" alt="Red Cricket Gloves">
      <h3>Red Cricket Gloves</h3>
      <p class="description">High-quality red cricket gloves for better protection and comfort during play.</p>
      <p class="price">Rs.10500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Sports/8609cb178a026f536498c8a7363177a6.jpg" alt="Football Shoes Green">
      <h3>Football Shoes Green</h3>
      <p class="description">Durable green football shoes designed for comfort and agility on the field.</p>
      <p class="price">Rs.9000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Sports/283f3e14b0d100b724786b2f66e59ce4.jpg" alt="Sports Bottle">
      <h3>Sports Bottle</h3>
      <p class="description">Stylish black sports bottle to keep you hydrated during intense workouts.</p>
      <p class="price">Rs.2500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Sports/57dcb7942290828ddd76af5d612be9eb.jpg" alt="Tennis Kit">
      <h3>Tennis Kit</h3>
      <p class="description">Complete tennis kit with essentials for both beginners and pros.</p>
      <p class="price">Rs.8000.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Sports/5aeaa009e2ddbcc1bbe0febf7968d39b.jpg" alt="Sports Bags">
      <h3>Sports Bags</h3>
      <p class="description">Sleek and durable sports bags to carry all your gear in style.</p>
      <p class="price">Rs.17500.00</p>
      <a href=""><button>Order Now</button></a>
    </div>
    <div class="card">
      <img src="../Image/Categories/Sports/61fa1cfd34c4379f2765f241dbcf8381.jpg" alt="Football Safe Kit">
      <h3>Football Safe Kit</h3>
      <p class="description">Comprehensive safety kit for football players, offering protection and security.</p>
      <p class="price">Rs.7500.00</p>
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
        stmt.setInt(1, 6); // Filtering by category_id 1
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

