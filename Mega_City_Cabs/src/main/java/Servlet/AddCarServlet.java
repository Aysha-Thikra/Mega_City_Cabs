package Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Dao.CarDAO;

@WebServlet("/add-car")
public class AddCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String licensePlate = request.getParameter("licensePlate");
        String carName = request.getParameter("carName");
        String description = request.getParameter("description");
        String passengers = request.getParameter("passengers");
        String type = request.getParameter("type");
        String luggages = request.getParameter("luggages");
        String pricePerMinute = request.getParameter("pricePerMinute");

        CarDAO carDAO = new CarDAO();
        boolean isAdded = carDAO.addCar(licensePlate, carName, description, passengers, type, luggages, pricePerMinute);

        if (isAdded) {
            request.setAttribute("success", "Car Added Successfully");
        } else {
            request.setAttribute("error", "Failed to Add Car");
        }

        request.getRequestDispatcher("manage-cars.jsp").forward(request, response);
    }
}
