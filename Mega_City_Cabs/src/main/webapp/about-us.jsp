<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/about-us.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Menu Bar -->
    <header class="menu-bar">
        <div class="logo">
            <img src="images/Logo.png" alt="Mega City Cabs Logo">
        </div>
        <nav class="nav-links">
            <a href="home.jsp">Home</a>
            <a href="about-us.jsp">About Us</a>
            <a href="help.jsp">Help</a>
            <a href="services.jsp">Services</a>
            <a href="reviews.jsp">Reviews</a>
            <a href="contact-us.jsp">Contact Us</a>
        </nav>
        <div class="buttons">
            <button onclick="location.href='login.jsp';" class="login-btn">Login</button>
            <button onclick="location.href='signup.jsp';" class="signup-btn">Sign Up</button>
        </div>
    </header>

    <!-- About Us Section -->
    <section class="about-us">
        <!-- New Div with Left Cab Image and Right Description -->
        <div class="about-container">
            <div class="about-left">
                <img src="images/cab card.png" alt="Mega City Cabs Fleet" class="cab-image">
            </div>
            <div class="about-right">
                <h2>About Mega City Cabs</h2>
                <p>
                    At Mega City Cabs, we provide premium transportation services to meet all your travel needs.
                    We strive to offer safe, comfortable, and reliable rides with a fleet of modern, well-maintained vehicles.
                    Our team of professional drivers ensures a smooth and enjoyable travel experience at affordable prices.
                </p>
            </div>
        </div>

        <!-- Mission and Vision Cards -->
        <div class="cards-container">
            <div class="card mission-card">
                <div class="card-icon">
                    <i class="fas fa-eye"></i>
                </div>
                <h3>Our Vision</h3>
                <p>To be the leading and most reliable transportation service provider in the city, delivering exceptional service.</p>
            </div>
            <div class="card mission-card">
                <div class="card-icon">
                    <i class="fas fa-bullseye"></i>
                </div>
                <h3>Our Mission</h3>
                <p>To offer high-quality rides, timely services, and exceptional customer care at affordable rates to all our clients.</p>
            </div>
        </div>

        <!-- Our Services Section with Yellow Background -->
        <section class="services">
            <h3>Our Services</h3>
            <p style="text-align: center;">We offer a variety of transportation services to meet all your needs. Whether you need a ride to the airport, a quick trip around town, or a special event, we’ve got you covered.</p>
            <div class="services-container" style="background-color: var(--yellow);">
                <!-- Left Div with Image -->
                <div class="service-left">
                    <img src="images/yellow car.png" alt="Yellow Car" class="service-image">
                </div>
                <!-- Right Div with Description -->
                <div class="service-right">
                    <h4>City Rides</h4>
                    <p>Experience seamless travel across the city with our City Rides service. Whether you're heading to a business meeting, a family gathering, or just out for a day of exploration, our fleet of comfortable and reliable cars ensures you reach your destination safely and on time. With our professional drivers and punctuality, you can enjoy the ride stress-free.</p>
                </div>
            </div>
            <div class="services-container" style="background-color: var(--yellow);">
                <!-- Left Div with Image -->
                <div class="service-left">
                    <img src="images/yellow car.png" alt="Yellow Car" class="service-image">
                </div>
                <!-- Right Div with Description -->
                <div class="service-right">
                    <h4>Corporate Services</h4>
                    <p>Enhance your business's image with our Corporate Services. We cater to businesses of all sizes, offering timely and professional transportation solutions for meetings, conferences, and corporate events. Our clean, modern fleet and experienced drivers guarantee that you and your clients will arrive in comfort and style.</p>
                </div>
            </div>
            <div class="services-container" style="background-color: var(--yellow);">
                <!-- Left Div with Image -->
                <div class="service-left">
                    <img src="images/yellow car.png" alt="Yellow Car" class="service-image">
                </div>
                <!-- Right Div with Description -->
                <div class="service-right">
                    <h4>Airport Transfers</h4>
                    <p>Make your airport transfer hassle-free with Mega City Cabs. Whether you're arriving or departing, we provide reliable, punctual, and comfortable transportation to and from the airport. Let our drivers handle the stress of traffic and parking, so you can relax and focus on your journey ahead.</p>
                </div>
            </div>
            <div class="services-container" style="background-color: var(--yellow);">
                <!-- Left Div with Image -->
                <div class="service-left">
                    <img src="images/yellow car.png" alt="Yellow Car" class="service-image">
                </div>
                <!-- Right Div with Description -->
                <div class="service-right">
                    <h4>Special Events</h4>
                    <p>Add a touch of luxury and convenience to your special event with our tailored transportation services. Whether it's a wedding, a gala, or a concert, we offer premium rides that match the occasion. Our fleet is equipped to handle the needs of any event, ensuring a smooth and memorable experience for you and your guests.</p>
                </div>
            </div>
        </section>
    </section>

    <!-- Footer Section -->
    <footer>
        <div class="footer-container">
            <div class="footer-left">
                <p>&copy; 2025 Mega City Cabs. All rights reserved.</p>
            </div>
            <div class="footer-right">
                <a href="home.jsp" class="footer-link">
                    <i class="fas fa-home"></i> Home
                </a>
                <a href="reviews.jsp" class="footer-link">
                    <i class="fas fa-comments"></i> Reviews
                </a>
                <a href="contact-us.jsp" class="footer-link">
                    <i class="fas fa-phone-alt"></i> Contact Us
                </a>
                <a href="help.jsp" class="footer-link">
                    <i class="fas fa-question-circle"></i> Help
                </a>
            </div>
        </div>
    </footer>
</body>
</html>
