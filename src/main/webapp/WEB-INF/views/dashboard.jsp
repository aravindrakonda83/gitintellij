<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>DMart Ready - Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
    <style>
        body {
            background-color: #f0f2f5;
        }

        h2 {
            font-weight: bold;
            color: #007e3a;
            text-align: center;
            margin-bottom: 10px;
            font-size: 60px;
        }

        h4 {
            font-size: 26px;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .category-bar {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .category-btn {
            background-color: #007e3a;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .category-btn:hover {
            background-color: #005c2a;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 260px;
            height: 400px;
            margin: auto;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            text-align: center;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
        }

        .card img {
            width: 100%;
            height: 180px;
            object-fit: contain;
            background-color: #f8f9fa;
        }

        .card-body {
            text-align: center;
            padding: 10px;
        }

        .card h3 {
            font-size: 16px;
            margin: 5px 0;
        }

        .card p {
            font-size: 14px;
            color: #555;
        }

        .card button {
            background-color: #ff6347;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
        }

        .card button:hover {
            background-color: #e55340;
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #007e3a !important;
        }

        .nav-link {
            font-weight: 500;
        }

        .nav-link:hover {
            color: #007e3a !important;
        }
    </style>
</head>
<body>

<!-- 🔹 Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">DMart Ready</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Categories</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Offers</a></li>
                <li class="nav-item"><a class="nav-link" href="cart">Cart 🛒</a></li>
                <li class="nav-item"><a class="nav-link" href="order-history">Order History 📦</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Login / Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- 🧭 Category Filter Bar -->
<div class="container mt-4">
    <div class="category-bar">
        <form action="products" method="get">
            <button class="category-btn" name="category" value="All">All</button>
            <button class="category-btn" name="category" value="Fruits">Fruits</button>
            <button class="category-btn" name="category" value="Vegetables">Vegetables</button>
            <button class="category-btn" name="category" value="Beverages">Beverages</button>
            <button class="category-btn" name="category" value="Snacks">Snacks</button>
            <button class="category-btn" name="category" value="Household">Household</button>
        </form>
    </div>
</div>

<!-- 🛍️ Product Display -->
<div class="container mt-3">
    <h2>🛒</h2>
    <h4>Available Products</h4>
    <div class="product-list">
        <c:forEach var="product" items="${products}">
            <div class="card">
                <img src="${product.imageUrl}" alt="${product.name}">
                <div class="card-body">
                    <h3>${product.name}</h3>
                    <p>₹${product.price}</p>
                    <form action="add-to-cart" method="post">
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>