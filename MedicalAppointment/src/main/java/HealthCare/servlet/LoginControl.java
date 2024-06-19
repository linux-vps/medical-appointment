package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import HealthCare.objects.UserObject;
import HealthCare.process.User;

public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Nhận dữ liệu từ form
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    // Sử dụng đối tượng User để kiểm tra thông tin đăng nhập
	    User user = new User();
	    UserObject loggedInUser = user.checkLogin(username, password);
	    

	    if (loggedInUser != null) {
	        // Đăng nhập thành công, lưu thông tin người dùng vào Session
	        HttpSession session = request.getSession();
	        session.setAttribute("loggedInUser", loggedInUser);
	        session.setAttribute("loggedInUserId", loggedInUser.getUser_id());
	        
	        //Guild session
//	        public class YourJavaClass {
//
//	            public void yourMethod(HttpServletRequest request) {
//	                // Lấy giá trị user_id từ Session
//	                HttpSession session = request.getSession();
//	                UserObject loggedInUser = (UserObject) session.getAttribute("loggedInUser");
//
//	                if (loggedInUser != null) {
//	                    // Có thể sử dụng loggedInUser.getUser_id() ở đây
//	                    int userId = loggedInUser.getUser_id();
//	                    System.out.println("User ID: " + userId);
//	                }
//	            }
//	        }
	        String role = loggedInUser.getUser_roles();
	        System.out.print(role);
	        if ("p".equals(role)) {
	        	// Chuyển hướng đến trang chính
	        	response.sendRedirect("index.jsp");
	        } else  if ("d".equals(role)) {
	        	response.sendRedirect("doctor-dashboard.jsp");
	        } else if ("a".equals(role)) {
	        	response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
	        }
	        
	        
	    } else {
	        // Đăng nhập thất bại, chuyển hướng đến trang đăng nhập lại hoặc hiển thị thông báo lỗi
	        response.sendRedirect("sign.jsp?error=true");
	    }
	    doGet(request, response);
	}


}
