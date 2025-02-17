<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reviews - Mega City Cabs</title>
<link rel="stylesheet" href="CSS/reviews.css?v=1.0">
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

	<!-- Review Section -->
	<div class="review-container">

		<!-- Review Box-->
		<div class="review-box">
			<div class="review-left">
				<h2>Customer Reviews</h2>
				<p>We value your feedback! Leave a review about your experience
					with Mega City Cabs.</p>
				<button class="feedback-btn" onclick="location.href='feedback.jsp';">Give
					Feedback</button>
			</div>
			<div class="review-right">
				<img src="images/feedback.png" alt="Customer Feedback"
					class="review-image">
			</div>
		</div>

		<!-- Display Reviews -->
		<div class="reviews">
			<h3>What Our Customers Say</h3>
			<div class="review-grid">
				<div class="review-card">
					<div class="reviewer-info">
						<img src="images/reviewer.png" alt="John Doe">
						<h4>John Doe</h4>
					</div>
					<p>"Excellent service! The drivers are professional and
						friendly."</p>
				</div>
				<div class="review-card">
					<div class="reviewer-info">
						<img src="images/reviewer.png" alt="Jane Smith">
						<h4>Jane Smith</h4>
					</div>
					<p>"The cabs are always clean, and the rides are smooth. Highly
						recommended!"</p>
				</div>
				<div class="review-card">
					<div class="reviewer-info">
						<img src="images/reviewer.png" alt="Michael Brown">
						<h4>Michael Brown</h4>
					</div>
					<p>"Affordable rates and prompt service. Definitely my go-to
						cab service!"</p>
				</div>
				<div class="review-card">
					<div class="reviewer-info">
						<img src="images/reviewer.png" alt="Sarah Wilson">
						<h4>Sarah Wilson</h4>
					</div>
					<p>"The booking process was seamless, and the driver was very
						courteous."</p>
				</div>
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
                <a href="contact-us.jsp" class="footer-link"> <i
					class="fas fa-phone-alt"></i> Contact Us
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
