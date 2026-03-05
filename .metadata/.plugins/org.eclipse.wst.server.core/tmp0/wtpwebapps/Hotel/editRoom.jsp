<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
            background-size: cover;
            background-position: center;
            color: black;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        /* Header Styles CSS */
        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Ensures items align vertically */
            background-color: #6495ED;
            padding: 10px 20px; /* Added more padding for better spacing */
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .brand-name {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            font-size: 24px;
            color: white;
        }

        .main-nav ul {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .main-nav ul li {
            margin-left: 30px;
        }

        .main-nav ul li a {
            font-family: 'Poppins', sans-serif;
            font-weight: 400;
            font-size: 16px;
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .main-nav ul li a.profile {
            color: #45a049;
            background-color: #DFF0D8; /* Light green background fill */
            border-radius: 30px; /* Optional: rounded corners */
            padding: 8px 15px;
        }

        .main-nav ul li a:hover {
            color: #f0e68c;
        }

        /* Footer Styles CSS */
        .main-footer {
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="main-header">
    <div class="logo-container">
        <h1 class="brand-name">BookEase</h1>
    </div>
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

<div class="form-container">
    <h2>Edit Room</h2>
    <%
    String id = request.getParameter("id");
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM room WHERE id = ?");
        ps.setString(1 , id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
    %>
    <form action="editRoomServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getString("id") %>">
        <div class="mb-3">
    <label for="type" class="form-label">Room Type</label>
    <select class="form-select" name="type" required>
        <option value="Single" <%= "Single".equals(rs.getString("type")) ? "selected" : "" %>>Single</option>
        <option value="Double" <%= "Double".equals(rs.getString("type")) ? "selected" : "" %>>Double</option>
        <option value="Suite" <%= "Suite".equals(rs.getString("type")) ? "selected" : "" %>>Suite</option>
    </select>
</div>
        <div class="mb-3">
            <label for="capacity" class="form-label">Capacity</label>
            <input type="number" class="form-control" id="capacity" name="capacity" value="<%= rs.getString("capacity") %>" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="text" class="form-control" id="price" name="price" value="<%= rs.getString("price") %>" required>
        </div>
        <div class="mb-3">
            <label for="discount" class="form-label">Discount (%)</label>
            <input type="text" class="form-control" id="discount" name="discount" value="<%= rs.getString("discount") %>" required>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status">
                <option value="Available" <%= "Available".equals(rs.getString("status")) ? "selected" : "" %>>Available</option>
                <option value="Unavailable" <%= "Unavailable".equals(rs.getString("status")) ? "selected" : "" %>>Unavailable</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required><%= rs.getString("description") %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Room</button>
    </form>
    <%
        } else {
            out.println("<p>Room not found.</p>");
        }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    }
    %>
</div>

<!-- Footer -->
<footer class="main-footer">
    <p>BookEase - Your one-stop hotel reservation system | &copy; 2024</p>
</footer>
</body>
</html>