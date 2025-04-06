<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order History</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Order History</h2>

    <form method="get" class="mb-4">
        <input type="text" name="search" placeholder="Search by Order ID or Status" value="${search}" class="form-control mb-2"/>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <c:if test="${empty orders}">
        <div class="alert alert-warning">No orders found.</div>
    </c:if>

    <c:forEach var="order" items="${orders}">
        <div class="card mb-4">
            <div class="card-header">
                <strong>Order #${order.id}</strong> |
                Date: ${order.orderDate} |
                Total: ₹${order.totalAmount}
            </div>
            <ul class="list-group list-group-flush">
                <c:forEach var="item" items="${order.items}">
                    <li class="list-group-item">
                        Product ID: ${item.productId} |
                        Qty: ${item.quantity} |
                        Price: ₹${item.price}
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:forEach>

    <!-- Pagination -->
    <div class="d-flex justify-content-between">
        <c:if test="${page > 1}">
            <a href="?search=${search}&page=${page - 1}" class="btn btn-secondary">Previous</a>
        </c:if>
        <c:if test="${hasNext}">
            <a href="?search=${search}&page=${page + 1}" class="btn btn-secondary ms-auto">Next</a>
        </c:if>
    </div>
</div>
</body>
</html>
