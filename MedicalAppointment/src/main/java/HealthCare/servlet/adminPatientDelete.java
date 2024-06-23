package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import HealthCare.process.User;

/**
 * Servlet implementation class adminDeletePatient
 */
public class adminPatientDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminPatientDelete() {
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
		 // Đọc thông tin từ request
	    String spIdString = request.getParameter("sp_id_del");
	    int spId = Integer.parseInt(spIdString);
     // Thực hiện cập nhật trong cơ sở dữ liệu
        User sp = new User();
        boolean delResult = sp.deleteUser(spId);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (delResult) {
            // Xoá thành công
            out.println("<script>alert('Xoá thành công'); window.location.href='admin/patient-list.jsp';</script>");
        } else {
            out.println("<script>alert('Xoá thất bại'); window.location.href='admin/patient-list.jsp';</script>");
        }
		doGet(request, response);
	}

}
