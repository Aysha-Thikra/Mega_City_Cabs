<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.util.*" %>
<%
    String userId = (String) session.getAttribute("userId");

    if (userId == null) {
        out.println("Error: User ID is missing.");
    } else {
        String dbURL = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
        String dbUsername = "root";
        String dbPassword = "1234";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
            
            String sql = "SELECT firstName, lastName, phoneNumber, email FROM users WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");

                session.setAttribute("firstName", firstName);
                session.setAttribute("lastName", lastName);
                session.setAttribute("phone", phoneNumber);
                session.setAttribute("email", email);
            } else {
                out.println("Error: User not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        /* CSS Styles */
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --black-transparent: rgba(0, 0, 0, 0.5);
        }

        .booking-container {
            max-width: 800px;
            margin: 100px auto;
            padding: 30px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            margin-bottom: -20px;
        }

        .booking-container h2 {
            font-size: 28px;
            margin-bottom: 30px;
            color: #333;
            font-weight: bold;
        }

        .form-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            margin-right: 10px;
            font-size: 16px;
            width: 120px;
            text-align: left;
        }

        .form-group input, .form-group select {
            padding: 15px;
            font-size: 16px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group i {
            font-size: 20px;
            margin-right: 10px;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: var(--orange);
            outline: none;
        }

        .next-btn, .cancel-btn {
            background-color: var(--orange);
            color: white;
            padding: 15px 20px;
            border: none;
            font-size: 18px;
            cursor: pointer;
            width: 100%;
            border-radius: 5px;
            transition: 0.3s;
            grid-column: span 2;
            margin-bottom: 15px;
        }

        .next-btn:hover {
            background-color: var(--yellow);
        }

        .cancel-btn {
            background: linear-gradient(135deg, #ff4c4c, #e02424);
        }

        .cancel-btn:hover {
            background: linear-gradient(135deg, #e02424, #c21f1f);
            transform: translateY(-2px);
        }
        
        .payment-fields {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 15px;
            text-align: left;
            font-size: 16px;
            margin-bottom: 25px;
            padding: 15px 20px;
            background: #f9f9f9;
            border-radius: 8px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .payment-fields input {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-top: 5px;
            width: 100%;
        }

        .payment-fields p {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
            color: #444;
            display: flex;
            align-items: center;
        }

        .payment-fields p:last-child {
            border-bottom: none;
        }

        .payment-fields i {
            margin-right: 10px;
            color: var(--orange);
        }

        .payment-fields strong {
            margin-right: 10px;
            font-weight: 600;
        }
    </style>
</head>

<body style="background-color: #ff8400;">

    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="customer-dashboard.jsp">Dashboard</a>
            <a href="booking.jsp?userId=<%= session.getAttribute("userId") %>">Book a Ride</a>
            <a href="booking-history.jsp?userId=<%= session.getAttribute("userId") %>">Booking History</a>
            <a href="feedback.jsp?userId=<%= session.getAttribute("userId") %>">Give Feedbacks</a>
            <a href="profile.jsp">Profile</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='customer-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <!-- Booking Form -->
    <div class="booking-container">
        <h2>Book Your Ride</h2>
        <form action="booking" method="post" onsubmit="return validateForm()">
            <div class="form-container">
                <!-- User Information Form -->
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" value="<%= session.getAttribute("firstName") != null ? session.getAttribute("firstName") : "" %>" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" value="<%= session.getAttribute("lastName") != null ? session.getAttribute("lastName") : "" %>" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-phone-alt"></i>
                    <label for="phone">Phone Number:</label>
                    <input type="text" id="phone" name="phone" value="<%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %>" required maxlength="12" pattern="\d{3}-\d{7}" placeholder="000-0000000" oninput="formatPhoneNumber()" />
                </div>

                <div class="form-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <label for="pickup">Pickup Location:</label>
                    <input type="text" id="pickup_location" name="pickup_location" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <label for="drop">Drop Location:</label>
                    <input type="text" id="drop_location" name="drop_location" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-clock"></i>
                    <label for="pickupTime">Pickup Time:</label>
                    <input type="time" id="pickup_time" name="pickup_time" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-route"></i>
                    <label for="route">Select Route:</label>
                    <select id="route" name="route" required onchange="setRideTime()">
                        <option value="" disabled selected>Select a route</option>
                        <option value="A" data-time="25">Route A (10 km) - 25 min</option>
                        <option value="B" data-time="35">Route B (15 km) - 35 min</option>
                        <option value="C" data-time="45">Route C (20 km) - 45 min</option>
                        <option value="D" data-time="60">Route D (30 km) - 60 min</option>
                    </select>
                </div>

                <div class="form-group">
				    <i class="fas fa-car"></i>
				    <label for="car_name">Select Car:</label>
				    <select id="car_name" name="car_name" required onchange="calculateFare()">
				        <option value="" disabled selected>Select a car</option>
				        <%
				            String dbURL = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
				            String dbUsername = "root";
				            String dbPassword = "1234";
				            Connection conn = null;
				            PreparedStatement pstmt = null;
				            ResultSet rs = null;
				
				            try {
				                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
				                String sql = "SELECT car_name, price_per_minute FROM car";
				                pstmt = conn.prepareStatement(sql);
				                rs = pstmt.executeQuery();
				
				                while (rs.next()) {
				                    String carName = rs.getString("car_name");
				                    double pricePerMinute = rs.getDouble("price_per_minute");
				        %>
				                    <option value="<%= carName %>" data-price="<%= pricePerMinute %>"><%= carName %> - LKR <%= pricePerMinute %> per minute</option>
				        <%
				                }
				            } catch (SQLException e) {
				                e.printStackTrace();
				            } finally {
				                try {
				                    if (rs != null) rs.close();
				                    if (pstmt != null) pstmt.close();
				                    if (conn != null) conn.close();
				                } catch (SQLException e) {
				                    e.printStackTrace();
				                }
				            }
				        %>
				    </select>
				</div>


                <div class="form-group">
				    <i class="fas fa-clock"></i>
				    <label for="time">Estimated Ride Time (Minutes):</label>
				    <input type="number" id="estimated_time" name="estimated_time" required min="1" readonly>
				</div>

                <div class="form-group">
                    <i class="fas fa-money-bill-wave"></i>
                    <label for="fare">Estimated Fare (LKR):</label>
                    <input type="text" id="fare" name="fare" readonly>
                </div>
            </div>

            <!-- Payment Information -->
            <h2>Enter Payment Details</h2>
            <div class="payment-fields">
                <div class="form-group">
                    <i class="fas fa-credit-card"></i>
                    <label for="card_number">Card Number:</label>
                    <input type="text" id="card_number" name="card_number" maxlength="19" oninput="formatCardNumber(event)" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-credit-card"></i>
                    <label for="expiry_date">Expiry Date:</label>
                    <input type="text" id="expiry_date" name="expiry_date" maxlength="5" oninput="formatExpiryDate(event)" required>
                </div>
                <div class="form-group">
				    <i class="fas fa-user"></i>
				    <label for="cardholder_name">Cardholder Name:</label>
				    <input type="text" id="cardholder_name" name="cardholder_name" required>
				</div>
				
				<div class="form-group">
				    <i class="fas fa-lock"></i>
				    <label for="cvv">CVV:</label>
				    <input type="text" id="cvv" name="cvv" maxlength="3" required>
				</div>
            </div>
            

            <button type="submit" class="next-btn">Confirm Booking</button>
            <button class="cancel-btn" onclick="location.href='customer-dashboard.jsp';">Cancel Ride</button>
        </form>
    </div>

    <script>
        function formatPhoneNumber() {
            let phoneInput = document.getElementById('phone');
            let formattedPhone = phoneInput.value.replace(/[^0-9]/g, '').replace(/(\d{3})(\d{7})/, '$1-$2');
            phoneInput.value = formattedPhone;
        }

        function setRideTime() {
            let routeSelect = document.getElementById('route');
            let selectedOption = routeSelect.options[routeSelect.selectedIndex];
            let estimatedTime = selectedOption.getAttribute('data-time');
            document.getElementById('estimated_time').value = estimatedTime;
            calculateFare();
        }

        function calculateFare() {
            let vehicleSelect = document.getElementById('car_name');
            let selectedOption = vehicleSelect.options[vehicleSelect.selectedIndex];
            let pricePerMinute = selectedOption.getAttribute('data-price');
            let rideTime = document.getElementById('estimated_time').value;
            let fare = pricePerMinute * rideTime;
            document.getElementById('fare').value = fare.toFixed(2);
        }

        function validateForm() {
            return true;
        }

        function formatCardNumber(event) {
            let input = event.target;
            input.value = input.value.replace(/\D/g, '').replace(/(.{4})(?=.)/g, '$1 ');
        }

        function formatExpiryDate(event) {
            let input = event.target;
            input.value = input.value.replace(/[^0-9]/g, '').replace(/(.{2})(?=.)/g, '$1/');
        }
    </script>
</body>
</html>
