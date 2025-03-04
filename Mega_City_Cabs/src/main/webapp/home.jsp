<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - Mega City Cabs</title>
<link rel="stylesheet" href="CSS/home.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- Menu Bar -->
	<header class="menu-bar">
		<div class="logo">
			<img src="images/MCC.png" alt="Mega City Cabs Logo">
		</div>
		<nav class="nav-links">
			<a href="home.jsp">Home</a> <a href="about-us.jsp">About Us</a> <a
				href="help.jsp">Help</a> <a href="services.jsp">Services</a> <a
				href="reviews.jsp">Reviews</a> <a href="contact-us.jsp">Contact
				Us</a>
		</nav>
		<div class="buttons">
			<button onclick="location.href='login.jsp';" class="login-btn">Login</button>
			<button onclick="location.href='signup.jsp';" class="signup-btn">Sign
				Up</button>
		</div>
	</header>

	<!-- Banner Section -->
	<section class="banner" style="margin-top: 90px;">
		<div class="overlay"></div>
		<img src="images/cab.jpeg" alt="City Cab Banner">
		<div class="banner-text">
			<h1>Welcome to Mega City Cabs</h1>
			<button onclick="location.href='customer-login.jsp';" class="book-now-btn">Book
				Now</button>
		</div>
	</section>

	<!-- Introduction Section -->
	<section class="introduction">
		<div class="intro-container">
			<div class="intro-image">
				<img src="images/why choose us.png" alt="Mega City Cabs Image">
			</div>
			<div class="intro-text">
				<h2>Why Choose Us</h2>
				<p>At Mega City Cabs, we prioritize your convenience and safety.
					With a fleet of well-maintained vehicles and professional drivers,
					we ensure a seamless travel experience. Choose us for:</p>
				<ul>
					<li>24/7 customer support</li>
					<li>Affordable pricing</li>
					<li>Fast and easy booking</li>
					<li>Reliable and safe rides</li>
				</ul>
			</div>
		</div>
	</section>

	<section class="best-cars">
		<h2>Our Best Cars</h2>
		<div class="car-cards">
			<%
				String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
				String dbUser = "root";
				String dbPassword = "1234";
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection(url, dbUser, dbPassword);
					
					String sql = "SELECT * FROM car LIMIT 3";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						String carName = rs.getString("car_name");
						String description = rs.getString("description");
						String passengers = rs.getString("passengers");
						String luggages = rs.getString("luggages");
			%>
			
			<div class="car-card" style="background-color: white;">
				<img src="images/cars.png" alt="<%= carName %>" style="object-fit: contain;">
				<div class="car-info">
					<h3>
						<i class="fas fa-car"></i> <%= carName %>
					</h3>
					<p><%= description %></p>
					<p>
						<i class="fas fa-users"></i> <%= passengers %> passengers
					</p>
					<p>
						<i class="fas fa-snowflake"></i> Air Conditioned
					</p>
					<p>
						<i class="fas fa-briefcase"></i> <%= luggages %> bags
					</p>
				</div>
			</div>
			
			<%
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (SQLException e) {}
					if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
					if (conn != null) try { conn.close(); } catch (SQLException e) {}
				}
			%>
		</div>

		<div class="see-more-container">
			<button class="see-more-btn"
				onclick="window.location.href='cars.jsp'">
				See More Cars <i class="fas fa-arrow-right"></i>
			</button>
		</div>
	</section>

	<!-- Footer Section -->
	<footer>
		<div class="footer-container">
			<div class="footer-left">
				<p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
			</div>
			<div class="footer-right">
				<a href="about-us.jsp" class="footer-link"> <i
					class="fas fa-info-circle"></i> About Us
				</a> <a href="reviews.jsp" class="footer-link"> <i
					class="fas fa-comments"></i> Reviews
				</a> <a href="contact-us.jsp" class="footer-link"> <i
					class="fas fa-phone-alt"></i> Contact Us
				</a> <a href="help.jsp" class="footer-link"> <i
					class="fas fa-question-circle"></i> Help
				</a> <a href="services.jsp" class="footer-link"> <i
					class="fas fa-wrench"></i> Services
				</a>
			</div>
		</div>
	</footer>

</body>
</html>
