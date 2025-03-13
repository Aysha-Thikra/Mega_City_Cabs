<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Rides - Mega City Cabs</title>
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

        .no-booking-msg {
            font-size: 18px;
            color: #ff0000;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <header class="menu-bar">
        <div class="logo">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="driver-dashboard.jsp">Dashboard</a>
            <a href="ride-requests.jsp?userId=<%= session.getAttribute("userId") %>">Ride Requests</a>
            <a href="my-rides.jsp?userId=<%= session.getAttribute("userId") %>">My Rides</a>
            <a href="driver-profile.jsp">Profile</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='driver-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <div class="dashboard-container">
        <div class="dashboard-header">My Rides</div>

        <table>
            <tr>
                <th>Driver Name</th>
                <th>Customer Name</th>
                <th>Car Name</th>
                <th>Pickup Location</th>
                <th>Drop Location</th>
                <th>Pickup Time</th>
                <th>Fare</th>
            </tr>

            <%  
                String userId = (String) session.getAttribute("userId");
                
                String firstName = "";
                String lastName = "";
                
                String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
                String dbUser = "root";
                String dbPassword = "1234";
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    String query = "SELECT firstName, lastName FROM users WHERE userId = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, userId);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        firstName = rs.getString("firstName");
                        lastName = rs.getString("lastName");
                    } else {
                        out.println("<tr><td colspan='7' class='no-booking-msg'>User not found.</td></tr>");
                    }

                    String driverName = firstName + " " + lastName;
                    
                    query = "SELECT b.driver_name, b.car_name, b.pickup_location, b.drop_location, b.pickup_time, b.fare, u.firstName AS customerFirstName, u.lastName AS customerLastName "
                            + "FROM booking b "
                            + "JOIN users u ON b.userId = u.userId "
                            + "WHERE b.driver_name = ? AND b.status = 'Ride Confirmed' "
                            + "ORDER BY b.pickup_time DESC";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, driverName);
                    rs = pstmt.executeQuery();

                    if (!rs.next()) {
                        out.println("<tr><td colspan='7' class='no-booking-msg'>No confirmed rides available.</td></tr>");
                    } else {
                        do {
                            String driverNameFromDB = rs.getString("driver_name");
                            String carName = rs.getString("car_name");
                            String pickupLocation = rs.getString("pickup_location");
                            String dropLocation = rs.getString("drop_location");
                            String pickupTime = rs.getString("pickup_time");
                            double fare = rs.getDouble("fare");
                            String customerFirstName = rs.getString("customerFirstName");
                            String customerLastName = rs.getString("customerLastName");

                            String customerName = customerFirstName + " " + customerLastName;
                    %>
                            <tr>
                                <td><%= driverNameFromDB %></td>
                                <td><%= customerName %></td>
                                <td><%= carName %></td>
                                <td><%= pickupLocation %></td>
                                <td><%= dropLocation %></td>
                                <td><%= pickupTime %></td>
                                <td>Rs. <%= fare %></td>
                            </tr>
                    <%
                        } while (rs.next());
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
