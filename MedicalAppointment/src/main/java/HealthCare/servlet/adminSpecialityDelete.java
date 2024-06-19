package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import HealthCare.process.Speciality;


public class adminSpecialityDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public adminSpecialityDelete() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // Đọc thông tin từ request
	    String spIdString = request.getParameter("sp_id_del");
	    int spId = Integer.parseInt(spIdString);
     // Thực hiện cập nhật trong cơ sở dữ liệu
        Speciality sp = new Speciality();
        boolean delResult = sp.deleteSpeciality(spId);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (delResult) {
            // Xoá thành công
            out.println("<script>alert('Xoá thành công'); window.location.href='admin/speciality-list.jsp';</script>");
        } else {
            out.println("<script>alert('Xoá thất bại'); window.location.href='admin/speciality-list.jsp';</script>");
        }
		doGet(request, response);
	}

}
