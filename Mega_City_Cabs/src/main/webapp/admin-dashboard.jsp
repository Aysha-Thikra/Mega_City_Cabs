<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    int customerCount = 0;
    int bookingCount = 0;
    int driverCount = 0;
    int carCount = 0;
    int adminCount = 0; 
    int feedbackCount = 0;
    int inquiryCount = 0;
    double totalIncome = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCabs_db", "root", "1234");
        
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE userlevel = 1");
        if (rs.next()) adminCount = rs.getInt(1);

        rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE userlevel = 2");
        if (rs.next()) customerCount = rs.getInt(1);
        
        rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE userlevel = 3");
        if (rs.next()) driverCount = rs.getInt(1);
        
        rs = stmt.executeQuery("SELECT COUNT(*) FROM car");
        if (rs.next()) carCount = rs.getInt(1);
        
        rs = stmt.executeQuery("SELECT COUNT(*) FROM booking");
        if (rs.next()) bookingCount = rs.getInt(1);

        rs = stmt.executeQuery("SELECT COUNT(*) FROM feedback");
        if (rs.next()) feedbackCount = rs.getInt(1);

        rs = stmt.executeQuery("SELECT COUNT(*) FROM contact");
        if (rs.next()) inquiryCount = rs.getInt(1);

        rs = stmt.executeQuery("SELECT SUM(fare) FROM booking");
        if (rs.next()) totalIncome = rs.getDouble(1);
        
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --light-bg: #fff7e6;
            --dark-bg: #4f200d;
        }

        body {
            background-color: #ff8400;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .count-cards {
            display: flex;
            justify-content: space-between;
            margin-top: 50px;
            padding: 0 20px;
            flex-wrap: wrap;
        }

        .card {
            background: linear-gradient(135deg, rgba(79, 32, 13, 0.85), rgba(153, 102, 51, 0.85));
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 220px;
            color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
        }

        .card .icon {
            font-size: 40px;
            margin-bottom: 15px;
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

        .dashboard-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 0 20px;
            margin-top: 50px;
        }

        .dashboard-card {
            background: var(--light-bg);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 100%;
            max-width: 600px;
            color: var(--dark-bg);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 10px;
        }


        .dashboard-card:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.4);
        }

        .dashboard-header {
            font-size: 24px;
            font-weight: bold;
            color: var(--orange);
            margin-bottom: 10px;
        }

        .edit-profile-btn {
            background-color: var(--yellow);
            border: none;
            padding: 12px 24px;
            color: var(--brown);
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            margin-top: 10px;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .edit-profile-btn:hover {
            background-color: var(--orange);
            color: white;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .count-cards {
                flex-direction: column;
                align-items: center;
            }

            .dashboard-section {
                flex-direction: column;
                align-items: center;
            }

            .dashboard-card {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="admin-dashboard.jsp">Dashboard</a>
            <a href="manage-customers.jsp">Manage Customers</a>
            <a href="manage-bookings.jsp">Manage Bookings</a>
            <a href="manage-cars.jsp">Manage Cars</a>
            <a href="manage-drivers.jsp">Manage Drivers</a>
            <a href="manage-feedbacks.jsp">Manage Feedbacks</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='admin-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>
    
    <div class="dashboard-section" style="margin-top: 145px;">
        <div class="dashboard-card">
            <div class="dashboard-header" style="margin-bottom: -5px;">Welcome, <%= session.getAttribute("admin_username") %>!</div>
            <p>Manage customers, bookings, cars, drivers, and customer feedbacks efficiently with Mega City Cabs' administration system. Use the navigation menu to access different management functionalities.</p>
        </div>
    </div>

    <div class="count-cards">
	    <div class="card"><i class="fas fa-users icon"></i><h3>Registered Customers</h3><p><%= customerCount %></p></div>
	    <div class="card"><i class="fas fa-calendar-check icon"></i><h3>Total Bookings</h3><p><%= bookingCount %></p></div>
	    <div class="card"><i class="fas fa-user-tie icon"></i><h3>Registered Drivers</h3><p><%= driverCount %></p></div>
	    <div class="card"><i class="fas fa-car icon"></i><h3>Available Cars</h3><p><%= carCount %></p></div>
	    <div class="card"><i class="fas fa-user-shield icon"></i><h3>Registered Admins</h3><p><%= adminCount %></p></div>
	    <div class="card"><i class="fas fa-comments icon"></i><h3>Total Feedbacks</h3><p><%= feedbackCount %></p></div>
	    <div class="card"><i class="fas fa-envelope icon"></i><h3>Total Inquiries</h3><p><%= inquiryCount %></p></div>
	    <div class="card"><i class="fas fa-dollar-sign icon"></i><h3>Total Income</h3><p>Rs. <%= totalIncome %></p></div>
	</div>



    <div class="dashboard-section">
        <div class="dashboard-card" style="margin-bottom: 50px;">
        	<div class="dashboard-header">Manage Admin Details</div>
	        <p>View and update admin account information.</p>
	        <button class="edit-profile-btn" onclick="location.href='manage-admins.jsp'">Manage Admins</button>
	    </div>
        <div class="dashboard-card" style="margin-bottom: 50px;">
	        <div class="dashboard-header">Manage Inquiries</div>
	        <p>View and manage customer inquiries.</p>
	        <button class="edit-profile-btn" onclick="location.href='manage-inquiries.jsp'">Manage Inquiries</button>
	    </div>
	    <div class="dashboard-card" style="margin-bottom: 50px;">
            <div class="dashboard-header">Edit Profile</div>
            <p>Update your profile information below.</p>
            <button class="edit-profile-btn" onclick="location.href='admin-profile.jsp'">Edit Profile</button>
        </div>
    </div>
</body>
</html>
