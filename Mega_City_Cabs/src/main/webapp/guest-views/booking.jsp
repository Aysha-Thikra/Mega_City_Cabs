<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking - Mega City Cabs</title>
    <link rel="stylesheet" href="../CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon">
    <style>
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
    </style>
</head>

<body style="background-color: #ff8400;">

    <!-- Menu Bar -->
    <header class="menu-bar">
        <div class="logo">
            <img src="../images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="../home.jsp">Home</a>
            <a href="about-us.jsp">About Us</a>
            <a href="help.jsp">Help</a>
            <a href="services.jsp">Services</a>
            <a href="reviews.jsp">Reviews</a>
            <a href="contact-us.jsp">Contact Us</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='login.jsp';" class="login-btn">Login</button>
            <button onclick="location.href='signup.jsp';" class="signup-btn">Sign Up</button>
        </div>
    </header>

    <!-- Booking Form -->
    <div class="booking-container">
        <h2>Book Your Ride</h2>
        <form action="confirm-booking.jsp" method="post" onsubmit="calculateFare()">
            <div class="form-container">
                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-phone-alt"></i>
                    <label for="phone">Phone Number:</label>
                    <input type="text" id="phone" name="phone" required maxlength="12" pattern="\d{3}-\d{7}" placeholder="000-0000000" oninput="formatPhoneNumber()" />
                </div>

                <div class="form-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <label for="pickup">Pickup Location:</label>
                    <input type="text" id="pickup" name="pickup" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <label for="drop">Drop Location:</label>
                    <input type="text" id="drop" name="drop" required>
                </div>

                <div class="form-group">
                    <i class="fas fa-route"></i>
                    <label for="route">Select Route:</label>
                    <select id="route" name="route" onchange="updateTime()" required>
                        <option value="" disabled selected>Select a route</option>
                        <option value="A">Route A (10 km) - 25 min</option>
                        <option value="B">Route B (15 km) - 35 min</option>
                        <option value="C">Route C (20 km) - 45 min</option>
                        <option value="D">Route D (30 km) - 60 min</option>
                    </select>
                </div>

                <div class="form-group">
                    <i class="fas fa-car"></i>
                    <label for="vehicle">Select Vehicle:</label>
                    <select id="vehicle" name="vehicle" required>
                        <option value="Alto" data-price="40">Suzuki Alto</option>
                        <option value="Nano" data-price="35">Tata Nano</option>
                        <option value="WagonR" data-price="45">Suzuki WagonR</option>
                        <option value="Aqua" data-price="50">Toyota Aqua</option>
                        <option value="Prius" data-price="55">Toyota Prius</option>
                        <option value="Sportage" data-price="60">KIA Sportage</option>
                        <option value="KDH" data-price="80">Toyota KDH Van</option>
                        <option value="HighRoof" data-price="100">Toyota High Roof KDH</option>
                    </select>
                </div>

                <div class="form-group">
                    <i class="fas fa-clock"></i>
                    <label for="time">Estimated Ride Time (Minutes):</label>
                    <input type="text" id="time" name="time" readonly>
                </div>

                <div class="form-group">
                    <i class="fas fa-money-bill-wave"></i>
                    <label for="fare">Estimated Fare (LKR):</label>
                    <input type="text" id="fare" name="fare" readonly>
                </div>
            </div>

            <button type="submit" class="next-btn">Next</button>
            <button class="cancel-btn" onclick="location.href='../home.jsp';">Cancel Ride</button>
        </form>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="about-us.jsp" class="footer-link"> <i class="fas fa-info-circle"></i> About Us </a>
                <a href="reviews.jsp" class="footer-link"> <i class="fas fa-comments"></i> Reviews </a>
                <a href="contact-us.jsp" class="footer-link"> <i class="fas fa-phone-alt"></i> Contact Us </a>
                <a href="help.jsp" class="footer-link"> <i class="fas fa-question-circle"></i> Help </a>
                <a href="services.jsp" class="footer-link"> <i class="fas fa-wrench"></i> Services </a>
            </div>
        </div>
    </footer>

    <script>
    const vehicleRates = {
        "Alto": 50,
        "Nano": 40,
        "WagonR": 60,
        "Aqua": 70,
        "Prius": 80,
        "Sportage": 90,
        "KDH": 100,
        "HighRoof": 120
    };

    const routeTimes = {
        "A": 25,
        "B": 35,
        "C": 45,
        "D": 60
    };

    function updateTime() {
        const route = document.getElementById("route").value;
        const timeField = document.getElementById("time");

        if (route) {
            timeField.value = routeTimes[route] + " min";
            calculateFare();
        } else {
            timeField.value = "";
        }
    }

    function calculateFare() {
        const vehicleSelect = document.getElementById("vehicle");
        const fareField = document.getElementById("fare");
        const routeSelect = document.getElementById("route");

        const selectedVehicle = vehicleSelect.value;
        const selectedRoute = routeSelect.value;

        const ratePerMinute = vehicleRates[selectedVehicle] || 0;

        const estimatedTime = routeTimes[selectedRoute] || 0;

        const fare = ratePerMinute * estimatedTime;

        fareField.value = fare ? fare + " LKR" : "Select Vehicle and Route";
    }

    document.getElementById("vehicle").addEventListener("change", calculateFare);
    document.getElementById("route").addEventListener("change", updateTime);
    
    function formatPhoneNumber() {
        const phoneInput = document.getElementById("phone");
        let phoneValue = phoneInput.value.replace(/\D/g, '');

        if (phoneValue.length > 3 && phoneValue.length <= 6) {
            phoneValue = phoneValue.slice(0, 3) + '-' + phoneValue.slice(3);
        } else if (phoneValue.length > 6) {
            phoneValue = phoneValue.slice(0, 3) + '-' + phoneValue.slice(3, 7) + phoneValue.slice(7, 10);
        }

        phoneInput.value = phoneValue;
    }
</script>

</body>
</html>
