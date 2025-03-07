package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/GenerateBill")
public class GenerateBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");

        if (bookingId == null || bookingId.isEmpty()) {
            response.sendRedirect("error.jsp?message=Invalid Booking ID");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/MegaCityCabs_db";
        String dbUser = "root";
        String dbPassword = "1234";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String query = "SELECT first_name, last_name, phone, email, card_number, pickup_location, drop_location, pickup_time, route, car_name, fare, driver_name FROM booking WHERE booking_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, bookingId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String customerName = rs.getString("first_name") + " " + rs.getString("last_name");
                String customerPhone = rs.getString("phone");
                String customerEmail = rs.getString("email");
                String cardNumber = rs.getString("card_number");
                String maskedCardNumber = "**** **** **** " + cardNumber.substring(cardNumber.length() - 4);
                String pickupLocation = rs.getString("pickup_location");
                String dropLocation = rs.getString("drop_location");
                String pickupTime = rs.getString("pickup_time");
                String route = rs.getString("route");
                String carName = rs.getString("car_name");
                String fare = rs.getString("fare");
                String driverName = rs.getString("driver_name");

                SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
                String invoiceDate = sdf.format(new Date());

                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=MEGA CIYT CABS - " + customerName + ".pdf");

                Document document = new Document(PageSize.A4);
                PdfWriter.getInstance(document, response.getOutputStream());

                document.open();

                PdfPTable headerTable = new PdfPTable(2);
                headerTable.setWidthPercentage(100);
                headerTable.setSpacingBefore(10f);

                Image logo = Image.getInstance(getServletContext().getRealPath("/images/MCC.png"));
                logo.scaleToFit(100, 100);
                PdfPCell logoCell = new PdfPCell(logo);
                logoCell.setBorder(0);
                logoCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                logoCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                headerTable.addCell(logoCell);

                PdfPCell textCell = new PdfPCell();
                textCell.setBorder(0);
                textCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                textCell.setVerticalAlignment(Element.ALIGN_RIGHT);

                Font headerFont = new Font(Font.FontFamily.HELVETICA, 24, Font.BOLD); // Larger font size
                textCell.addElement(new Paragraph("MEGA CITY CABS", headerFont));
                Font invoiceFont = new Font(Font.FontFamily.HELVETICA, 28, Font.BOLD); // Larger font size
                textCell.addElement(new Paragraph("INVOICE", invoiceFont));

                headerTable.addCell(textCell);

                document.add(headerTable);

                document.add(new Phrase("\n"));

                Font sectionFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14);
                document.add(new Paragraph("FROM:", sectionFont));
                document.add(new Paragraph("MEGA CITY CABS"));
                document.add(new Paragraph("info@megacitycabs.com"));
                document.add(new Paragraph("No.12/A, Duplication Road, Colombo-03"));
                document.add(new Paragraph("011-7677889 "));
                document.add(new Paragraph("\n"));

                document.add(new Paragraph("INVOICE TO:", sectionFont));
                document.add(new Paragraph("Customer Name: " + customerName));
                document.add(new Paragraph("Email: " + customerEmail));
                document.add(new Paragraph("Telephone: " + customerPhone));
                document.add(new Paragraph("Invoice Date: " + invoiceDate));
                document.add(new Paragraph("\n"));

                PdfPTable table = new PdfPTable(2);
                table.setWidthPercentage(100);
                table.setSpacingBefore(10f);
                table.setSpacingAfter(10f);

                PdfPCell cell1 = new PdfPCell(new Phrase("DESCRIPTION"));
                PdfPCell cell2 = new PdfPCell(new Phrase("DETAILS"));

                cell1.setBackgroundColor(new BaseColor(255, 214, 0));
                cell2.setBackgroundColor(new BaseColor(255, 214, 0));

                cell1.setPadding(10f);
                cell2.setPadding(10f);

                table.addCell(cell1);
                table.addCell(cell2);

                table.addCell(createCell("Ride from " + pickupLocation + " to " + dropLocation));
                table.addCell(createCell("Route: " + route));

                table.addCell(createCell("Card Number"));
                table.addCell(createCell(maskedCardNumber));

                table.addCell(createCell("Pickup Location"));
                table.addCell(createCell(pickupLocation));

                table.addCell(createCell("Drop Location"));
                table.addCell(createCell(dropLocation));

                table.addCell(createCell("Pickup Time"));
                table.addCell(createCell(pickupTime));

                table.addCell(createCell("Car Name"));
                table.addCell(createCell(carName));

                table.addCell(createCell("Driver Name"));
                table.addCell(createCell(driverName));

                table.addCell(createCell("TOTAL"));
                table.addCell(createCell("Rs. " + fare));

                document.add(table);

                Font footerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.ITALIC);
                Paragraph footer = new Paragraph("\nTHANK YOU\nMega City Cabs", footerFont);
                footer.setAlignment(Element.ALIGN_CENTER);
                document.add(footer);

                document.close();

            } else {
                response.getWriter().println("No booking found with the given ID.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating bill: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private PdfPCell createCell(String content) {
        PdfPCell cell = new PdfPCell(new Phrase(content));
        cell.setPadding(10f);
        return cell;
    }
}
