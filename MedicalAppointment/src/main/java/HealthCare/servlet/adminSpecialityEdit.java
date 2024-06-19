package HealthCare.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import HealthCare.objects.SpecialityObject;
import HealthCare.process.Speciality;

/**
 * Servlet implementation class adminSpecialityEdit
 */
public class adminSpecialityEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public adminSpecialityEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Đọc thông tin từ request

        String spIdString = request.getParameter("sp_id");
        int spId = Integer.parseInt(spIdString);
        String spName = request.getParameter("sp_name");
        String spDescription = request.getParameter("sp_description");
        
        Date currentDate = new Date(); 
        // Tạo đối tượng SimpleDateFormat để định dạng ngày và giờ 
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String formattedDate = dateFormat.format(currentDate);
        String formattedTime = timeFormat.format(currentDate);
        

        // Tạo một đối tượng SpecialityObject với thông tin mới
        SpecialityObject speciality = new SpecialityObject();
        speciality.setSp_id(spId);
        speciality.setSp_name(spName);
        speciality.setSp_description(spDescription);
        speciality.setSp_modified_date(formattedDate+formattedTime);

        // Thực hiện cập nhật trong cơ sở dữ liệu
        Speciality sp = new Speciality();
        boolean updateResult = sp.updateSpeciality(speciality);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (updateResult) {
            // Cập nhật thành công
            out.println("<script>alert('Cập nhật thành công'); window.location.href='admin/speciality-list.jsp';</script>");
        } else {
            // Cập nhật thất bại
            out.println("<script>alert('Cập nhật thất bại'); window.location.href='admin/speciality-list.jsp';</script>");
        }
        doGet(request, response);
    }

}
