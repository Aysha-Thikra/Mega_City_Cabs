package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.Customer;

public class CustomerDAO {

    public static String generateCustomerID(Connection conn) throws SQLException {
        String query = "SELECT userID FROM users ORDER BY userID DESC LIMIT 1";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String lastID = rs.getString("userID");
                int num = Integer.parseInt(lastID.substring(1)) + 1;
                return String.format("U%07d", num);
            } else {
                return "U0000001";
            }
        }
    }

    public static boolean insertCustomer(Customer customer) {
        String sql = "INSERT INTO users (userID, firstName, lastName, address, NIC, phoneNumber, email, licenseNumber, username, password, userLevel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String userID = generateCustomerID(conn);
            ps.setString(1, userID);
            ps.setString(2, customer.getFirstName());
            ps.setString(3, customer.getLastName());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getNic());
            ps.setString(6, customer.getPhoneNumber());
            ps.setString(7, customer.getEmail());
            ps.setString(8, "Not Needed");
            ps.setString(9, customer.getUsername());
            ps.setString(10, customer.getPassword());
            ps.setInt(11, 2);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
