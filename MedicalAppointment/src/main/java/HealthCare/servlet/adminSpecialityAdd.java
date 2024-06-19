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

public class adminSpecialityAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public adminSpecialityAdd() {
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
        String spName = request.getParameter("sp_name_add");
        String spDescription = request.getParameter("sp_des_add");
        
        Date currentDate = new Date(); 
        // Tạo đối tượng SimpleDateFormat để định dạng ngày và giờ 
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String formattedDate = dateFormat.format(currentDate);
        String formattedTime = timeFormat.format(currentDate);
        

        // Tạo một đối tượng SpecialityObject với thông tin mới
        SpecialityObject speciality = new SpecialityObject();
        speciality.setSp_name(spName);
        speciality.setSp_description(spDescription);
        speciality.setSp_created_date(formattedDate+formattedTime);
        speciality.setSp_language("english");

        // Thực hiện cập nhật trong cơ sở dữ liệu
        Speciality sp = new Speciality();
        boolean addResult = sp.addSpeciality(speciality);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (addResult) {
            // Thêm thành công
            out.println("<script>alert('Thêm thành công'); window.location.href='admin/speciality-list.jsp';</script>");
        } else {
            // Thêm thất bại
            out.println("<script>alert('Thêm thất bại'); window.location.href='admin/speciality-list.jsp';</script>");
        }
		doGet(request, response);
	}

}
