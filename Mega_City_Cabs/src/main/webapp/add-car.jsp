<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        :root {
            --yellow: #ffd110;
            --orange: #ff8400;
            --brown: #4f200d;
            --border-radius: 12px;
            --btn-padding: 14px 28px;
            --font-weight: 600;
            --transition: 0.3s ease;
            --font-size: 16px;
            --input-padding: 12px;
        }

        body {
            background-color: #ff8400;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .add-car-form {
            background-color: white;
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 700px;
            margin-top: 650px;
        }

        .add-car-form h2 {
            text-align: center;
            color: var(--brown);
            font-size: 28px;
            font-weight: var(--font-weight);
            margin-bottom: 24px;
        }

        .add-car-form label {
            font-weight: var(--font-weight);
            color: var(--brown);
            margin-bottom: 8px;
            display: block;
            font-size: 18px;
        }

        .add-car-form input,
        .add-car-form textarea,
        .add-car-form select {
            width: 100%;
            padding: var(--input-padding);
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: var(--font-size);
            box-sizing: border-box;
        }

        .add-car-form textarea {
            resize: vertical;
            min-height: 120px;
        }

        .add-car-form input[type="submit"] {
            background-color: var(--yellow);
            color: white;
            border: none;
            font-weight: var(--font-weight);
            cursor: pointer;
            padding: var(--btn-padding);
            border-radius: var(--border-radius);
            width: 100%;
            transition: background-color var(--transition), transform var(--transition);
        }

        .add-car-form input[type="submit"]:hover {
            background-color: #e5c600;
            transform: translateY(-2px);
        }

        .add-car-form input[type="submit"]:active {
            transform: translateY(1px);
        }

        .cancel-btn {
            background-color: #dc3545;
            color: white;
            font-weight: var(--font-weight);
            padding: var(--btn-padding);
            border-radius: var(--border-radius);
            width: 100%;
            transition: background-color var(--transition);
        }

        .cancel-btn:hover {
            background-color: #c82333;
        }

        .cancel-btn:active {
            transform: translateY(1px);
        }
    </style>
</head>
<body>

    <header class="menu-bar">
        <div class="logo" style="margin-left: 30px;">
            <img src="images/MCC.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links" style="margin-right: -10px;">
            <a href="admin-dashboard.jsp">Dashboard</a>
            <a href="manage-customers.jsp">Manage Customers</a>
            <a href="manage-bookings.jsp">Manage Bookings</a>
            <a href="manage-cars.jsp">Manage Cars</a>
            <a href="manage-drivers.jsp">Manage Drivers</a>
            <a href="manage-feedbacks.jsp">Manage Feedbacks</a>
        </nav>
        <div class="buttons" style="margin-right: 40px;">
            <button onclick="location.href='admin-logout.jsp';" class="logout-btn">Logout</button>
        </div>
    </header>

    <div class="add-car-form">
        <h2>Add New Car</h2>
        <form action="add-car" method="POST">
            <label for="licensePlate">License Plate:</label>
            <input type="text" id="licensePlate" name="licensePlate" required>

            <label for="carName">Car Name:</label>
            <input type="text" id="carName" name="carName" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description"></textarea>

            <label for="passengers">Passengers:</label>
            <input type="text" id="passengers" name="passengers">

            <label for="type">Car Type:</label>
            <select id="type" name="type" required>
                <option value="Air Conditioned">Air Conditioned</option>
                <option value="Non-Air Conditioned">Non-Air Conditioned</option>
            </select>

            <label for="luggages">Luggages:</label>
            <input type="text" id="luggages" name="luggages">

            <label for="pricePerMinute">Price per Minute:</label>
            <input type="number" id="pricePerMinute" name="pricePerMinute" step="0.01" required>

            <input type="submit" value="Add Car">
            <button type="button" class="cancel-btn" onclick="location.href='manage-cars.jsp'">Cancel</button>
        </form>
    </div>

</body>
</html>
