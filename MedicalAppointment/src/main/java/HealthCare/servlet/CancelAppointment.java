package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import HealthCare.objects.AppointmentObject;
import HealthCare.process.Appointment;


public class CancelAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Nhận dữ liệu từ form
        String id = request.getParameter("id");
        int app_id = Integer.parseInt(id);
        AppointmentObject newAppointment = new AppointmentObject();
		Appointment app = new Appointment();
		newAppointment.setApp_id(app_id);
		boolean cancelSuccess = app.cancelAppointment(app_id);
		if (cancelSuccess) {

        	response.sendRedirect("patient-dashboard.jsp?success=true");
        } else {
            
            response.sendRedirect("patient-dashboard.jsp?success=false");
        }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		doGet(request, response);
	}

}
