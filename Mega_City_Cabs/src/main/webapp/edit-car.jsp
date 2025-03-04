<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ff8400;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 120px;
        }
        h2 {
            text-align: center;
            color: #4f200d;
        }
        label {
            font-weight: bold;
            margin-left: 30px;
        }
        input, select {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 30px;
            margin-left: 30px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #ff8400;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 10px;
        }
        button:hover {
            background-color: #e87e00;
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

<%
    String carID = request.getParameter("carID");
    String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    String user = "root";
    String password = "1234";

    String licensePlate = "", carName = "", description = "", passengers = "", type = "", luggages = "", pricePerMinute = "";
    try (Connection conn = DriverManager.getConnection(url, user, password);
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM car WHERE carID = ?")) {
        stmt.setString(1, carID);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            licensePlate = rs.getString("license_plate");
            carName = rs.getString("car_name");
            description = rs.getString("description");
            passengers = rs.getString("passengers");
            type = rs.getString("type");
            luggages = rs.getString("luggages");
            pricePerMinute = rs.getString("price_per_minute");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<div class="container">
    <h2>Edit Car Details</h2>
    <form action="update-car.jsp" method="post">
        <input type="hidden" name="carID" value="<%= carID %>">
        
        <label>Car Name:</label>
        <input type="text" name="car_name" value="<%= carName %>" required>
        
        <label>License Plate:</label>
        <input type="text" name="license_plate" value="<%= licensePlate %>" required>
                
        <label>Description:</label>
        <input type="text" name="description" value="<%= description %>">
        
        <label>Passengers:</label>
        <input type="text" name="passengers" value="<%= passengers %>">
        
        <label>Type:</label>
        <select name="type" required>
            <option value="Air Conditioned" <%= "Air Conditioned".equals(type) ? "selected" : "" %>>Air Conditioned</option>
            <option value="Non-Air Conditioned" <%= "Non-Air Conditioned".equals(type) ? "selected" : "" %>>Non-Air Conditioned</option>
        </select>
        
        <label>Luggages:</label>
        <input type="text" name="luggages" value="<%= luggages %>">
        
        <label>Price Per Minute:</label>
        <input type="text" name="price_per_minute" value="<%= pricePerMinute %>" required>
        
        <button type="submit">Update Car</button>
        <a href="manage-cars.jsp"><button type="button" class="cancel-btn">Cancel</button></a>
    </form>
</div>

</body>
</html>
