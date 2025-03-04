<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars - Mega City Cabs</title>
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
            margin-top: -3px;
        }

        .dashboard-header {
            font-size: 32px;
            font-weight: var(--font-weight);
            margin-bottom: 30px;
            color: var(--brown);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: justify;
            border: 1px solid #ddd;
        }

        th {
            background-color: #ff8400;
            color: var(--brown);
            text-align: center;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            max-width: 900px;
            margin: 20px auto;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 120px;
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
            width: 200px;
            transition: background-color var(--transition), transform var(--transition);
        }

        .form-container a:hover {
            background-color: #e87e00;
            transform: translateY(-2px);
        }

        .form-container a:active {
            transform: translateY(1px);
        }

        .cancel-btn {
            background-color: #ff4c4c;
        }

        .cancel-btn:hover {
            background-color: #e43f3f;
        }

        .edit-btn{
        	margin-bottom: 10px;
        }

        .edit-btn, .delete-btn {
		    padding: 10px 20px;
		    text-decoration: none;
		    border-radius: 8px;
		    font-weight: 600;
		    border: none;
		    cursor: pointer;
		    display: inline-flex;
		    align-items: center;
		    gap: 8px;
		    transition: background-color 0.3s ease, transform 0.2s ease;
		}
		
		.edit-btn {
		    background-color: #28a745;
		    color: white;
		}
		
		.delete-btn {
		    background-color: #dc3545;
		    color: white;
		}
		
		.edit-btn:hover {
		    background-color: #218838;
		    transform: scale(1.05);
		}
		
		.delete-btn:hover {
		    background-color: #c82333;
		    transform: scale(1.05);
		}
		
		.edit-btn:active, .delete-btn:active {
		    transform: scale(0.98);
		}
		
		.edit-btn i, .delete-btn i {
		    font-size: 16px;
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

    <!-- Add Car Button -->
    <div class="form-container">
        <p>To register new cars, click the "Add New Cars" button below &#x1F447;</p>
        <a href="add-car.jsp">Add New Cars</a>
    </div>

    <div class="dashboard-container">
        <div class="dashboard-header">Manage Cars</div>

        <%
            String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
            String user = "root";
            String password = "1234";

            String query = "SELECT * FROM car";
            List<Map<String, Object>> cars = new ArrayList<>();

            try (Connection conn = DriverManager.getConnection(url, user, password);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    Map<String, Object> car = new HashMap<>();
                    car.put("carID", rs.getString("carID"));
                    car.put("license_plate", rs.getString("license_plate"));
                    car.put("car_name", rs.getString("car_name"));
                    car.put("description", rs.getString("description"));
                    car.put("passengers", rs.getString("passengers"));
                    car.put("type", rs.getString("type"));
                    car.put("luggages", rs.getString("luggages"));
                    car.put("price_per_minute", rs.getBigDecimal("price_per_minute")); // Add price_per_minute field
                    cars.add(car);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (!cars.isEmpty()) {
        %>

        <table>
            <thead>
                <tr>
                    <th>Car ID</th>
                    <th>Car Name</th>
                    <th>License Plate</th>
                    <th>Description</th>
                    <th>Passengers</th>
                    <th>Type</th>
                    <th>Luggages</th>
                    <th>Price per Minute</th> <!-- Added price per minute column -->
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Map<String, Object> car : cars) {
                %>
                <tr>
                    <td><%= car.get("carID") %></td>
                    <td><%= car.get("car_name") %></td>
                    <td><%= car.get("license_plate") %></td>
                    <td><%= car.get("description") %></td>
                    <td><%= car.get("passengers") %></td>
                    <td><%= car.get("type") %></td>
                    <td><%= car.get("luggages") %></td>
                    <td><%= car.get("price_per_minute") %></td> <!-- Display price per minute -->
                    <td style="text-align: center;">
                        <a href="edit-car.jsp?carID=<%= car.get("carID") %>" class="edit-btn"><i class="fas fa-edit"></i></a>
                        <a href="delete-car.jsp?carID=<%= car.get("carID") %>" class="delete-btn" onclick="return confirm('Are you sure you want to delete this car?');"><i class="fas fa-trash-alt"></i></a>
                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <% 
            } else {
                out.println("<p>No cars available.</p>");
            }
        %>

    </div>
</body>
</html>
