<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings - Mega City Cabs</title>
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
        	border-radius: 10px; text-align: center; 
        }
        	
        .dashboard-header { 
        	font-size: 28px; 
        	font-weight: bold; 
        	margin-bottom: 20px; 
        	color: #4f200d; 
        }
        
        table { 
        	width: 100%; 
        	border-collapse: collapse; 
        	margin-top: 20px; 
        	background: white; 
        }
        
        th, td { 
        	border: 1px solid #ddd; 
        	padding: 10px; 
        	text-align: left; 
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
            padding: 8px 16px;
            background-color: #800000;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
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
        <div class="dashboard-header">Manage Bookings</div>

        <table>
            <tr>
                <th>Booking ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Card Number</th>
                <th>Phone</th>
                <th>Pickup Location</th>
                <th>Drop Location</th>
                <th>Pickup Time</th>
                <th>Car Name</th>
                <th>Fare</th>
                <th>Driver Name</th>
                <th>Download E-Bill</th>
            </tr>
            
            <%  
                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    
                    String query = "SELECT booking_id, first_name, last_name, email, card_number, phone, pickup_location, drop_location, pickup_time, car_name, fare, driver_name FROM booking";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String bookingID = rs.getString("booking_id");
                        String customerName = rs.getString("first_name") + " " + rs.getString("last_name");
                        String email = rs.getString("email");
                        String cardNumber = rs.getString("card_number");
                        String phone = rs.getString("phone");
                        String pickupLocation = rs.getString("pickup_location");
                        String dropLocation = rs.getString("drop_location");
                        String pickupTime = rs.getString("pickup_time");
                        String carName = rs.getString("car_name");
                        String fare = rs.getString("fare");
                        String driverName = rs.getString("driver_name");
            %>
                        <tr>
                            <td><%= bookingID %></td>
                            <td><%= customerName %></td>
                            <td><%= email %></td>
                            <td><%= cardNumber %></td>
                            <td><%= phone %></td>
                            <td><%= pickupLocation %></td>
                            <td><%= dropLocation %></td>
                            <td><%= pickupTime %></td>
                            <td><%= carName %></td>
                            <td>Rs. <%= fare %></td>
                            <td><%= driverName %></td>
                            <td style="text-align: center;"><a href="GenerateBill?bookingId=<%= bookingID %>" class="download-btn">Download E-Bill</a></td>
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

    </div>
</body>
</html>
