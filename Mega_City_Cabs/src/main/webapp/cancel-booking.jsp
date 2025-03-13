<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String bookingId = request.getParameter("booking_id");

    if (bookingId != null && !bookingId.isEmpty()) {
        String dbUrl = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
        String dbUser = "root";
        String dbPassword = "1234";

        try {
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String updateSql = "UPDATE booking SET status = ? WHERE booking_id = ?";
            PreparedStatement stmt = conn.prepareStatement(updateSql);
            stmt.setString(1, "Booking Cancelled");
            stmt.setString(2, bookingId);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                session.setAttribute("cancelSuccess", "Your booking has been successfully cancelled.");
            } else {
                session.setAttribute("cancelError", "Failed to cancel the booking. Please try again.");
            }

            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("cancelError", "An error occurred while trying to cancel your booking.");
        }
    }

    response.sendRedirect("booking-activity.jsp");
%>
