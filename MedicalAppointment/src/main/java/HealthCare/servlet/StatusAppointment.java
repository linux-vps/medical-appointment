package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import HealthCare.process.Appointment;

public class StatusAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appIdRaw = request.getParameter("id");
		String statusRaw = request.getParameter("s");
		Appointment a = new Appointment();
		try {
			int appId = Integer.parseInt(appIdRaw);
			int statusId = Integer.parseInt(statusRaw);
			if (appId >= 0) {
				if (statusId == 0) {
					a.updateStatus(appId, "Canceled");
					request.setAttribute("updateSuccess", 0);
				} else if (statusId == 1) {
					a.updateStatus(appId, "Confirmed");
					request.setAttribute("updateSuccess", 1);
				}
			}
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		//Forward to jsp
		request.getRequestDispatcher("doctor-dashboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
