<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="Bean.Booking" %>
<%@ page import="Dao.BookingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<%
    HttpSession userSession = request.getSession();
    String userID = (String) userSession.getAttribute("userId");

    if (userID == null || userID.isEmpty()) {
        response.sendRedirect("customer-login.jsp");
        return;
    }

    List<Booking> bookingList = new ArrayList<>();
    BookingDAO bookingDAO = new BookingDAO();

    try {
        // Fetch bookings for the logged-in user
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCabs_db", "root", "1234");
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM booking WHERE userID = ? ORDER BY pickup_time DESC");
        stmt.setString(1, userID);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Booking booking = new Booking();
            booking.setBooking_id(rs.getString("booking_id"));
            booking.setPickup_location(rs.getString("pickup_location"));
            booking.setDrop_location(rs.getString("drop_location"));
            booking.setPickup_time(rs.getString("pickup_time"));
            booking.setCar_name(rs.getString("car_name"));
            booking.setFare(rs.getDouble("fare"));
            booking.setStatus(rs.getString("status")); // ✅ Fetch Booking Status
            bookingList.add(booking);
        }

        rs.close();
        stmt.close();
        conn.close();

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Activity - Mega City Cabs</title>
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

        td {
            text-align: center;
        }

        .no-booking-msg {
            font-size: 18px;
            color: #ff0000;
            font-weight: bold;
            text-align: center;
        }

        .status-pending {
            font-weight: bold;
            color: orange;
        }

        .status-completed {
            font-weight: bold;
            color: green;
        }

        .cancel-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 15px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
        }

        .cancel-btn:hover {
            background-color: darkred;
        }

        .success-msg {
            color: green;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .error-msg {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
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
        <a href="customer-dashboard.jsp">Dashboard</a>
        <a href="booking.jsp?userId=<%= userId %>">Book a Ride</a>
        <a href="booking-history.jsp?userId=<%= userId %>">Booking History</a>
        <a href="booking-activity.jsp?userId=<%= userId %>">Booking Activity</a>
        <a href="feedback.jsp?userId=<%= userId %>">Give Feedbacks</a>
        <a href="profile.jsp">Profile</a>
    </nav>
    <div class="buttons">
        <button onclick="location.href='customer-logout.jsp';" class="logout-btn">Logout</button>
    </div>
</header>

<%-- Success/Error messages --%>
<% String cancelSuccess = (String) session.getAttribute("cancelSuccess");
   String cancelError = (String) session.getAttribute("cancelError");
   if (cancelSuccess != null) { %>
       <div class="success-msg"><%= cancelSuccess %></div>
<%     session.removeAttribute("cancelSuccess"); %>
<% } else if (cancelError != null) { %>
       <div class="error-msg"><%= cancelError %></div>
<%     session.removeAttribute("cancelError"); %>
<% } %>

<div class="dashboard-container">
    <div class="dashboard-header">Your Booking Activity</div>

    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Pickup Location</th>
                <th>Drop Location</th>
                <th>Pickup Time</th>
                <th>Car Name</th>
                <th>Fare (LKR)</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if (bookingList.isEmpty()) { %>
                <tr><td colspan="8" class="no-booking-msg">No bookings found.</td></tr>
            <% } else { %>
                <% for (Booking booking : bookingList) { %>
                    <tr>
                        <td><%= booking.getBooking_id() %></td>
                        <td><%= booking.getPickup_location() %></td>
                        <td><%= booking.getDrop_location() %></td>
                        <td><%= booking.getPickup_time() %></td>
                        <td><%= booking.getCar_name() %></td>
                        <td>Rs. <%= booking.getFare() %></td>
                        <td class="<%= booking.getStatus().equalsIgnoreCase("Pending") ? "status-pending" : "status-completed" %>">
                            <%= booking.getStatus() %>
                        </td>
                        <td>
                            <% if ("Pending".equalsIgnoreCase(booking.getStatus())) { %>
                                <a href="cancel-booking.jsp?booking_id=<%= booking.getBooking_id() %>">
                                    <button class="cancel-btn">Cancel Ride</button>
                                </a>
                            <% } else { %>
                                <button class="cancel-btn" disabled style="background-color: #4f200d;"><%= booking.getStatus() %></button>
                            <% } %>
                        </td>
                    </tr>
                <% } %>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
