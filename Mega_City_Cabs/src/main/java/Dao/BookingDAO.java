package Dao;

import Bean.Booking;
import java.sql.*;

public class BookingDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "1234";
    
    
    public String generateBookingId() {
        String generatedBookingId = "";
        String query = "SELECT MAX(CAST(SUBSTRING(booking_id, 2) AS UNSIGNED)) FROM booking";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                int maxBookingId = rs.getInt(1);
                generatedBookingId = "B" + String.format("%05d", maxBookingId + 1);
            } else {
                generatedBookingId = "B00001";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedBookingId;
    }

    public String[] getUserNames(String userID) {
        String[] userNames = new String[2];
        String query = "SELECT firstName, lastName FROM users WHERE userID = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, userID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                userNames[0] = rs.getString("firstName");
                userNames[1] = rs.getString("lastName");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userNames;
    }

    public String getCarIdByName(String carName) {
        String carID = null;
        String query = "SELECT carID FROM car WHERE car_name = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, carName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                carID = rs.getString("carID");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carID;
    }

    public double getPricePerMinute(String carName) {
        double price = 0.0;
        String query = "SELECT price_per_minute FROM car WHERE car_name = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, carName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                price = rs.getDouble("price_per_minute");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return price;
    }

    public String getDriverNameById(String driverID) {
        String driverName = null;
        String query = "SELECT firstName, lastName FROM users WHERE userID = ? AND userLevel = 3";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, driverID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                driverName = rs.getString("firstName") + " " + rs.getString("lastName");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return driverName;
    }

    public boolean saveBooking(Booking booking) {
        String query = "INSERT INTO booking (booking_id, userID, first_name, last_name, email, phone, " +
                "pickup_location, drop_location, pickup_time, route, carID, car_name, estimated_time, " +
                "price_per_minute, fare, card_number, driver_name, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, booking.getBooking_id());
            stmt.setString(2, booking.getUserID());
            stmt.setString(3, booking.getFirst_name());
            stmt.setString(4, booking.getLast_name());
            stmt.setString(5, booking.getEmail());
            stmt.setString(6, booking.getPhone());
            stmt.setString(7, booking.getPickup_location());
            stmt.setString(8, booking.getDrop_location());
            stmt.setString(9, booking.getPickup_time());
            stmt.setString(10, booking.getRoute());
            stmt.setString(11, booking.getCarID());
            stmt.setString(12, booking.getCar_name());
            stmt.setString(13, booking.getEstimated_time());
            stmt.setDouble(14, booking.getPrice_per_minute());
            stmt.setDouble(15, booking.getFare());
            stmt.setString(16, booking.getCard_number());
            stmt.setString(17, booking.getDriver_name());
            stmt.setString(18, "Pending");

            int result = stmt.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
