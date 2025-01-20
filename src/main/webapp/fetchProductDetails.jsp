<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/20/2025
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String productId = request.getParameter("productId"); Map<String, String> product = new HashMap<>(); try { Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
  PreparedStatement ps = con.prepareStatement("SELECT price, stock_qty, image_url FROM products WHERE product_id = ?");
  ps.setInt(1, Integer.parseInt(productId)); ResultSet rs = ps.executeQuery(); if (rs.next()) { product.put("price", String.valueOf(rs.getFloat("price"))); product.put("stock_qty", String.valueOf(rs.getInt("stock_qty"))); product.put("image_url", rs.getString("image_url")); } rs.close(); ps.close(); con.close(); } catch (Exception e) { e.printStackTrace(); }
  String jsonProduct = new Gson().toJson(product); System.out.println(jsonProduct); %>
</body>
</html>

<%--
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
        e.printStackTrace();
    }
%>--%>
