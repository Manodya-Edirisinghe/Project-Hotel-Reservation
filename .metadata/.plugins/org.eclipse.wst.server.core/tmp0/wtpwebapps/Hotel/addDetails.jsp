<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <script src="/docs/5.3/assets/js/color-modes.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.122.0">
  <title>Add Room Details - Hotel Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    body {
      background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&ixid=MnwxMjA3 fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
      background-size: cover;
      background-position: center;
      color: black;
    }

    .navbar {
      background-color: #333;
    }

    .navbar-brand {
      color: #fff;
    }

    .container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-label {
      font-weight: bold;
    }

    button {
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 175px;
    }

    button:hover {
      background-color: #555;
    }

    /* Header Styles */
    .main-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #6495ED;
      padding: 10px 20px;
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
      background-color: #DFF0D8;
      border-radius: 30px;
      padding: 8px 15px;
    }

    .main-nav ul li a:hover {
      color: #f0e68c;
    }

    /* Footer Styles */
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
      <ul >
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
    <h1 class="text-center">Add New Room Details</h1>
    <%
    int id = 1;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select max(id) from room");
        if (rs.next()) {
            id = rs.getInt(1) + 1;
        }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    }
    %>
    <form action="addRoomServlet" method="POST">
      <h3 class="text-center">Room ID: <%= id %></h3>
      <input type="hidden" name="id" value="<%= id %>">

      <div class ="mb-3">
        <label class="form-label" for="type">Room Type:</label>
        <select class="form-select" name="type" required>
          <option value="Single">Single</option>
          <option value="Double">Double</option>
          <option value="Suite">Suite</option>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label" for="capacity">Room Capacity:</label>
        <input class="form-control" type="number" name="capacity" id="capacity" placeholder="Enter Room Capacity" required oninput="this.value = this.value.replace(/[^0-9]/g, '');">
      </div>

      <div class="mb-3">
        <label class="form-label" for="price">Room Price:</label>
        <input class="form-control" type="number" name="price" id="price" placeholder="Enter Room Price" required>
      </div>

      <div class=" mb-3">
        <label class="form-label" for="discount">Discount (%):</label>
        <input class="form-control" type="number" name="discount" id="discount" placeholder="Enter Discount Percentage" required>
      </div>

      <div class="mb-3">
    <label class="form-label" for="netPrice">Net Room Price:</label>
    <input readonly class="form-control" type="number" id="netPrice" name="netPrice" required>
</div>

      <div class="mb-3">
        <label class="form-label" for="status">Room Status:</label>
        <select class="form-select" name="status" required>
          <option value="Available">Available</option>
          <option value="Occupied">Occupied</option>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label" for="description">Room Description:</label>
        <textarea class="form-control" name="description" placeholder="Enter Room Description" required></textarea>
      </div>

      <center><button type="submit">Add Room</button></center>
    </form>

    <script>
      const priceInput = document.getElementById('price');
      const discountInput = document.getElementById('discount');
      const netPriceInput = document.getElementById('netPrice');

      priceInput.addEventListener('input', calculateNetPrice);
      discountInput.addEventListener('input', calculateNetPrice);

      function calculateNetPrice() {
        const price = parseFloat(priceInput.value);
        const discount = parseFloat(discountInput.value);
        const netPrice = price - (price * (discount / 100));
        netPriceInput.value = netPrice.toFixed(2);
      }
    </script>
  </div>

  <!-- Footer -->
  <footer class="main-footer">
    <p>BookEase - Your one-stop hotel reservation system | &copy; 2024</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr38bgBIFaxYSKm+9PlTWEq1Aul69Egi0h4ycNR7GZD+2W/89V3ttD5v+N" crossorigin="anonymous"></script>
</body>
</html>