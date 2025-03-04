<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Car - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --border-radius: 10px;
            --btn-padding: 12px 24px;
            --font-weight: 600;
            --transition: 0.3s ease;
        }

        body {
            background-color: #ff8400;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            max-width: 1000px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 150px;
        }

        .dashboard-header {
            font-size: 32px;
            font-weight: var(--font-weight);
            margin-bottom: 30px;
            color: var(--brown);
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        .form-container a {
            display: inline-block;
            padding: var(--btn-padding);
            background-color: var(--orange);
            color: white;
            font-weight: var(--font-weight);
            text-decoration: none;
            border-radius: var(--border-radius);
            text-align: center;
            width: 100%;
            transition: background-color var(--transition), transform var(--transition);
        }

        .form-container a:hover {
            background-color: #e87e00;
            transform: translateY(-2px);
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

    <div class="dashboard-container">
        <div class="dashboard-header">
            <%
                String carID = request.getParameter("carID");
                String licensePlate = request.getParameter("license_plate");
                String carName = request.getParameter("car_name");
                String description = request.getParameter("description");
                String passengers = request.getParameter("passengers");
                String type = request.getParameter("type");
                String luggages = request.getParameter("luggages");
                String pricePerMinute = request.getParameter("price_per_minute");

                System.out.println("Received carID: " + carID);
                System.out.println("Received license_plate: " + licensePlate);
                System.out.println("Received price_per_minute: " + pricePerMinute);

                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Connection conn = null;
                PreparedStatement pstmt = null;
                String message = "";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    String sql = "UPDATE car SET license_plate = ?, car_name = ?, description = ?, passengers = ?, type = ?, luggages = ?, price_per_minute = ? WHERE carID = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, licensePlate);
                    pstmt.setString(2, carName);
                    pstmt.setString(3, description);
                    pstmt.setString(4, passengers);
                    pstmt.setString(5, type);
                    pstmt.setString(6, luggages);
                    
                    if (pricePerMinute == null || pricePerMinute.trim().isEmpty()) {
                        pstmt.setBigDecimal(7, new BigDecimal("0.00"));
                    } else {
                        pstmt.setBigDecimal(7, new BigDecimal(pricePerMinute));
                    }
                    
                    pstmt.setString(8, carID);

                    int result = pstmt.executeUpdate();
                    if (result > 0) {
                        message = "Car details updated successfully!";
                    } else {
                        message = "Failed to update car details.";
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    message = "An error occurred while updating car details.";
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            %>
            <span style="color: green;"><%= message %></span>
        </div>

        <div class="form-container">
            <a href="manage-cars.jsp" class="cancel-btn">Back to Manage Cars</a>
        </div>
    </div>
</body>
</html>
