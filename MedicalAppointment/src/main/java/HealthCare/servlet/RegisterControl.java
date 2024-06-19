package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import HealthCare.objects.UserObject;
import HealthCare.process.User;
/**
 * Servlet implementation class RegisterControl
 */
public class RegisterControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterControl() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận dữ liệu từ form
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");

        // Kiểm tra mật khẩu nhập lại có khớp không
        if (!password1.equals(password2)) {
            // Mật khẩu không khớp, chuyển hướng đến trang đăng ký lại và hiển thị thông báo lỗi
            response.sendRedirect("sign.jsp?error=password_mismatch");
            return;
        }

        // TODO: Thêm logic kiểm tra tài khoản đã tồn tại trong cơ sở dữ liệu ở đây
        // Bạn có thể sử dụng phương thức của đối tượng User để kiểm tra

        User user = new User();
        boolean isUsernameTaken = user.checkUsernameExists(username);
        boolean isEmailTaken = user.checkEmailExists(email);

        if (isUsernameTaken || isEmailTaken) {
            // Tài khoản hoặc email đã tồn tại, chuyển hướng đến trang đăng ký lại và hiển thị thông báo lỗi
            response.sendRedirect("sign.jsp?error=username_email_taken");
            return;
        }

        // Đăng ký thành công, thêm người dùng vào cơ sở dữ liệu
        boolean registrationSuccess = user.registerUser(username, password1, email);

        if (registrationSuccess) {
            // Chuyển hướng đến trang đăng nhập với thông báo đăng ký thành công
            response.sendRedirect("sign.jsp?registration_success=true");
        } else {
            // Đăng ký thất bại, chuyển hướng đến trang đăng ký lại và hiển thị thông báo lỗi
            response.sendRedirect("sign.jsp?error=registration_failure");
        }
    }

}
