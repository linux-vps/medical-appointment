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
			<nav class="navbar navbar-expand-lg header-nav">
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
						<a href="index.jsp" class="menu-logo">
							<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
						</a>
						<a id="menu_close" class="menu-close" href="javascript:void(0);">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<ul class="main-nav">
						<li>
							<a href="index.jsp">Trang chủ</a>
                        </li>
                        <li class="has-submenu">
                            <a href="#">Bác sĩ <i class="fas fa-chevron-down"></i></a>
                            <ul class="submenu">
                                <li><a href="doctor-dashboard.html">Bảng điều khiển của bác sĩ</a></li>
                                <li><a href="appointments.html">Cuộc hẹn</a></li>
                                <li><a href="schedule-timings.html">Thời gian biểu</a></li>
                                <li><a href="my-patients.html">Bệnh nhân của tôi</a></li>
                                <li><a href="patient-profile.html">Hồ sơ bệnh nhân</a></li>
                                <li><a href="chat-doctor.html">Trò chuyện</a></li>
                                <li><a href="invoices.html">Hóa đơn</a></li>
                                <li><a href="doctor-profile-settings.jsp">Cài đặt hồ sơ</a></li>
                                <li><a href="reviews.html">Đánh giá</a></li>
                                <li><a href="doctor-register.html">Đăng ký bác sĩ</a></li>
                            </ul>
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
                        <li>
                            <a href="admin/index.jsp" target="_blank">Quản trị</a>
                        </li>
                        <li class="login-link">
                            <a href="sign.jsp">Đăng nhập / Đăng ký</a>
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
								<li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Booking</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Booking</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->

		<!-- Page Content -->
		<div class="content success-page-cont">
			<div class="container-fluid">

				<div class="row justify-content-center">
					<div class="col-lg-6">
						

					
						<!-- Success Card -->
						<div class="card success-card">
							<div class="card-body">
								<div class="success-cont">
									<i class="fas fa-check"></i>
									<h3>Đặt lịch khám bệnh thành công!</h3>
									<p>Bạn có hẹn với Bác Sĩ <strong><span id="doctorName"></span></strong><br> vào <strong><span id="selectedDate"></span> lúc <span id="selectedTiming"></span></strong></p>
									<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
									<script>
										$(document).ready(function () {
											// Lấy thông tin từ URL
											var queryString = window.location.search;
											var urlParams = new URLSearchParams(queryString);

											// Hiển thị thông tin
											var doctorName = decodeURIComponent(urlParams.get('doctorName'));
											var selectedDate = decodeURIComponent(urlParams.get('selectedDate'));
											var selectedTiming = decodeURIComponent(urlParams.get('selectedTiming'));

											// Hiển thị thông tin trong trang booking-success.jsp
											// Ví dụ: hiển thị thông tin trong các phần tử có id tương ứng
											$('#doctorName').text(doctorName);
											$('#selectedDate').text(selectedDate);
											$('#selectedTiming').text(selectedTiming);
										});
									</script>
									<!-- <a href="invoice-view.html" class="btn btn-primary view-inv-btn">View Invoice</a> -->
								</div>
							</div>
						</div>
						<!-- /Success Card -->

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

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>

</body>


</html>