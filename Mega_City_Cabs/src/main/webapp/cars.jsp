<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cars - Mega City Cabs</title>
    <link rel="stylesheet" href="CSS/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <style>
        .best-cars {
            padding: 100px 20px 40px 20px;
            text-align: center;
        }

        .best-cars h2 {
            font-size: 36px;
            margin-bottom: 40px;
            font-weight: 600;
            color: #333;
        }

        .car-cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            margin-top: 30px;
            max-width: 100%;
        }

        .car-card {
            width: 100%;
            max-width: 100%;
            background-color: #007BFF;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            display: flex;
            flex-direction: row;
            margin-left: 200px;
            margin-right: 200px;
        }

        .car-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .car-card .car-image {
            width: 50%;
            height: 100%;
            overflow: hidden;
        }

        .car-card .car-image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .car-card .car-info {
            padding: 20px;
            width: 60%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .car-info h3 {
            font-size: 27px;
            color: #333;
            margin-bottom: 10px;
        }

        .car-info p {
            color: #4f200d;
            font-size: 20px;
        }

        .car-info .details {
            font-size: 16px;
            margin-top: 15px;
            line-height: 1.5;
            font-weight: 500;
            color: #444;
        }

        .details p {
            margin: 5px 0;
            color: #4f200d;
        }

        .details i {
            margin-right: 8px; 
            color: #4f200d; 
        }
    </style>
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

    <!-- Cars Section -->
    <div class="best-cars">
        <h2>Our Best Cars</h2>
        <div class="car-cards">
        
            <div class="car-card">
                <div class="car-image">
                    <img src="images/suzuki alto.png" alt="Suzuki Alto">
                </div>
                <div class="car-info">
                    <h3> Suzuki Alto</h3>
                    <p>The Suzuki Alto is a compact, fuel-efficient car that excels in city driving. Its small size makes it easy to park and maneuver, while its comfortable interior ensures an enjoyable ride for short and long distances.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 3 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 2 Bags</p>
                    </div>
                </div>
            </div>

            <div class="car-card">
                <div class="car-image">
                    <img src="images/tata nano 2.png" alt="Tata Nano">
                </div>
                <div class="car-info">
                    <h3>Tata Nano</h3>
                    <p>The Tata Nano is an innovative, budget-friendly car that offers surprising space and comfort. Its compact size makes it an ideal choice for navigating crowded streets, while the surprisingly spacious cabin provides comfort for all passengers.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 3 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 4 Bags</p>
                    </div>
                </div>
            </div>

            <div class="car-card">
                <div class="car-image">
                    <img src="images/wagon.png" alt="Suzuki WagonR">
                </div>
                <div class="car-info">
                    <h3>Suzuki WagonR</h3>
                    <p>The Suzuki WagonR is a reliable and spacious hatchback, offering comfort and practicality for family trips. Its high roof and wide interior make it perfect for longer journeys, while its fuel efficiency ensures you get the best value for your money.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 4 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 2 Bags</p>
                    </div>
                </div>
            </div>
            
            <div class="car-card">
                <div class="car-image">
                    <img src="images/aqua.png" alt="Toyota Aqua">
                </div>
                <div class="car-info">
                    <h3>Toyota Aqua</h3>
                    <p>A compact and fuel-efficient hybrid hatchback, perfect for city driving and long trips. It offers great mileage, a comfortable interior, and modern safety features, making it an eco-friendly and practical choice.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 5 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 3 Bags</p>
                    </div>
                </div>
            </div>

            <div class="car-card">
                <div class="car-image">
                    <img src="images/prius.png" alt="Toyota Prius">
                </div>
                <div class="car-info">
                    <h3>Toyota Prius</h3>
                    <p> A reliable and eco-friendly hybrid sedan, known for its smooth drive, spacious interior, and advanced safety features. Its aerodynamic design enhances fuel efficiency, making it ideal for both urban and long-distance travel.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 5 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 4 Bags</p>
                    </div>
                </div>
            </div>

            <div class="car-card">
                <div class="car-image">
                    <img src="images/kdh.png" alt="Toyota KDH Van">
                </div>
                <div class="car-info">
                    <h3>Toyota KDH Van</h3>
                    <p>A spacious and durable van, perfect for family trips and group travel. It features a powerful engine, air-conditioned cabin, and ample seating for 10 passengers, ensuring comfort on long journeys.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 10 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 8 Bags</p>
                    </div>
                </div>
            </div>

            <div class="car-card">
                <div class="car-image">
                    <img src="images/highroof.png" alt="Toyota Highroof KDH">
                </div>
                <div class="car-info">
                    <h3>Toyota High Roof KDH Van</h3>
                    <p>A luxury high-roof van designed for large groups and executive transport. With extra headroom, plush seating, and advanced safety features, it provides a smooth and comfortable travel experience for up to 14 passengers.</p>
                    <div class="details">
                        <p><i class="fas fa-users"></i> 14 Passengers</p>
                        <p><i class="fas fa-snowflake"></i> Air Conditioned</p>
                        <p><i class="fa-solid fa-briefcase"></i> 10 Bags</p>
                    </div>
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
                <a href="about-us.jsp" class="footer-link"> <i class="fas fa-info-circle"></i> About Us </a>
                <a href="reviews.jsp" class="footer-link"> <i class="fas fa-comments"></i> Reviews </a>
                <a href="contact-us.jsp" class="footer-link"> <i class="fas fa-phone-alt"></i> Contact Us </a>
                <a href="help.jsp" class="footer-link"> <i class="fas fa-question-circle"></i> Help </a>
                <a href="services.jsp" class="footer-link"> <i class="fas fa-wrench"></i> Services </a>
            </div>
        </div>
    </footer>

</body>

</html>
