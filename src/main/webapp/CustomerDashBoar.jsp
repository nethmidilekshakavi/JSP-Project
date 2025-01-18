<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Website</title>
    <link rel="stylesheet" href="styles.css">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background-color: #333;
            color: white;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 1rem;
            margin: 0;
        }

        .nav-links li {
            display: inline;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #ff9800;
        }

        .search-bar {
            display: flex;
            align-items: center;
        }

        .search-bar input[type="text"] {
            padding: 0.5rem;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
        }

        .search-bar button {
            padding: 0.5rem 1rem;
            font-size: 1rem;
            background-color: #ff9800;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
        }

        .search-bar button:hover {
            background-color: #f44336;
        }

        .home-section {
            padding: 4rem 2rem;
            text-align: center;
            background: linear-gradient(135deg, #8e44ad, #71b7e6);
            color: white;
        }

        .products-section {
            padding: 2rem;
            text-align: center;
        }

        .footer {
            padding: 1rem;
            background-color: #333;
            color: white;
            text-align: center;
        }
        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1.5rem;
            padding: 2rem;
            justify-items: center;
        }

        .category {
            text-align: center;
        }

        .category img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .category img:hover {
            transform: scale(1.1);
        }

        .category p {
            margin-top: 0.5rem;
            font-size: 1rem;
            font-weight: bold;
            color: #333;
        }

        .category-select select {
            padding: 10px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            color: #333;
            outline: none;
            cursor: pointer;
            appearance: none; /* Removes default arrow icon on most browsers */
        }

        .category-select select:hover {
            border-color: #888;
        }

        .category-select select:focus {
            border-color: #555;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        .category-select button {
            padding: 8px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: white;
            cursor: pointer;
        }

        .category-select button:hover {
            background-color: #555;
        }

        /* CSS for RoodyFashion logo */
        .logo {
            font-family: 'Courier New', Courier, monospace;
            font-size: 28px;

            text-transform: capitalize;
            letter-spacing: 0.5px;

            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: 0 8px 10px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
        }
        /* CSS for Video Boxes */
        .video-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 10px;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .video-box {
            flex: none;
            width: 300px;
            height: 200px;
            box-sizing: border-box;
            margin: 15px;
            border: 2px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .video-box video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .video-box:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }


    </style>

</head>
<body>
<nav class="navbar">
    <div class="logo">RFashion</div>
    <ul class="nav-links">
        <li><a href="#home">Home</a></li>
        <li><a href="#products">Products</a></li>
        <li><a href="#about">About Us</a></li>
        <li><a href="#contact">Contact</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="signup.jsp">Sign Up</a></li>
    </ul>
    <form class="category-select" action="category.jsp" method="get">
        <select name="category">
            <option value="" disabled selected>Select Category</option>
            <option value="women">Women</option>
            <option value="men">Men</option>
            <option value="kids">Kids & Baby</option>
            <option value="dresses">Dresses</option>
            <option value="tops">Tops</option>
            <option value="accessories">Accessories</option>
            <option value="shoes">Shoes & Bags</option>
            <option value="home-living">Home & Living</option>
            <option value="sports-outdoor">Sports & Outdoor</option>
            <option value="beauty-health">Beauty & Health</option>
        </select>
        <button type="submit">Go</button>
    </form>
</nav>


<header id="home" class="home-section">
    <h1>Welcome to RFashion</h1>
    <p>Your one-stop shop for all your needs!</p>
</header>

<section class="categories">
    <div class="category">
        <img src="Image/Categories/clothes/123b8c354ba4f81d2f2bba92ed701178.jpg" alt="Women">
        <p>Women</p>
    </div>
    <div class="category">
        <img src="Image/Categories/clothes/97a8b26b43a1dabc9d4b227dedb781ef.jpg" alt="Men">
        <p>Men</p>
    </div>
    <div class="category">
        <img src="Image/Categories/clothes/629c5c3dcca16da8552d29148adceebd.jpg" alt="Kids & Baby">
        <p>Kids & Baby</p>
    </div>
    <div class="category">
        <img src="Image/Categories/Sports/57dcb7942290828ddd76af5d612be9eb.jpg" alt="Co-ords">
        <p>Sports & Outdoor</p>
    </div>
    <div class="category">
        <img src="Image/Categories/Furniture/3ec58fd41bb26d66150e8b63c8b03d0d.jpg" alt="Home & Living">
        <p>Furniture</p>
    </div>
    <div class="category">
        <img src="Image/Categories/Footwear/248c1bb6beb29fa0c9f7f00ec4d8881a.jpg" alt="Shoes & Bags">
        <p>Shoes</p>
    </div>
    <div class="category">
        <img src="Image/Categories/Bags/5c4f554d13f7cc4a932a4af1ed43e004.jpg" alt="Shoes & Bags">
        <p>Bags</p>
    </div>
    <div class="category">
        <img src="Image/Categories/Eeletronic/f30582afd1b9213faca85ee312a77164.jpg" alt="Shoes & Bags">
        <p>Electronic</p>
    </div>
</section>

<!-- HTML Structure for Video Boxes -->
<!-- HTML Structure for Video Boxes -->
<div class="video-container">
    <div class="video-box">
        <video src="Image/vidio/4d31e43c97e21f4a967de19993bb60ac.mp4" autoplay loop muted></video>
    </div>
    <div class="video-box">
        <video src="Image/vidio/12d7ff8531f6a2b40d14eadb3d5ac27a.mp4" autoplay loop muted></video>
    </div>
    <div class="video-box">
        <video src="Image/vidio/d657b8000680933895d8c37e7b00980c.mp4" autoplay loop muted></video>
    </div>
    <div class="video-box">
        <video src="Image/vidio/a4d404acb7fd79e987ce1d9a4299b411.mp4" autoplay loop muted></video>
    </div>
</div>


<footer class="footer">
    <p> 2025 RFashion. All rights reserved.</p>
</footer>
</body>
</html>
