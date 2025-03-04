package Dao;

import java.sql.*;

public class CarDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public boolean addCar(String licensePlate, String carName, 
                          String description, String passengers, String type, String luggages, 
                          String pricePerMinute) {
        String sql = "INSERT INTO car (carID, license_plate, car_name, description, passengers, type, luggages, price_per_minute) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String nextCarID = generateNextCarID(conn);

            pstmt.setString(1, nextCarID);
            pstmt.setString(2, licensePlate);
            pstmt.setString(3, carName);
            pstmt.setString(4, description);
            pstmt.setString(5, passengers);
            pstmt.setString(6, type);
            pstmt.setString(7, luggages);
            pstmt.setString(8, pricePerMinute);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Car successfully added to database.");
                return true;
            } else {
                System.out.println("Failed to insert car into the database.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Error inserting car into the database: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    private String generateNextCarID(Connection conn) throws SQLException {
        String lastCarID = null;
        String query = "SELECT carID FROM car ORDER BY carID DESC LIMIT 1";

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                lastCarID = rs.getString("carID");
            }
        }

        if (lastCarID == null) {
            return "Car00001";
        } else {
            int lastNumber = Integer.parseInt(lastCarID.substring(3));
            int nextNumber = lastNumber + 1;
            return String.format("Car%05d", nextNumber);
        }
    }
}
