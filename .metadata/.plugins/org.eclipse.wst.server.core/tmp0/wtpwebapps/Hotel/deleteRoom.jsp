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
  <title>Delete Room</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    body {
      background-image: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
      background-size: cover;
      background-position: center;
    }

    .deleteRoom {
      width: 60%;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      background-color: #fff;
    }

    .deleteRoom h2 {
      text-align: center;
      margin-bottom: 20px;
      color:black;
    }

    .deleteRoom p {
      text-align: center;
      font-size: 18px;
      color:black;
    }

    .deleteRoom input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #d9534f;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .deleteRoom input[type="submit"]:hover {
      background-color: #c9302c;
    }
  </style>
</head>
<body>
  <%
String id = request.getParameter("id");
String roomType = "";
String capacity = "";
String price = "";
String status = "";
String description = "";

try {
  Connection con = ConnectionProvider.getCon();
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM room WHERE id='" + id + "'");
  if (rs.next()) {
    roomType = rs.getString("type");
    capacity = rs.getString("capacity");
    price = rs.getString("price");
    status = rs.getString("status");
    description = rs.getString("description");
%>

<div class="deleteRoom">
  <h2>Delete Room</h2>
  <p>Are you sure you want to delete the following room?</p>
  <p><strong>Type:</strong> <%= roomType %></p>
  <p><strong>Capacity:</strong> <%= capacity %></p>
  <p><strong>Price:</strong> <%= price %></p>
  <p><strong>Status:</strong> <%= status %></p>
  <p><strong>Description:</strong> <%= description %></p>
  <form action="deleteRoomServlet" method="POST">
    <input type="hidden" name="_method" value="DELETE">
    <input type="hidden" name="id" value="<%= id %>">
    <input type="submit" value="Delete Room">
  </form>
</div>

<%
} else {
  out.println("<p>Room not found.</p>");
}
} catch (Exception e) {
  out.println(e.getMessage());
}
%>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr38bgBIFaxYSKm+9PlTWEq1 Aul69Egi0h4ycNR7GZD+2W/89V3ttD5v+N" crossorigin="anonymous"></script>
</body>
</html>