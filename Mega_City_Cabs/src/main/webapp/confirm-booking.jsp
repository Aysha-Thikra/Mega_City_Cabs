<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Booking - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --black-transparent: rgba(0, 0, 0, 0.5);
        }

        .confirmation-container {
            max-width: 600px;
            margin: 80px auto 0;
            padding: 25px;
            background: #fff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
            margin-top: 120px;
        }

        .confirmation-container h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: var(--brown);
            font-weight: 600;
        }

        .details {
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

        .details p {
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
            color: #444;
            display: flex;
            align-items: center;
        }

        .details p:last-child {
            border-bottom: none;
        }

        .details i {
            margin-right: 10px;
            color: var(--orange);
        }

        .details strong {
            margin-right: 10px;
            font-weight: 600;
        }

        .back-btn, .confirm-btn, .cancel-btn {
            background: linear-gradient(135deg, var(--yellow), var(--orange));
            color: white;
            padding: 14px 18px;
            border: none;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .back-btn {
            background: linear-gradient(135deg, #ffc107, #e0a800);
        }
        
        .cancel-btn {
            background: linear-gradient(135deg, #ff4c4c, #e02424);
        }

        .back-btn:hover {
            background: linear-gradient(135deg, #e0a800, #c69500);
            transform: translateY(-2px);
        }

        .confirm-btn:hover {
            background: linear-gradient(135deg, #e0a800, #c69500);
            transform: translateY(-2px);
        }
        
        .cancel-btn:hover {
            background: linear-gradient(135deg, #e02424, #c21f1f);
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            .confirmation-container {
                width: 90%;
                margin: 40px auto;
            }
        }
    </style>
</head>

<body style="background-color: #ff8400;">

    <!-- Menu Bar -->
    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="home.jsp">Home</a>
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

    <!-- Confirmation Details -->
    <div class="confirmation-container">
        <h2>Confirm Your Booking</h2>
        <div class="details">
            <div class="detail-item">
                <p><i class="fas fa-user"></i><strong>First Name:</strong> <%= request.getParameter("firstName") %></p>
                <p><i class="fas fa-user"></i><strong>Last Name:</strong> <%= request.getParameter("lastName") %></p>
                <p><i class="fas fa-envelope"></i><strong>Email:</strong> <%= request.getParameter("email") %></p>
                <p><i class="fas fa-phone-alt"></i><strong>Phone:</strong> <%= request.getParameter("phone") %></p>
                <p><i class="fas fa-map-marker-alt"></i><strong>Pickup Location:</strong> <%= request.getParameter("pickup") %></p>
            </div>
            <div class="detail-item">
                <p><i class="fas fa-map-marker-alt"></i><strong>Drop Location:</strong> <%= request.getParameter("drop") %></p>
                <p><i class="fas fa-route"></i><strong>Route:</strong> <%= request.getParameter("route") %></p>
                <p><i class="fas fa-car"></i><strong>Vehicle:</strong> <%= request.getParameter("vehicle") %></p>
                <p><i class="fas fa-clock"></i><strong>Estimated Ride Time (Minutes):</strong> <%= request.getParameter("time") %></p>
                <p><i class="fas fa-money-bill-wave"></i><strong>Estimated Fare (LKR):</strong> <%= request.getParameter("fare") %></p>
            </div>
        </div>
        
        <button class="confirm-btn" onclick="location.href='payment.jsp?fare=<%= request.getParameter("fare") %>'">Proceed to Payment</button>
        <button class="back-btn" onclick="window.history.back()">Go Back</button>
        <button class="cancel-btn" onclick="location.href='home.jsp';">Cancel Ride</button>

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

</body>
</html>
