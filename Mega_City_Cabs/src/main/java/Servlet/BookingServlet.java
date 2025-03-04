package Servlet;

import Bean.Booking;
import Dao.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            String userID = (String) session.getAttribute("userId");

            if (userID == null || userID.isEmpty()) {
                response.sendRedirect("customer-login.jsp");
                return;
            }

            String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
            String phone = request.getParameter("phone") != null ? request.getParameter("phone").trim() : "";
            String pickup_location = request.getParameter("pickup_location") != null ? request.getParameter("pickup_location").trim() : "";
            String drop_location = request.getParameter("drop_location") != null ? request.getParameter("drop_location").trim() : "";
            String pickup_time = request.getParameter("pickup_time") != null ? request.getParameter("pickup_time").trim() : "";
            String route = request.getParameter("route") != null ? request.getParameter("route").trim() : "";
            String car_name = request.getParameter("car_name") != null ? request.getParameter("car_name").trim() : "";
            String estimated_time = request.getParameter("estimated_time") != null ? request.getParameter("estimated_time").trim() : "";

            double price_per_minute = 0.0;
            double fare = 0.0;
            String fare_str = request.getParameter("fare");
            if (fare_str != null && !fare_str.isEmpty()) {
                fare = Double.parseDouble(fare_str.trim());
            }

            BookingDAO dao = new BookingDAO();

            String booking_id = dao.generateBookingId();

            String[] userNames = dao.getUserNames(userID);
            String first_name = userNames != null ? userNames[0] : "";
            String last_name = userNames != null ? userNames[1] : "";

            String carID = dao.getCarIdByName(car_name);
            price_per_minute = dao.getPricePerMinute(car_name); 

            System.out.println("Booking ID: " + booking_id);
            System.out.println("User ID: " + userID);
            System.out.println("Car Name: " + car_name);
            System.out.println("Car ID: " + carID);
            System.out.println("Price per Minute: " + price_per_minute);

            Booking booking = new Booking();
            booking.setBooking_id(booking_id);
            booking.setUserID(userID);
            booking.setFirst_name(first_name);
            booking.setLast_name(last_name);
            booking.setEmail(email);
            booking.setPhone(phone);
            booking.setPickup_location(pickup_location);
            booking.setDrop_location(drop_location);
            booking.setPickup_time(pickup_time);
            booking.setRoute(route);
            booking.setCarID(carID);
            booking.setCar_name(car_name);
            booking.setEstimated_time(estimated_time);
            booking.setPrice_per_minute(price_per_minute);
            booking.setFare(fare);

            boolean isSaved = dao.saveBooking(booking);

            if (isSaved) {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Booking saved successfully!');window.location='customer-dashboard.jsp';</script>");
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Failed to save booking.');window.location='customer-dashboard.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('An error occurred while processing the booking.');window.location='customer-dashboard.jsp';</script>");
        }
    }
}
