<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Services - Mega City Cabs</title>
<link rel="stylesheet" href="CSS/services.css?v=1.1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

	<!-- Services Section -->
	<section class="services">
		<div class="services">
			<div class="services-content">
				<div class="services-left">
					<img src="images/yellow car.png" alt="Yellow Car">
				</div>
				<div class="services-right">
					<h2>Our Premium Services</h2>
					<p style="color: var(--brown); font-weight: bold;"> Experience the best in class cab services tailored for your
						needs.</p>
				</div>
			</div>
		</div>

		<div class="services-container">
			<div class="service-card">
				<div class="icon">
					<i class="fas fa-taxi"></i>
				</div>
				<h3>City Rides</h3>
				<p style="color: var(--brown); font-weight: bold;">Fast and affordable rides within the city, available 24/7.</p>
			</div>

			<div class="service-card">
				<div class="icon">
					<i class="fas fa-car-side"></i>
				</div>
				<h3>Outstation Travel</h3>
				<p style="color: var(--brown); font-weight: bold;">Travel hassle-free with our long-distance cab services.</p>
			</div>

			<div class="service-card">
				<div class="icon">
					<i class="fas fa-business-time"></i>
				</div>
				<h3>Corporate Rides</h3>
				<p style="color: var(--brown); font-weight: bold;">Exclusive transport solutions for businesses and
					professionals.</p>
			</div>

			<div class="service-card">
				<div class="icon">
					<i class="fas fa-handshake"></i>
				</div>
				<h3>Car Rentals</h3>
				<p style="color: var(--brown); font-weight: bold;">Flexible rental options for short and long-term use.</p>
			</div>

			<div class="service-card">
				<div class="icon">
					<i class="fas fa-wheelchair"></i>
				</div>
				<h3>Special Assistance</h3>
				<p style="color: var(--brown); font-weight: bold;">Comfortable rides designed for passengers with special needs.</p>
			</div>

			<div class="service-card">
				<div class="icon">
					<i class="fas fa-shuttle-van"></i>
				</div>
				<h3>Airport Transfers</h3>
				<p style="color: var(--brown); font-weight: bold;">Punctual and reliable airport pickup and drop-off services.</p>
			</div>
		</div>
	</section>

	<!-- Detailed Services Information -->
	<section class="detailed-services">
		<h2>Why Choose Our Services?</h2>
		<div class="details-container">
			<div class="detail">
				<img src="images/Safety First.jpg" alt="Safe Rides">
				<h3>Safety First</h3>
				<p>All our drivers undergo extensive background checks, ensuring
					a safe journey for you.</p>
			</div>

			<div class="detail">
				<img src="images/Affordable Pricing.jpg" alt="Affordable Pricing">
				<h3>Affordable Pricing</h3>
				<p>Enjoy the most competitive fares without any hidden costs.</p>
			</div>

			<div class="detail">
				<img src="images/Comfort.png" alt="Comfort">
				<h3>Luxury & Comfort</h3>
				<p>Well-maintained vehicles that provide a smooth and
					comfortable ride.</p>
			</div>
		</div>
	</section>

	<!-- Testimonials Section -->
	<section class="testimonials">
		<h2>What Our Customers Say</h2>
		<div class="testimonial-container">
			<div class="testimonial">
				<p>"Mega City Cabs is the best! Always on time and very
					professional drivers."</p>
				<h4>- Sarah Johnson</h4>
			</div>

			<div class="testimonial">
				<p>"I love the convenience of booking rides through their website.
					Highly recommend!"</p>
				<h4>- Michael Adams</h4>
			</div>

			<div class="testimonial">
				<p>"Their airport transfer service is exceptional. No stress,
					just smooth rides."</p>
				<h4>- Emily Davis</h4>
			</div>
		</div>
	</section>

	<!-- Book Now Section -->
    <div class="book-now-section">
        <div class="book-now-text">
            <h2>Ready to Ride?</h2>
            <p>Book your cab easily through our website. Just fill in the details, and your ride will be on its way!</p>
            <button onclick="location.href='customer-login.jsp';" class="book-now-btn">Book A Ride &nbsp;<i class="fa-solid fa-car-side" style="color: #ffffff;"></i></i></button>
        </div>
        <div class="book-now-image">
            <img src="images/book now.jpg" alt="Book Now" class="book-now-img">
        </div>
    </div>

	<!-- Footer Section -->
	<footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="home.jsp" class="footer-link">
                    <i class="fas fa-info-circle"></i> Home
                </a>
                <a href="reviews.jsp" class="footer-link">
                    <i class="fas fa-comments"></i> Reviews
                </a>
                <a href="contact-us.jsp" class="footer-link">
                    <i class="fas fa-phone-alt"></i> Contact Us
                </a>
                <a href="about-us.jsp" class="footer-link">
                    <i class="fas fa-info-circle"></i> About Us
                </a>
                <a href="help.jsp" class="footer-link"> <i
					class="fas fa-question-circle"></i> Help
				</a> 
            </div>
        </div>
    </footer>
</body>
</html>