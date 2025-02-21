<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/about-us.css?v=1.0">
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

        <!-- Our Achievements Section -->
        <section class="achievements" id="achievements-section">
            <h3>Our Achievements</h3>
            <div class="achievements-container">
                <div class="achievement">
                    <div class="counter" id="happy-customers">0</div>
                    <p>Happy Customers</p>
                </div>
                <div class="achievement">
                    <div class="counter" id="rides-completed">0</div>
                    <p>Rides Completed</p>
                </div>
                <div class="achievement">
                    <div class="counter" id="years-experience">0</div>
                    <p>Years of Experience</p>
                </div>
                <div class="achievement">
                    <div class="counter" id="customer-satisfaction">0</div>
                    <p>Customer Satisfaction</p>
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
                <a href="services.jsp" class="footer-link">
                    <i class="fas fa-wrench"></i> Services
                </a>
            </div>
        </div>
    </footer>

    <script>
        let happyCustomers = 100;
        let ridesCompleted = 1000;
        let yearsExperience = 10;
        let customerSatisfaction = 100;

        function animateCounter(id, start, end) {
            let current = start;
            let interval = setInterval(function () {
                document.getElementById(id).innerText = current + '+';
                if (current === end) {
                    clearInterval(interval);
                } else {
                    current++;
                }
            }, 10);
        }

        function handleScroll() {
            const section = document.getElementById("achievements-section");
            const rect = section.getBoundingClientRect();
            if (rect.top <= window.innerHeight && rect.bottom >= 0) {
                animateCounter('happy-customers', 0, happyCustomers);
                animateCounter('rides-completed', 0, ridesCompleted);
                animateCounter('years-experience', 0, yearsExperience);
                animateCounter('customer-satisfaction', 0, customerSatisfaction);
                window.removeEventListener("scroll", handleScroll);
            }
        }

        window.addEventListener("scroll", handleScroll);
    </script>
</body>
</html>