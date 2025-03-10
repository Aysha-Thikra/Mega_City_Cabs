<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Booking History - Mega City Cabs</title>
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
        .download-btn {
		    display: inline-block;
		    padding: 8px 12px;
		    background-color: #800000;
		    color: white;
		    text-decoration: none;
		    border-radius: 5px;
		    font-weight: bold;
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
            <a href="customer-dashboard.jsp">Dashboard</a>
            <a href="booking.jsp?userId=<%= session.getAttribute("userId") %>">Book a Ride</a>
            <a href="booking-history.jsp?userId=<%= session.getAttribute("userId") %>">Booking History</a>
            <a href="feedback.jsp?userId=<%= session.getAttribute("userId") %>">Give Feedbacks</a>
            <a href="profile.jsp">Profile</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='customer-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <div class="dashboard-container">
        <div class="dashboard-header">Your Booking History</div>

        <table>
	        <tr>
	            <th>Customer Name</th>
	            <th>Phone Number</th>
	            <th>Email</th>
	            <th>Card Number</th>
	            <th>Pickup Location</th>
	            <th>Drop Location</th>
	            <th>Pickup Time</th>
	            <th>Route</th>
	            <th>Car Name</th>
	            <th>Fare</th>
	            <th>Driver Name</th>
	            <th>Actions</th>
	        </tr>
	
	        <%
			    String userId = (String) session.getAttribute("userId");
			
			    if (userId == null) {
			        out.println("<tr><td colspan='12' class='no-booking-msg'>You are not logged in.</td></tr>");
			    } else {
			        String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
			        String dbUser = "root";
			        String dbPassword = "1234";
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			
			        try {
			            Class.forName("com.mysql.cj.jdbc.Driver");
			            conn = DriverManager.getConnection(url, dbUser, dbPassword);
			
			            String query = "SELECT booking_id, first_name, last_name, phone, email, card_number, pickup_location, drop_location, pickup_time, route, car_name, fare, driver_name "
			                         + "FROM booking WHERE userID = ? ORDER BY pickup_time DESC";
			
			            pstmt = conn.prepareStatement(query);
			            pstmt.setString(1, userId);
			            rs = pstmt.executeQuery();
			
			            if (!rs.next()) {
			                out.println("<tr><td colspan='12' class='no-booking-msg'>No bookings yet.</td></tr>");
			            } else {
			                do {
			%>
			                    <tr>
			                        <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
			                        <td><%= rs.getString("phone") %></td>
			                        <td><%= rs.getString("email") %></td>
			                        <td><%= rs.getString("card_number") %></td>
			                        <td><%= rs.getString("pickup_location") %></td>
			                        <td><%= rs.getString("drop_location") %></td>
			                        <td><%= rs.getString("pickup_time") %></td>
			                        <td><%= rs.getString("route") %></td>
			                        <td><%= rs.getString("car_name") %></td>
			                        <td>Rs. <%= rs.getString("fare") %></td>
			                        <td><%= rs.getString("driver_name") %></td>
			                        <td>
									    <a href="GenerateBill?bookingId=<%= rs.getString("booking_id") %>" class="download-btn">Download E-Bill</a>
									</td>

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
			    }
			%>

	    </table>

    </div>
</body>
</html>
