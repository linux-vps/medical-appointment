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

/**
 * Servlet implementation class UpdateUserProfile
 */
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession();
        UserObject loggedInUser = (UserObject) session.getAttribute("loggedInUser");

        // Lấy dữ liệu mới từ request
        String newFullName = request.getParameter("fullname");
        String newPhone = request.getParameter("phone");
        String newBirthDay = request.getParameter("birthday");
        String newEmail = request.getParameter("email");
        String newAddress = request.getParameter("address");
        // ... Lấy các trường dữ liệu khác tương tự

        // Cập nhật thông tin người dùng
        loggedInUser.setUser_fullname(newFullName);
        loggedInUser.setUser_phone(newPhone);
        loggedInUser.setUser_birthday(newBirthDay);
        loggedInUser.setUser_email(newEmail);
        loggedInUser.setUser_address(newAddress);
        // ... Cập nhật các trường dữ liệu khác tương tự

        // Gọi phương thức cập nhật thông tin trong cơ sở dữ liệu
        User user = new User();
        boolean updateResult = user.updateUser(loggedInUser);

        if (updateResult) {
            // Cập nhật thông tin người dùng trong session
            session.setAttribute("loggedInUser", loggedInUser);
            // Cập nhật thành công, có thể chuyển hướng hoặc trả về thông báo thành công
            response.sendRedirect("profile-settings.jsp?success=true");
        } else {
            // Cập nhật thất bại, có thể chuyển hướng hoặc trả về thông báo lỗi
            response.sendRedirect("profile-settings.jsp?error=true");
        }
    
		doGet(request, response);
	}

}
