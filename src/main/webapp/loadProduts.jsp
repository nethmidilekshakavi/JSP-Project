<%@ page import="java.sql.*" %>
<%
  String cid = request.getParameter("cid");
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
    PreparedStatement ps = con.prepareStatement("SELECT product_id, product_name FROM products WHERE category_id = ?");
    ps.setInt(1, Integer.parseInt(cid));
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
%>
<option value="<%= rs.getInt("product_id") %>"><%= rs.getString("product_name") %></option>
<%
    }
    rs.close();
    ps.close();
    con.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>


<%--
  <div class="cart-summary">
    <h3>Cart Summary</h3>
    <p>Total: <span id="total-price">Rs.<%= request.getParameter("product_price") %></span></p>
    <button class="checkout-btn">Proceed to Checkout</button>
  </div>
--%>
