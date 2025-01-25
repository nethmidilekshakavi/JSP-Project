<%@ page import="com.example.lk.ijse.AdminServlet" %>
<%@ page import="com.example.lk.ijse.LoginServlet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chic Collection | FashionHub</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to left, #71b7e6, #9b59b6);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2.5em;
        }

        .product-display {
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .product-display img {
            width: 300px;
            height: 300px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-details {
            margin-left: 20px;
            flex: 1;
        }

        .product-details .price {
            font-size: 2em;
            color: #28a745;
        }

        .product-details .sizes {
            margin-top: 20px;
        }

        .product-details .sizes h3 {
            margin-bottom: 10px;
        }

        .product-details .sizes span {
            display: inline-block;
            background-color: #e9e9e9;
            color: #333;
            padding: 5px 10px;
            border-radius: 5px;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .product-details .sizes span:hover {
            background-color: #d3d3d3;
        }

        .add-to-cart {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        .add-to-cart:hover {
            background-color: #218838;
        }

        .remove-item {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s;
            margin-top: 20px;
            margin-left: 10px;
        }

        .remove-item:hover {
            background-color: #c82333;
        }

        .description {
            margin-top: 20px;
            font-size: 1.1em;
            color: #666;
        }
        .qty-label {
            font-size: 1.2em;
            color: #333;
            margin-top: 20px;
        }

        .qty-input {
            width: 60px;
            padding: 5px;
            font-size: 1.2em;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="container">

    <%

        int uid = LoginServlet.useriD;

        String productName = request.getParameter("productName");
        productName = (productName != null) ? productName : "Unknown Product";

        String productDescription = request.getParameter("productDescription");
        productDescription = (productDescription != null) ? productDescription : "No description available";

        String productImage = request.getParameter("productImage");
        productImage = (productImage != null) ? productImage : "default.jpg";

        String productPriceParam = request.getParameter("productPrice");
        double productPrice = 0.0;
        if (productPriceParam != null && !productPriceParam.isEmpty()) {
            try {
                productPrice = Double.parseDouble(productPriceParam);
            } catch (NumberFormatException e) {
                System.out.println("Invalid product price format.");
            }
        }

        String productIdParam = request.getParameter("productId");
        int productId = (productIdParam != null && !productIdParam.isEmpty()) ? Integer.parseInt(productIdParam) : 0;

        String stockQuantityParam = request.getParameter("stock_quantity");
        int stock_quantity = (stockQuantityParam != null && !stockQuantityParam.isEmpty()) ? Integer.parseInt(stockQuantityParam) : 0;
    %>


    <h1><%= productName %></h1>
    <div class="product-display">
        <img src="img/<%= productImage %>" alt="<%= productName %>">
        <div class="product-details">
            <p class="userID">User ID  :-<%= uid %></p>
            <p class="price">Price per unit: Rs.<%= productPrice %></p>
            <div class="sizes">
                <h3>Available Sizes</h3>
                <select id="sizeSelect" onchange="updateSelectedSize()">
                    <option value="XXL">XXL</option>
                    <option value="XL">XL</option>
                    <option value="L">L</option>
                    <option value="M">M</option>
                </select>
            </div>

            <p style="font-size: 12px" class="price">Stock Quantity: <%= stock_quantity %></p>
            <p style="font-size: 12px" class="price">Product ID: <%= productId %></p>

            <label class="qty-label">QTY</label>
            <input
                    type="number"
                    class="qty-input"
                    id="quantityInput"
                    name="qty"
                    value="1"
                    min="1"
                    max="<%= stock_quantity %>"
                    oninput="updateTotalPrice(<%= productPrice %>)">

            <p class="price">Total: Rs.<span id="totalPrice"><%= productPrice %></span></p>

            <form action="cartSave" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productId" value="<%= productId %>">
                <input type="hidden" name="userid" value="<%= uid %>">
                <input type="hidden" name="productName" value="<%= productName %>">
                <input type="hidden" name="stock_quantity" value="<%= stock_quantity %>">
                <input type="hidden" name="productDescription" value="<%= productDescription %>">
                <input type="hidden" name="productPrice" value="<%= productPrice %>">
                <input type="hidden" name="productImage" value="<%= productImage %>">
                <input type="hidden" name="selectedSize" id="hiddenSize">
                <input type="hidden" name="qty" id="hiddenQty">
                <button type="submit" class="add-to-cart" onclick="setFormValues()">Add to Cart</button>
            </form>

            <form action="user-delete">
                <input type="hidden" name="userid" value="<%= uid %>">
            </form>

            <button class="remove-item">Remove</button>
            <div class="description">
                <p><%= productDescription %></p>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to update the selected size
    function updateSelectedSize() {
        const selectedSize = document.getElementById("sizeSelect").value;
        document.getElementById("hiddenSize").value = selectedSize;
    }

    // Function to update the total price based on the quantity
    function updateTotalPrice(pricePerUnit) {
        const quantity = document.getElementById("quantityInput").value;
        const totalPrice = pricePerUnit * quantity;
        document.getElementById("totalPrice").innerText = totalPrice.toFixed(2);
    }

    // Function to set hidden form values before submission
    function setFormValues() {
        const quantity = document.getElementById("quantityInput").value;
        document.getElementById("hiddenQty").value = quantity;
        updateSelectedSize();
    }

</script>


</body>
</html>
