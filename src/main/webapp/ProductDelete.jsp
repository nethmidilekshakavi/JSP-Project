<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Delete</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="css/CategoryUpdatePage.css">
</head>
<body>
<h1>Product Delete</h1>

<%
  String msg = request.getParameter("message");
  String error = request.getParameter("error");
%>

<% if (msg != null) { %>
<script>
  Swal.fire({
    icon: 'success',
    title: 'Success!',
    text: '<%= msg %>',
    showConfirmButton: true,
    timer: 3000
  });
</script>
<% } %>

<% if (error != null) { %>
<script>
  Swal.fire({
    icon: 'error',
    title: 'Error!',
    text: '<%= error %>',
    showConfirmButton: true,
    timer: 3000
  });
</script>
<% } %>

<form id="deleteForm" action="product-Delete" method="post" onsubmit="return confirmDelete()">
  <label for="ProductID">Product ID:</label>
  <input type="text" id="ProductID" name="Pid" required><br><br>

  <button type="submit" style="background-color: red">Delete Product</button>
</form>

<script>
  function confirmDelete() {
    // Show the SweetAlert confirmation popup
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'Cancel',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        // Submit the form if user confirms
        document.getElementById('deleteForm').submit();
      } else {
        // Prevent form submission if user cancels
        return false;
      }
    });

    // Prevent immediate form submission
    return false;
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
