<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations - BookEase</title>
    <link href="displayStyle.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
<!-- Header -->
    <header class="main-header">
        <div class="logo-container">
            <h1 class="brand-name">BookEase</h1>
        </div>
        
        <!-- Nav Bar -->
        <nav class="main-nav">
            <ul>
                <li><a href="home.jsp" class="active">Home</a></li>
                <li><a href="reservation.jsp">Reservations</a></li>
                <li><a href="price.jsp">View Prices</a></li>
                <li><a href="display.jsp">My Reservations</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="profile.jsp" class="profile">My Profile</a></li>
           
            </ul>
        </nav>
    </header>

    <div class="container">
        <h1>My Reservations</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Number of Guests</th>
                <th>Date</th>
                <th>Room Type</th>
                <th>Payment Method</th>
                <th>Action</th>
            </tr>

            <c:forEach var="reservations" items="${allreservations}">
                <tr>
                    <td>${reservations.id}</td>
                    <td>${reservations.customer_name}</td>
                    <td>${reservations.phone}</td>
                    <td>${reservations.no_of_guests}</td>
                    <td>${reservations.date}</td>
                    <td>${reservations.room_type}</td>
                    <td>${reservations.payment_method}</td>
                    <td>
                        <a href="update.jsp?id=${reservations.id}&customer_name=${reservations.customer_name}&phone=${reservations.phone}&no_of_guests=${reservations.no_of_guests}&date=${reservations.date}&room_type=${reservations.room_type}&payment_method=${reservations.payment_method}">
                            <button>Update</button>
                        </a>
                        
                        <form action="DeleteServlet" method="post">
                            <input type="hidden" name="id" value="${reservations.id}">
                            <button>Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>


</body>
</html>
