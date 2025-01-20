<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!-- Trigger Button to open the form -->
<button id="openFormBtn" class="open-popup-btn">Add Product</button>

<!-- Modal (Popup) Form -->
<div id="productModalUpdate" class="modal">
  <div class="modal-content">
    <span class="close-btn" onclick="closeForm()"></span>
    <h2>Add Product</h2>
    <form action="category-update" method="post">
      <label for="categoryId">Category ID:</label>
      <input type="text" id="categoryId" name="Cid" required><br><br>

      <label for="categoryName">Category Name:</label>
      <input type="text" id="categoryName" name="Cname" required><br><br>

      <label for="categoryDescription">Description:</label>
      <input type="text" id="categoryDescription" name="Cdesc" required><br><br>

      <button type="submit" style="background-color: yellow" >Update Customer</button>
    </form>
  </div>
</div>

<!-- View Button -->
<div class="button-set" id="button-set">
  <a href="ProductList.jsp">
    <button type="button" class="btn-view" style="background-color:#71b7e6; width: 300px; display: block; margin: 10px auto;">View Table</button>
  </a>
</div>

<script>
  // Get the modal
  var modal = document.getElementById("productModalUpdate");

  // Get the button that opens the modal
  var btn = document.getElementById("openFormBtn");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close-btn")[0];

  // When the user clicks the button, open the modal
  btn.onclick = function() {
    modal.style.display = "block";
  };

  // When the user clicks on <span> (x), close the modal
  function closeForm() {
    modal.style.display = "none";
  }

  // Close the modal if the user clicks anywhere outside of the modal
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
</script>

<style>
  /* Modal (Popup Form) */
  .modal {
    display: none; /* Hidden by default */
    position: fixed;
    top: 50%; /* Position it 50% from the top of the screen */
    left: 50%; /* Position it 50% from the left of the screen */
    transform: translate(-50%, -50%); /* Offset it by 50% of its own size, centering it */
    width: 400px; /* You can adjust the width of the modal */
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
    justify-content: center;
    align-items: center;
    z-index: 1000; /* Ensure the modal appears above other content */
  }

  /* Modal content (form) */
  .modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    width: 100%; /* Set to 100% to make it responsive inside the modal */
    max-width: 400px; /* Limit the width */
    text-align: center;
  }

  .modal-content h2 {
    margin-bottom: 20px;
  }

  .modal-content label {
    font-weight: bold;
    margin-bottom: 10px;
    display: block;
  }

  .modal-content input,
  .modal-content select {
    padding: 10px;
    width: 100%;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .modal-content .submit-btn {
    padding: 10px 20px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .modal-content .submit-btn:hover {
    background-color: #218838;
  }

  /* Close button */
  .close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 30px;
    cursor: pointer;
  }

  .close-btn:hover {
    color: red;
  }

</style>
