<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us - Mega City Cabs</title>
<link rel="stylesheet" href="CSS/contact-us.css?v=1.0">
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

	<!-- Contact Section -->
	<div class="contact-container">
		<h2>Get in Touch with Us</h2>

		<div class="contact-container">
			<div class="form-container">
				<!-- Left Side: Image & Info -->
				<div class="form-left">
					<h3>We are here to help!</h3>
					<p>Reach out to us, and we’ll get back to you as soon as
						possible.</p>
					<img src="images/contact.png" alt="Contact Us">
				</div>

				<!-- Right Side: Form -->
				<div class="form-right">
					<form action="contact-servlet" method="POST">
						<div class="input-group"style="margin-top: 40px;">
							<input type="text" name="name" id="name" required> <label
								for="name">Your Name:</label>
						</div>
						<div class="input-group">
							<input type="email" name="email" id="email" required> <label
								for="email">Your Email:</label>
						</div>
						<div class="input-group">
							<select name="subject" id="subject" required>
								<option value="Select option">Select option</option>
								<option value="General Inquiry">General Inquiry</option>
								<option value="Complaint">City Rides</option>
								<option value="Complaint">Outstation Travel</option>
								<option value="Complaint">Corporate Rides</option>
								<option value="Complaint">Special Assistance</option>
								<option value="Booking Assistance">Wedding Car Rentals</option>
								<option value="Service Feedback">Airport Dropoff</option>
								<option value="Complaint">Complaint</option>
								<option value="Other">Other</option>
							</select> <label for="subject">Subject:</label>
						</div>
						<div class="input-group">
							<textarea name="message" id="message" rows="1" required></textarea>
							<label for="message">Your Message:</label>
						</div>
						<button type="submit" class="submit-btn">Send Message &nbsp;<i class="fas fa-paper-plane" style="color: #FFFFFF;"></i></button>
					</form>
				</div>
			</div>
		</div>


		<!-- Contact Information Section -->
		<div class="contact-info">
			<!-- Contact Card Section -->
			<div class="contact-card">
				<h2>Need Further Assistance?</h2>
				<p>If you have more questions or need help, reach out to our
					customer support team!</p>
				<img src="images/contact card white.png" alt="Contact Image"
					class="contact-image">
			</div>
			<div class="map-container">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31686.519805739803!2d79.8488!3d6.9271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25928945301e1%3A0x9a7b42f3c6160c5a!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2sus!4v1638824394891!5m2!1sen!2sus"
					width="100%" height="200" style="border: 0;" allowfullscreen=""
					loading="lazy"> </iframe>
			</div>
		</div>
	</div>

	<!-- Footer Section -->
	<footer>
		<div class="footer-container">
			<div class="footer-left">
				<p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
			</div>
			<div class="footer-right">
				<a href="home.jsp" class="footer-link"> <i class="fas fa-home"></i>
					Home
				</a> <a href="about-us.jsp" class="footer-link">
                    <i class="fas fa-info-circle"></i> About Us
                </a> 
                <a href="reviews.jsp" class="footer-link">
                    <i class="fas fa-comments"></i> Reviews
                </a> 
				<a href="help.jsp" class="footer-link"> <i
					class="fas fa-question-circle"></i> Help
				</a> 
				<a href="services.jsp" class="footer-link"> <i
					class="fas fa-wrench"></i> Services
				</a>
			</div>
		</div>
	</footer>

</body>
</html>