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

        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productImage = request.getParameter("productImage");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int stock_quantity = Integer.parseInt(request.getParameter("stock_quantity"));

    %>
    <h1><%= productName %></h1>
    <div class="product-display">
        <img src="img/<%= productImage %>" alt="<%= productName %>">
        <div class="product-details">
            <p class="price">Rs.<%= productPrice %></p>
            <div class="sizes">
                <h3>Available Sizes</h3>
                <span>XXL</span>
                <span>XL</span>
                <span>L</span>
                <span>M</span>
            </div>
            <p style="font-size: 12px" class="price">Stock Quantity :<%= stock_quantity %></p>
            <p style="font-size: 12px" class="price">Product ID :<%= productId %></p>
            <label class="qty-label">QTY</label>
            <input type="number" class="qty-input" value="1" min="1">
            <br>
            <button class="add-to-cart">Add to Cart</button>
            <button class="remove-item">Remove</button>
            <div class="description">
                <p><%= productDescription %></p>
            </div>

        </div>
    </div>
</div>
</body>
</html>
