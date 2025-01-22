<%@ page import="java.sql.*" %>
<%
    String cid = request.getParameter("cid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
        PreparedStatement ps = con.prepareStatement("SELECT product_id, product_name, price, stock_quantity FROM products WHERE category_id = ?");
        ps.setInt(1, Integer.parseInt(cid));
        ResultSet rs = ps.executeQuery();

        boolean hasProducts = false;
        while (rs.next()) {
            hasProducts = true;
%>
<option value="<%= rs.getInt("product_id") %>"
        data-price="<%= rs.getDouble("price") %>"
        data-quantity="<%= rs.getInt("stock_quantity") %>"
        data-id="<%= rs.getInt("product_id") %>">
    <%= rs.getString("product_name") %>
</option>


<%
    }

    if (!hasProducts) {
%>
<option value="">No products available</option>
<%
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("<option value=''>Error retrieving products</option>");
    }
%>
