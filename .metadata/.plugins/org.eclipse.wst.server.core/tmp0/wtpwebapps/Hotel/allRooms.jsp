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
  <title>Hotel Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/login/">
  <style>
    body {
      background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
      background-size: cover;
      background-position: center;
    }

    .navbar {
      background-color: #333;
    }

    .navbar-brand {
      color: #fff;
    }

    .navbar-brand:hover {
      color: #ccc;
    }

    .navbar-toggler-icon {
      background-image: url('https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/icons/menu-up.svg');
    }

    .allRooms {
      width: 120%;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }

    .allRooms table {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .allRooms th {
      text-align: center;
      background-color: #333;
      color: #fff;
    }

    .allRooms td {
      text-align: center;
      color:black;
    }

    .whysignLogin {
      width: 70%;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .whysignLogin h1 {
      text-align: center;
    }

    .whysignLogin h2 {
      text-align: center;
    }

    .whysignLogin p {
      text-align: center;
    }

    button {
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width:175px;
    }

    button:hover {
      background-color: #555;
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

  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="allRooms">
          <table>
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Type</th>
                <th scope="col">Capacity</th>
                <th scope="col">Price</th>
                <th scope="col">Discount</th>
                <th scope="col">Net Price</th>
                <th scope="col">Status</th>
                <th scope="col">Description</th>
                <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
                <th scope="col">Delete <i class='fas fa-pen-fancy'></i></th>
              </tr>
            </thead>
            <tbody>
              <%
              String msg=request.getParameter("msg");
              if("done ".equals(msg)){
              %>
              <h3 class="alert">Room Successfully Updated!</h3>
              <%} %>
              <%
              if("wrong".equals(msg)){
              %>
              <h3 class="alert">Some thing went wrong! Try again!</h3>
              <%} %>
              <%
try{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from room");
    
    if(rs.next()) {
        rs.beforeFirst(); // Reset the ResultSet to the beginning
    } else {
        out.println("No rooms found in the database.");
    }
    
    while (rs.next()){
        double price = Double.parseDouble(rs.getString(4));
        String discount = rs.getString(7); // Get the discount as a string
        double netPrice = price;
        
        // Check if the discount is a percentage
        if(discount.contains("%")) {
            double discountPercentage = Double.parseDouble(discount.replace("%", ""));
            netPrice = price - (price * discountPercentage / 100);
        }
%>
        <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getDouble(5) %></td>
            <td><%=rs.getDouble(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
            <td><a href="editRoom.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            <td><a href="deleteRoom.jsp?id=<%=rs.getString(1) %>">Delete <i class='fas fa-pen-fancy'></i></a></td>
        </tr>
<%
    }
} catch(Exception e){
    System.out.print(e);
    out.println("An error occurred: " + e.getMessage());
}
%>
            </tbody>
          </table>
        </div>
        <center><button onclick="location.href='addDetails.jsp'">Add New Room</button>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="main-footer">
    <p>BookEase - Your one-stop hotel reservation system | &copy; 2024</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr38bgBIFaxYSKm+9PlTWEq1Aul69Egi0h4ycNR7GZD+2W/89V3ttD5v+N" crossorigin="anonymous"></script>
</body>
</html>