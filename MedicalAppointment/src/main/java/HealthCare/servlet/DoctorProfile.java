package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import HealthCare.objects.UserObject;
import HealthCare.process.User;

public class DoctorProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userFirstName = request.getParameter("firstname");
		String userLastName = request.getParameter("lastname");
		String userFullName = userFirstName + " " + userLastName;
	    String userEmail = request.getParameter("email");
	    String userPhone = request.getParameter("phone");
	    String userBirthday = request.getParameter("dateofbirth");
	    
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("loggedInUserId");
	    User u = new User();
	    
	    UserObject user = u.getUserById(userId);
	    
	    user.setUser_birthday(userBirthday);
	    user.setUser_email(userEmail);
	    user.setUser_fullname(userFullName);
	    user.setUser_phone(userPhone);
	    
	    if (u.updateUser(user)) {
	    	request.setAttribute("updateSuccess", true);
	    	//set session user when update
	    	session.setAttribute("loggedInUser", user);
	    } else {
	    	request.setAttribute("updateSuccess", false);
	    }
	    request.getRequestDispatcher("doctor-profile-settings.jsp").forward(request, response);
	}

}
