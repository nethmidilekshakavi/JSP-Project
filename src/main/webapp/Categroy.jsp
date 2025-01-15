<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Category Loading</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Category Loading</h1>

<div class="container">
  <div class="form-group">
    <label for="staticCategory"><b>Static Categories</b></label>
    <select id="staticCategory" class="form-control">
      <option>Select</option>
      <%
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_project", "root", "1234");
          Statement statement = con.createStatement();
          String sql = "SELECT * FROM categories";
          ResultSet resultSet = statement.executeQuery(sql);

          while (resultSet.next()) {
      %>
      <option value="<%= resultSet.getInt("category_id") %>">
        <%= resultSet.getString("category_name") %>
      </option>
      <%
          }
          resultSet.close();
          statement.close();
          con.close();
        } catch (Exception e) {
            System.out.println(("Error loading categories: " + e.getMessage()));
        }
      %>
    </select>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
  function getCategory() {
    $.ajax({
      type: "GET",
      url: "get_Category.jsp",
      dataType: "JSON",
      success: function(data) {
        console.log(data);
        var categoryDropdown = $('#dynamicCategory');
        categoryDropdown.empty().append('<option>Please Select</option>');
        for (var i = 0; i < data.length; i++) {
          categoryDropdown.append($('<option/>', {
            value: data[i].category_id,
            text: data[i].category_name
          }));
        }
      },
      error: function(xhr, status, error) {
        console.error("Error: " + error);
      }
    });
  }

  // Trigger category loading on page load
  getCategory();
</script>

<h2>Dynamic Categories</h2>
<select id="dynamicCategory" class="form-control">
  <option>Please Select</option>
</select>

</body>
</html>
