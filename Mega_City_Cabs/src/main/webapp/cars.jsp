<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cars - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ff8400;
            margin: 0;
            padding: 0;
        }

        .best-cars {
            padding: 100px 20px 60px 20px;
            text-align: center;
        }

        .best-cars h2 {
            font-size: 36px;
            margin-bottom: 40px;
            font-weight: 700;
            color: #333;
        }

        .car-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            max-width: 100%;
        }

        .car-card {
            width: 320px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .car-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .car-card .car-image {
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .car-card .car-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .car-card .car-info {
            padding: 20px;
            text-align: center;
        }

        .car-info h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .car-info p {
            color: #666;
            font-size: 16px;
            margin-bottom: 15px;
            line-height: 1.6;
            text-align: left;
        }

        .details {
            display: grid;
            justify-content: space-around;
            font-size: 14px;
            color: #444;
        }

        .details i {
            margin-right: 5px;
            color: #007BFF;
        }
    </style>
</head>

<body>
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

<div class="best-cars" style="background-color: #ff8400;">
    <h2>Our Best Cars</h2>
    <div class="car-cards">

        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCabs_db", "root", "1234");

                String sql = "SELECT * FROM car";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    String carID = rs.getString("carID");
                    String carName = rs.getString("car_name");
                    String description = rs.getString("description");
                    String passengers = rs.getString("passengers");
                    String luggages = rs.getString("luggages");
                    String type = rs.getString("type");
        %>
        
        <div class="car-card">
            <div class="car-image">
                <img src="images/cars.png" alt="<%= carName %>">
            </div>
            <div class="car-info">
                <h3><%= carName %></h3>
                <p><%= description %></p>
                <div class="details">
                    <p><i class="fas fa-users"></i> <%= passengers %> Passengers</p>
                    <p><i class="fa-solid fa-briefcase"></i> <%= luggages %> Bags</p>
                    <p><i class="fas fa-snowflake"></i><%= type %></p>
                </div>
            </div>
        </div>

        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>

    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-left">
            <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
        </div>
        <div class="footer-right">
            <a href="home.jsp" class="footer-link"> <i class="fas fa-home"></i> Home </a>
            <a href="about-us.jsp" class="footer-link"> <i class="fas fa-info-circle"></i> About Us </a>
            <a href="contact-us.jsp" class="footer-link"> <i class="fas fa-phone-alt"></i> Contact Us </a>
            <a href="help.jsp" class="footer-link"> <i class="fas fa-question-circle"></i> Help </a>
            <a href="services.jsp" class="footer-link"> <i class="fas fa-wrench"></i> Services </a>
        </div>
    </div>
</footer>
</body>
</html>
