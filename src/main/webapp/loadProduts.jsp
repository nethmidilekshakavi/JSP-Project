<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String categoryId = request.getParameter("categoryId");
  if (categoryId != null && !categoryId.isEmpty()) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");

      // SQL query to fetch product name, price, and stock quantity based on category_id
      PreparedStatement stmt = con.prepareStatement("SELECT product_id, product_name, price, stock_quantity FROM products WHERE category_id = ?");
      stmt.setInt(1, Integer.parseInt(categoryId)); // Set the category_id parameter in the query

      ResultSet rs = stmt.executeQuery();

      // Loop through the results and print them as options
      while (rs.next()) {
        System.out.println("<option value='" + rs.getInt("product_id") + "'>"
                + rs.getString("product_name")
                + " - Rs." + rs.getDouble("price")
                + " (Stock: " + rs.getInt("stock_quantity") + ")"
                + "</option>");
      }

      rs.close();
      stmt.close();
      con.close();
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("<option value=''>Error loading products</option>");
    }
  }
%>
