<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Reservation - BookEase</title>
    <link href="homereservationStyle.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <script>
        function validateForm() {
            var name = document.getElementsByName("customer_name")[0].value;
            var phone = document.getElementsByName("phone")[0].value;

            var nameRegex = /^[A-Za-z\s]+$/;
            var phoneRegex = /^[0-9]{10}$/;

            // Validate if phone number is exactly 10 digits and contains only numbers
            if (!phoneRegex.test(phone)) {
                alert("Phone number must be exactly 10 digits and contain only numbers.");
                return false;  // Prevent form submission
            }

            // Validate if name contains only letters and spaces (no digits)
            if (!nameRegex.test(name)) {
                alert("Name must contain only letters.");
                return false;
            }

            return true; 
        }

        // Prevent non-numeric characters from being typed in the phone number field
        function onlyNumbers(event) {
            var charCode = event.which ? event.which : event.keyCode;
            if (charCode < 48 || charCode > 57) {
                event.preventDefault();
            }
        }

        // Prevent numeric characters from being typed in the name field
        function onlyLetters(event) {
            var charCode = event.which ? event.which : event.keyCode;
            if (charCode >= 48 && charCode <= 57) {
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <header class="main-header">
        <div class="logo-container">
            <h1 class="brand-name">BookEase</h1>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="home.jsp">Home</a></li>
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
        <header>Update Reservation</header>
        <%
            // Fetch current reservation details from the request
            String id = request.getParameter("id");
            String customer_name = request.getParameter("customer_name");
            String phone = request.getParameter("phone");
            String noofguests = request.getParameter("no_of_guests");
            String date = request.getParameter("date");
            String room_type = request.getParameter("room_type");
            String payment_method = request.getParameter("payment_method");
        %>

        <form action="UpdateServlet" method="post" onsubmit="return validateForm()">
            <div class="fields top-fields">
                <div class="input-field">
                    <label>ID</label>
                    <input type="text" name="id" value="<%= id %>" readonly>
                </div>

                <div class="input-field">
                    <label>Name</label>
                    <input type="text" name="customer_name" value="<%= customer_name %>" placeholder="Enter Your Name" required onkeypress="onlyLetters(event)">
                </div>

                <div class="input-field">
                    <label>Phone Number</label>
                    <input type="text" name="phone" value="<%= phone %>" placeholder="Enter Your Phone Number" required onkeypress="onlyNumbers(event)">
                </div>

                <div class="input-field">
                    <label>Number of Guests</label>
                    <select name="no_of_guests" required>
                        <option value="" disabled>Select Number of Guests</option>
                        <option value="1" <%= (noofguests.equals("1") ? "selected" : "") %>>1</option>
                        <option value="2" <%= (noofguests.equals("2") ? "selected" : "") %>>2</option>
                        <option value="3" <%= (noofguests.equals("3") ? "selected" : "") %>>3</option>
                        <option value="4" <%= (noofguests.equals("4") ? "selected" : "") %>>4</option>
                        <option value="5" <%= (noofguests.equals("5") ? "selected" : "") %>>5</option>
                        <option value="6" <%= (noofguests.equals("6") ? "selected" : "") %>>6</option>
                        <option value="7" <%= (noofguests.equals("7") ? "selected" : "") %>>7</option>
                        <option value="8" <%= (noofguests.equals("8") ? "selected" : "") %>>8</option>
                        <option value="9" <%= (noofguests.equals("9") ? "selected" : "") %>>9</option>
                        <option value="10" <%= (noofguests.equals("10") ? "selected" : "") %>>10</option>
                    </select>
                </div>
            </div>

            <div class="fields bottom-fields">
                <div class="input-field">
                    <label>Date</label>
                    <input type="date" name="date" value="<%= date %>" required>
                </div>

                <div class="input-field">
                    <label>Room Type</label>
                    <select name="room_type" required>
                        <option value="" disabled>Select Room Type</option>
                        <option value="Single" <%= (room_type.equals("Single") ? "selected" : "") %>>Single</option>
                        <option value="Double" <%= (room_type.equals("Double") ? "selected" : "") %>>Double</option>
                        <option value="Family" <%= (room_type.equals("Family") ? "selected" : "") %>>Family</option>
                    </select>
                </div>

                <div class="input-field">
                    <label>Payment Method</label>
                    <select name="payment_method" required>
                        <option value="" disabled>Select Payment Method</option>
                        <option value="Credit/Debit Card" <%= (payment_method.equals("Credit/Debit Card") ? "selected" : "") %>>Credit/Debit Card</option>
                        <option value="Pay Later" <%= (payment_method.equals("Pay Later") ? "selected" : "") %>>Pay Later</option>
                    </select>
                </div>
            </div>

            <input type="submit" name="submit" value="Update Reservation">
        </form>
    </div>

    <footer class="main-footer">
        <p>BookEase - Your one-stop hotel reservation system | &copy; 2024</p>
    </footer>
</body>
</html>
