<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    int customerCount = 0;
    int bookingCount = 0;
    int driverCount = 0;
    int carCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCabs_db", "root", "1234");
        
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE userlevel = 2");
        if (rs.next()) customerCount = rs.getInt(1);
        
        rs = stmt.executeQuery("SELECT COUNT(*) FROM users WHERE userlevel = 3");
        if (rs.next()) driverCount = rs.getInt(1);
        
        rs = stmt.executeQuery("SELECT COUNT(*) FROM car");
        if (rs.next()) carCount = rs.getInt(1);
        
        rs = stmt.executeQuery("SELECT COUNT(*) FROM booking");
        if (rs.next()) bookingCount = rs.getInt(1);
        
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

        .edit-profile-btn {
            background-color: var(--yellow);
            border: none;
            padding: 10px 20px;
            color: var(--brown);
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 20px;
        }

        .edit-profile-btn:hover {
            background-color: var(--orange);
            color: white;
        }

        .count-cards {
		    display: flex;
		    justify-content: center;
		    gap: 25px;
		    margin-top: 120px;
		    margin-bottom: -100px;
		}
		
		.card {
		    background: linear-gradient(135deg, rgba(79, 32, 13, 0.85), rgba(153, 102, 51, 0.85));
		    padding: 25px;
		    border-radius: 15px;
		    box-shadow: inset 5px 5px 10px rgba(0, 0, 0, 0.2), 
		                inset -5px -5px 10px rgba(255, 255, 255, 0.1),
		                0 8px 16px rgba(0, 0, 0, 0.2);
		    text-align: center;
		    width: 220px;
		    backdrop-filter: blur(12px);
		    transition: transform 0.3s ease, box-shadow 0.3s ease;
		    position: relative;
		    overflow: hidden;
		    border: 1px solid rgba(255, 255, 255, 0.2);
		}
		
		.card::before {
		    content: "";
		    position: absolute;
		    top: -50%;
		    left: -50%;
		    width: 200%;
		    height: 200%;
		    background: radial-gradient(circle, rgba(255, 255, 255, 0.2), transparent);
		    transform: rotate(25deg);
		    transition: opacity 0.3s ease;
		    opacity: 0;
		}
		
		.card:hover::before {
		    opacity: 1;
		}
		
		.card:hover {
		    transform: translateY(-8px);
		    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
		}
		
		.card i {
		    font-size: 50px;
		    color: #FFD700; /* Gold color for contrast */
		    margin-bottom: 10px;
		}
		
		.card h3 {
		    margin: 10px 0;
		    color: #fff;
		    font-size: 22px;
		    font-weight: bold;
		}
		
		.card p {
		    margin: 5px 0;
		    font-size: 22px;
		    font-weight: bold;
		    color: #fff;
		}
    </style>
</head>
<body style="background-color: #ff8400;">
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
    
    
    <div class="count-cards">
        <div class="card">
            <i class="fas fa-users"></i>
            <h3>Registered Customers</h3>
            <p><%= customerCount %></p>
        </div>
        <div class="card">
            <i class="fas fa-calendar-check"></i>
            <h3>Total Bookings</h3>
            <p><%= bookingCount %></p>
        </div>
        <div class="card">
            <i class="fas fa-user-tie"></i>
            <h3>Registered Drivers</h3>
            <p><%= driverCount %></p>
        </div>
        <div class="card">
            <i class="fas fa-car"></i>
            <h3>Available Cars</h3>
            <p><%= carCount %></p>
        </div>
    </div>

    <div class="dashboard-container">
        <div class="dashboard-header">Welcome, <%= session.getAttribute("admin_username") %>!</div>
        <div class="dashboard-content">
            <p>Manage customers, bookings, cars, drivers, and customer feedbacks efficiently with Mega City Cabs' administration system.</p>
            <p>Use the navigation menu to access different management functionalities.</p>
            <br>
            <p>If you'd like to update your profile information, you can do so below.</p>
            <button class="edit-profile-btn" onclick="location.href='admin-profile.jsp'">Edit Profile</button>
        </div>
    </div>

</body>
</html>