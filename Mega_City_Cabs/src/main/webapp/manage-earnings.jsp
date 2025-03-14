<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Earnings - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        body { 
            background-color: #ff8400; 
            font-family: Arial, sans-serif; 
        }

        .dashboard-container { 
            max-width: 1200px; 
            margin: 100px auto; 
            padding: 20px; 
            background: #fff; 
            margin-top: 120px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
            border-radius: 10px; 
            text-align: center; 
            overflow-x: fixed; 
        }

        .dashboard-header { 
            font-size: 28px; 
            font-weight: bold; 
            margin-bottom: 20px; 
            color: #4f200d; 
        }

        .earnings-section {
            margin-bottom: 40px;
        }

        .earnings-box {
            background: #4f200d;
            padding: 20px;
            border-radius: 10px;
            color: white;
            font-size: 24px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 96%;
            text-align: center;
        }

        .earnings-box h3 {
            margin: 10px 0;
        }

        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
            background: white; 
            table-layout: fixed;
            font-size: 14px;
            word-wrap: break-word;
        }
        
        th, td { 
            border: 1px solid #ddd; 
            padding: 10px; 
            text-align: left; 
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap: break-word;
        }
        
        th { 
            background-color: #ff8400; 
            color: #4f200d; 
            font-weight: bold; 
            text-align: center;
        }
        
        tr:nth-child(even) { 
            background-color: #f9f9f9; 
        }

        .download-btn {
            display: inline-block;
            padding: 8px 5px;
            background-color: #800000;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
        }

        .download-btn:hover {
            background-color: #FF0000;
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
        <div class="dashboard-header">Manage Earnings</div>

        <!-- Earnings Section -->
        <div class="earnings-section">
            <div class="earnings-box">
                <h3>Total Earnings</h3>
                <p>Rs. <span id="total-earnings">0.00</span></p>
            </div>
        </div>

        <table>
            <tr>
                <th>Booking ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Fare</th>
                <th>Driver Name</th>
                <th>Status</th>
                <th>Pickup Location</th>
                <th>Dropoff Location</th>
                <th>Pickup Time</th>
                <th>Route</th>
                <th>Car Name</th>
                <th>Estimated Time</th>
                <th>Price Per Minute</th>
            </tr>
            
            <%  
                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                double totalEarnings = 0;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    String earningsQuery = "SELECT SUM(fare) AS total_earnings FROM booking WHERE status = 'Ride Confirmed'";
                    pstmt = conn.prepareStatement(earningsQuery);
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        totalEarnings = rs.getDouble("total_earnings");
                    }

                    String query = "SELECT booking_id, first_name, last_name, email, fare, driver_name, status, pickup_location, drop_location, pickup_time, route, car_name, estimated_time, price_per_minute FROM booking WHERE status = 'Ride Confirmed'";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String bookingID = rs.getString("booking_id");
                        String customerName = rs.getString("first_name") + " " + rs.getString("last_name");
                        String email = rs.getString("email");
                        double fare = rs.getDouble("fare");
                        String driverName = rs.getString("driver_name");
                        String status = rs.getString("status");
                        String pickupLocation = rs.getString("pickup_location");
                        String dropoffLocation = rs.getString("drop_location");
                        String pickupTime = rs.getString("pickup_time");
                        String route = rs.getString("route");
                        String carName = rs.getString("car_name");
                        String estimatedTime = rs.getString("estimated_time");
                        double pricePerMinute = rs.getDouble("price_per_minute");
            %>
                        <tr>
                            <td><%= bookingID %></td>
                            <td><%= customerName %></td>
                            <td><%= email %></td>
                            <td>Rs. <%= fare %></td>
                            <td><%= driverName %></td>
                            <td><%= status %></td>
                            <td><%= pickupLocation %></td>
                            <td><%= dropoffLocation %></td>
                            <td><%= pickupTime %></td>
                            <td><%= route %></td>
                            <td><%= carName %></td>
                            <td><%= estimatedTime %></td>
                            <td>Rs. <%= pricePerMinute %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            %>
        </table>

        <script>
            document.getElementById("total-earnings").innerText = <%= totalEarnings %>;
        </script>

    </div>
</body>
</html>
