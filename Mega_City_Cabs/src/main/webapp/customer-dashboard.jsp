<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" import="java.sql.*" %>
<%
    String dbUrl = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    String dbUser = "root";
    String dbPassword = "1234";

    String userId = null;
    String username = (String) session.getAttribute("username");

    if (username != null) {
        try {
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            String sql = "SELECT userId FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                userId = rs.getString("userId");
                session.setAttribute("userId", userId);
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        userId = "Unknown";
    }
%>

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
            <a href="booking.jsp?userId=<%= userId %>">Book a Ride</a>
            <a href="feedback.jsp?userId=<%= userId %>">Give Feedbacks</a>
            <a href="profile.jsp">Profile</a>
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
