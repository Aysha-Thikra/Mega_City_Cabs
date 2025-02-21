<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>  <!-- Ensure the session is enabled -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
        }

        .dashboard-container {
            max-width: 1000px;
            margin: 100px auto;
            padding: 30px;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 120px;
            text-align: center;
        }

        .dashboard-header {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: var(--brown);
        }

        .dashboard-content {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
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
            <a href="book-ride.jsp">Book a Ride</a>
            <a href="my-bookings.jsp">My Bookings</a>
            <a href="profile.jsp">Profile</a>
            <a href="settings.jsp">Settings</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='customer-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <div class="dashboard-container">
        <div class="dashboard-header">Welcome, <%= session.getAttribute("username") %>!</div>
        <div class="dashboard-content">
            <p>Thank you for choosing Mega City Cabs! You can book rides, manage your bookings, update your profile, and adjust settings using the menu above.</p>
        </div>
    </div>
</body>
</html>
