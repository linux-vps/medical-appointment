<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="HealthCare.objects.UserObject" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>
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
					<div class="menu-header">

					</div>
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
							<div class="dashboard-widget">
								<nav class="dashboard-menu">
									<ul>
										<li>
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
										<li class="active">
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
							<div class="card-body">

								<!-- Profile Settings Form -->
								<form action="UpdateUserProfile" method="post">
									<div class="row form-row">
										<div class="col-12 col-md-12">
											<div class="form-group">
												<div class="change-avatar">
													<div class="profile-img">
														<img src="assets/img/patients/patient.jpg" alt="User Image">
													</div>
													<div class="upload-img">
														<div class="change-photo-btn">
															<span><i class="fa fa-upload"></i>Tải ảnh lên</span>
															<input type="file" class="upload">
														</div>
														<small class="form-text text-muted">Allowed JPG, GIF or PNG. Max
															size of 2MB</small>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Username</label>
												<input type="text" class="form-control" value="<%= username %>" name="username" readonly>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Họ tên</label>
												<input type="text" class="form-control" value="<%= fullname %>" name="fullname" require>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Ngày sinh</label>
												<div class="cal-icon">
													<input type="text" class="form-control datetimepicker"
														value="<%= birthday %>" name="birthday" require>
												</div>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Nhóm máu</label>
												<select class="form-control select">
													<option>A-</option>
													<option>A+</option>
													<option>B-</option>
													<option>B+</option>
													<option>AB-</option>
													<option>AB+</option>
													<option>O-</option>
													<option>O+</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Email</label>
												<input type="email" class="form-control" value="<%= email %>" name="email" require>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Số điện thoại</label>
												<input type="text" value="<%= phone %>" class="form-control" name="phone" require>
											</div>
										</div>
										<div class="col-12">
											<div class="form-group">
												<label>Địa Chỉ</label>
												<input type="text" class="form-control" value="<%= address %>" name="address" require>
											</div>
										</div>
									</div>
									<div class="submit-section">
									
										<button type="submit" class="btn btn-primary submit-btn">lưu thay đổi</button>
									</div>
								</form>
								<%
									}
									%>
								<!-- /Profile Settings Form -->

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

	<!-- Select2 JS -->
	<script src="assets/plugins/select2/js/select2.min.js"></script>

	<!-- Datetimepicker JS -->
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

	<!-- Sticky Sidebar JS -->
	<script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
	<script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>

</body>



</html>