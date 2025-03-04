package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Bean.Booking;

public class BookingDAO {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "1234";

    public boolean saveBooking(Booking booking) {
        boolean isSaved = false;
        String query = "INSERT INTO booking (booking_id, first_name, last_name, userID, email, phone, pickup_location, drop_location, pickup_time, route, carID, car_name, estimated_time, price_per_minute, card_number, fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String[] userNames = getUserNames(booking.getUserID());
        if (userNames != null) {
            booking.setFirst_name(userNames[0]);
            booking.setLast_name(userNames[1]);
        }

        String booking_id = generateBookingId();
        String carID = getCarIdByName(booking.getCar_name());
        double price_per_minute = getPricePerMinute(booking.getCar_name());

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, booking_id);
            stmt.setString(2, booking.getFirst_name());
            stmt.setString(3, booking.getLast_name());
            stmt.setString(4, booking.getUserID());
            stmt.setString(5, booking.getEmail());
            stmt.setString(6, booking.getPhone());
            stmt.setString(7, booking.getPickup_location());
            stmt.setString(8, booking.getDrop_location());
            stmt.setString(9, booking.getPickup_time());
            stmt.setString(10, booking.getRoute());
            stmt.setString(11, carID);
            stmt.setString(12, booking.getCar_name());
            stmt.setString(13, booking.getEstimated_time());
            stmt.setDouble(14, price_per_minute);
            stmt.setString(15, booking.getCard_number());
            stmt.setDouble(16, booking.getFare());

            System.out.println("Booking Details:");
            System.out.println("Booking ID: " + booking_id);
            System.out.println("Car Name: " + booking.getCar_name());
            System.out.println("Car ID: " + carID);
            System.out.println("Price per Minute: " + price_per_minute);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSaved;
    }

    public double getPricePerMinute(String carName) {
        double price_per_minute = 0.0;
        String query = "SELECT price_per_minute FROM car WHERE car_name = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, carName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                price_per_minute = rs.getDouble("price_per_minute");  
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return price_per_minute;  
    }

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
        String query = "SELECT firstName, lastName FROM users WHERE userID = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, userID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String first_name = rs.getString("firstName");
                String last_name = rs.getString("lastName");
                return new String[]{first_name, last_name};
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
}