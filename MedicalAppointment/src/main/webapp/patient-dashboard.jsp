<%@page import="HealthCare.process.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="HealthCare.objects.UserObject" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="HealthCare.objects.AppointmentObject"%>
<%@ page import="HealthCare.process.Appointment"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="vi">



<head>

	<meta charset="utf-8">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<title>Bệnh Viện Đa Khoa Vinmec</title>

	<!-- Favicons -->
	<link type="image/x-icon" href="assets/img/favicon-32x32.png" rel="icon">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">

	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/style.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
	<!-- Thêm thư viện Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	

</head>

<body>

	<!-- Main Wrapper -->
	<div class="main-wrapper">

		<!-- Header -->
		<header class="header">
			<nav class="navbar ">
				<div class="navbar-header">
					<a id="mobile_btn" href="javascript:void(0);">
						<span class="bar-icon">
							<span></span>
							<span></span>
							<span></span>
						</span>
					</a>
					<a href="index.jsp" class="navbar-brand logo">
						<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
					</a>
				</div>
				<div class="main-menu-wrapper">
					

				
					<ul class="main-nav">
						<li>
							<a href="index.jsp">Trang chủ</a>
                        </li>
                        
                        <li class="has-submenu">
                            <a href="#">Bệnh nhân <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li><a href="search.jsp">Tìm kiếm bác sĩ</a></li>
                                <li><a href="doctor-profile.html">Hồ sơ bác sĩ</a></li>
                                <li><a href="booking.html">Đặt lịch</a></li>
                                <li><a href="checkout.jsp">Thanh toán</a></li>
                                <li><a href="booking-success.jsp">Đặt lịch thành công</a></li>
                                <li><a href="patient-dashboard.jsp">Bảng điều khiển của bệnh nhân</a></li>
                                <li><a href="favourites.html">Yêu thích</a></li>
                                <li><a href="chat.html">Trò chuyện</a></li>
                                <li><a href="profile-settings.jsp">Cài đặt hồ sơ</a></li>
                                <li><a href="change-password.html">Đổi mật khẩu</a></li>
                            </ul>
                        </li>
					</ul>
					</div>
					<ul class="nav header-navbar-rht">
						<li class="nav-item contact-item">
							<div class="header-contact-img">
								<i class="far fa-hospital"></i>
							</div>
							<div class="header-contact-detail">
								<p class="contact-header">Liên hệ</p>
								<p class="contact-info-header"> 0433636050</p>
						</div>
					</li>

						<%
						// Lấy thông tin người dùng từ Session
						HttpSession userSession  = request.getSession();
						UserObject loggedInUser = (UserObject) userSession .getAttribute("loggedInUser");
						
						// Kiểm tra xem người dùng đã đăng nhập hay chưa
						if (loggedInUser == null) {
						    // Người dùng chưa đăng nhập
						    response.sendRedirect("sign.jsp");
						%>
							
						    <li class="nav-item">
						        <a class="nav-link header-login" href="sign.jsp">Đăng nhập / Đăng ký</a>
						    </li>
						<%
						} else {
						    // Người dùng đã đăng nhập
						%>
						    <!-- User Menu -->
						    <li class="nav-item dropdown has-arrow logged-item">
						        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
						            <span class="user-img">
						                <img class="rounded-circle" src="assets/img/patients/patient.jpg" width="31" alt="<%= loggedInUser.getUser_fullname() %>">
						            </span>
						        </a>
						        <div class="dropdown-menu dropdown-menu-right">
						            <div class="user-header">
						                <div class="avatar avatar-sm">
						                    <img src="assets/img/patients/patient.jpg" alt="User Image" class="avatar-img rounded-circle">
						                </div>
						                <div class="user-text">
						                    <h6><%= loggedInUser.getUser_fullname() %></h6>
						                    <p class="text-muted mb-0">Bệnh nhân</p>
						                </div>
						            </div>
						            <a class="dropdown-item" href="patient-dashboard.jsp">Dashboard</a>
						            <a class="dropdown-item" href="profile-settings.jsp">Cài đặt hồ sơ</a>
						            <a class="dropdown-item" href="LogoutControl">Đăng xuất</a>
						        </div>
						    </li>
						    <!-- /User Menu -->
							<%
							}
							%>

				</ul>
			</nav>
		</header>
		<!-- /Header -->

		<!-- Breadcrumb -->
		<div class="breadcrumb-bar">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="col-md-12 col-12">
						<nav aria-label="breadcrumb" class="page-breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
								<li class="breadcrumb-item active" aria-current="page">Cài đặt hồ sơ</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Cài đặt hồ sơ</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->
		<%
		// Lấy thông tin người dùng từ session
		//UserObject loggedInUser = (UserObject) session.getAttribute("loggedInUser");
		
		// Kiểm tra xem người dùng có tồn tại hay không
		if (loggedInUser != null) {
		    // Lấy các thuộc tính của người dùng
		    String username = loggedInUser.getUser_name();
		    String fullname = loggedInUser.getUser_fullname();
		    String birthday = loggedInUser.getUser_birthday();
		    String email = loggedInUser.getUser_email();
		    String phone = loggedInUser.getUser_phone();
		    String address = loggedInUser.getUser_address();

		%>
		<!-- Page Content -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">

					<!-- Profile Sidebar -->
					<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
						<div class="profile-sidebar">
							<div class="widget-profile pro-widget-content">
								<div class="profile-info-widget">
									<a href="#" class="booking-doc-img">
										<img src="assets/img/patients/patient.jpg" alt="User Image">
									</a>
									<div class="profile-det-info">
										<h3><%= fullname %></h3>
										<div class="patient-details">
											<h5><i class="fas fa-birthday-cake"></i> <%= birthday %></h5>
											<h5 class="mb-0"><i class="fas fa-map-marker-alt"></i><%= address %></h5>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
							<div class="dashboard-widget">
								<nav class="dashboard-menu">
									<ul>
										<li class="active">
											<a href="#">
												<i class="fas fa-columns"></i>
												<span>Dashboard</span>
											</a>
										</li>
										<li>
											<a href="favourites.html">
												<i class="fas fa-bookmark"></i>
												<span>Yêu thích</span>
											</a>
										</li>
										<li>
											<a href="chat.html">
												<i class="fas fa-comments"></i>
												<span>Tin nhắn</span>
												<small class="unread-msg">23</small>
											</a>
										</li>
										<li>
											<a href="profile-settings.jsp">
												<i class="fas fa-user-cog"></i>
												<span>Cài đặt hồ sơ</span>
											</a>
										</li>
										<li>
											<a href="change-password.html">
												<i class="fas fa-lock"></i>
												<span>Đổi mật khẩu</span>
											</a>
										</li>
										<li>
											<a href="index.jsp">
												<i class="fas fa-sign-out-alt"></i>
												<span>Đăng xuất</span>
											</a>
										</li>
									</ul>
								</nav>
							</div>

						</div>
					</div>
					<!-- /Profile Sidebar -->
					
					<div class="col-md-7 col-lg-8 col-xl-9">
						<div class="card">
							<div class="card-body pt-0">

								<!-- Tab Menu -->
								<nav class="user-tabs mb-4">
									<ul class="nav nav-tabs nav-tabs-bottom nav-justified">
										<li class="nav-item">
											<a class="nav-link active" href="#pat_appointments"
												data-toggle="tab">Các lịch hẹn</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#pat_prescriptions"
												data-toggle="tab">Biểu đồ</a>
										</li>
									</ul>
								</nav>
								<!-- /Tab Menu -->

								<!-- Tab Content -->
								<div class="tab-content pt-0">
																		<!-- Appointment Tab -->
									<div id="pat_appointments" class="tab-pane fade show active">
										<div class="card card-table mb-0">
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-hover table-center mb-0">
														<thead>
															<tr>
																<th>Bác sĩ</th>
																<th>Ngày hẹn khám</th>
																<th>Ngày đặt lịch</th>
																<th>Phí</th>
																<th>Cập nhật</th>
																<th>Trạng thái</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
														<%
															
															int userId = loggedInUser.getUser_id();
															//AppointmentObject newapm = new AppointmentObject();
															Appointment apm = new Appointment();
															User u = new User();
															List<AppointmentObject> dsdatlich = apm.getAppointmentsByUserId(userId);
														%>
														<% 
													           for (AppointmentObject appointment : dsdatlich) { 
													           UserObject doctor = u.getUserById(appointment.getDoctor_id());%>
													            <tr>
													                <td>
													                    <h2 class="table-avatar">
													                        <a href="doctor-profile.html" class="avatar avatar-sm mr-2">
													                            <img class="avatar-img rounded-circle" src="<%=doctor.getUser_avatar() %>" alt="User Image">
													                        </a>
													                        <a href="doctor-profile.html"><%= doctor.getUser_fullname() %>
													                            </a>
													                    </h2>
													                </td>
													                <td><%= appointment.getApp_date() %> <span class="d-block text-info"><%= appointment.getApp_time() %></span></td>
													                <td><%= appointment.getApp_date() %></td>
																<td>50.000 Đồng</td>
																<td><%= appointment.getApp_modified_date() %></td>
																<td><span
																		class="badge badge-pill bg-success-light"><%= appointment.getApp_status() %></span>
																</td>
																<td class="text-right">
																	<div class="table-action">																	
																		<a href="CancelAppointment?id=<%=appointment.getApp_id()%>"
																			class="btn btn-sm bg-primary-light">
																			<i class="fas close"></i> Huỷ
																		</a>		
																														
																	</div>
																</td>
															</tr>
													            </tr>
													        <% } %>
													        </tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<!-- Prescription Tab -->
									<div class="tab-pane fade" id="pat_prescriptions">
										<div class="card card-table mb-0">
											<div class="card-body">
												<div class="table-responsive">
													<div style="width: 80%; margin: auto;">
    <canvas id="barChart"></canvas>
</div>

<script>
    // Kết nối đến cơ sở dữ liệu và lấy dữ liệu cuộc hẹn
   
    var statusCounts = <%= apm.getAppointmentStatusCountByUserId(userId) %>;
   

    // Biểu đồ cột
var data = {
    labels: ["Đã xác nhận", "Đã hẹn", "Đã hủy", "Đã hoàn thành"], // Thêm "Đã hoàn thành" vào labels
    datasets: [{
        label: 'Số lượng cuộc hẹn',
        data: statusCounts,
        backgroundColor: [
            'rgba(75, 192, 192, 0.2)',
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(54, 162, 235, 0.2)' 
        ],
        borderColor: [
            'rgba(75, 192, 192, 1)',
            'rgba(255, 99, 132, 1)',
            'rgba(255, 205, 86, 1)',
            'rgba(54, 162, 235, 1)'
        ],
        borderWidth: 1
    }]
};

    var options = {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    };

    var ctx = document.getElementById('barChart').getContext('2d');
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
</script>
												</div>
											</div>
										</div>
									</div>
									<!-- /Prescription Tab -->
									</div>
								<!-- Tab Content -->

							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /Page Content -->
		<!-- Footer -->
		<footer class="footer">

			<!-- Footer Top -->
			<div class="footer-top">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-md-6">

							<!-- Footer Widget -->
							<div class="footer-widget footer-about">
								<div class="footer-logo">
									<img src="assets/img/logo.png" alt="logo">
								</div>
								<div class="footer-about-content">
									<p>Hệ thống web site đặt lịch khám bệnh trực tuyến </p>
									<div class="social-icon">
										<ul>
											<li>
												<a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
											</li>
											<li>
												<a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
											</li>
											<li>
												<a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
											</li>
											<li>
												<a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
											</li>
											<li>
												<a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /Footer Widget -->

						</div>

						<div class="col-lg-3 col-md-6">

							<!-- Footer Widget -->
							<div class="footer-widget footer-menu">
								<h2 class="footer-title">Dành cho bệnh nhân</h2>
								<ul>
									<li><a href="search.jsp"><i class="fas fa-angle-double-right"></i> Tìm kiếm bác sĩ</a></li>
									<li><a href="sign.jsp"><i class="fas fa-angle-double-right"></i> Đăng nhập</a></li>
									<li><a href="register.html"><i class="fas fa-angle-double-right"></i> Đăng kí</a>
									</li>
									<li><a href="booking.html"><i class="fas fa-angle-double-right"></i> Đặt lịch</a>
									</li>
									<li><a href="patient-dashboard.jsp"><i class="fas fa-angle-double-right"></i>
											Bảng kiểm soát lịch hẹn</a></li>
								</ul>
							</div>
							<!-- /Footer Widget -->

						</div>

						<div class="col-lg-3 col-md-6">

							<!-- Footer Widget -->
							<div class="footer-widget footer-menu">
								<h2 class="footer-title">Bác sĩ</h2>
								<ul>
									<li><a href="appointments.html"><i class="fas fa-angle-double-right"></i>
											Kiểm tra cuộc hẹn</a></li>
									<li><a href="chat.html"><i class="fas fa-angle-double-right"></i> Chat</a></li>
									<li><a href="sign.jsp"><i class="fas fa-angle-double-right"></i> Đăng nhập</a></li>
									<li><a href="doctor-register.html"><i class="fas fa-angle-double-right"></i>
											Đăng kí</a></li>
									<li><a href="doctor-dashboard.html"><i class="fas fa-angle-double-right"></i>Dashboard của bác sĩ</a></li>
								</ul>
							</div>
							<!-- /Footer Widget -->

						</div>

						<div class="col-lg-3 col-md-6">

							<!-- Footer Widget -->
							<div class="footer-widget footer-contact">
								<h2 class="footer-title">Liên hệ</h2>
								<div class="footer-contact-info">
									<div class="footer-address">
										<span><i class="fas fa-map-marker-alt"></i></span>
										<p> Sở y tế Hà Nội - Bệnh viện đa khoa quốc tế Vinmec<br> 458 Minh Khai, Q. Hai Bà Trưng, Hà Nội </p>
									</div>
									<p>
										<i class="fas fa-phone-alt"></i>
										0433636050
									</p>
									<p class="mb-0">
										<i class="fas fa-envelope"></i>
										benhviendakhoaquoctevinmec@email.com
									</p>
								</div>
							</div>
							<!-- /Footer Widget -->

						</div>

					</div>
				</div>
			</div>
			<!-- /Footer Top -->

			<!-- Footer Bottom -->
			<div class="footer-bottom">
				<div class="container-fluid">

					<!-- Copyright -->
					<div class="copyright">
						<div class="row">
							<div class="col-md-6 col-lg-6">
								<div class="copyright-text">
									<p class="mb-0"><a href="https://datlichjkhambenhviendanphuong.com"></a></p>
								</div>
							</div>
							<div class="col-md-6 col-lg-6">

								<!-- Copyright Menu -->
								<div class="copyright-menu">
									<ul class="policy-menu">
										<li><a href="#">Terms and Conditions</a></li>
										<li><a href="#">Policy</a></li>
									</ul>
								</div>
								<!-- /Copyright Menu -->

							</div>
						</div>
					</div>
					<!-- /Copyright -->

				</div>
			</div>
			<!-- /Footer Bottom -->

		</footer>
		<!-- /Footer -->
		</div>
	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="assets/js/jquery.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Sticky Sidebar JS -->
	<script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
	<script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>

</body>

<!-- doccure/patient-dashboard.jsp  30 Nov 2019 04:12:16 GMT -->

</html>

														