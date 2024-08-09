<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="HealthCare.objects.UserObject" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
							response.sendRedirect("sign.jsp");
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
								<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Checkout</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Checkout</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->

		<!-- Page Content -->
		<div class="content">
			<div class="container">

				<div class="row">
					<div class="col-md-7 col-lg-8">
						<div class="card">
							<div class="card-body">
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
							    int userID = loggedInUser.getUser_id();
							    
					
							%>
								<!-- Checkout Form -->
								<form action="BookAppointment" method="post">
								<%
								// Lấy giá trị của các tham số từ URL
								String doctorName = request.getParameter("doctorName");
								String selectedTiming = request.getParameter("selectedTiming");
								String selectedDate = request.getParameter("selectedDate");
								String doctorImageSrc = request.getParameter("doctorImageSrc");
								String doctorIDString = request.getParameter("doctorID");
								
								%>
									<input type="hidden" name="doctorNameHidden" value="<%=doctorName %>" style="display: none;">
									<input type="hidden" name="selectedTimingHidden" value="<%=selectedTiming %>" style="display: none;">
									<input type="hidden" name="selectedDateHidden" value="<%=selectedDate %>" style="display: none;">
									<input type="hidden" name="doctorImageSrcHidden" value="<%=doctorImageSrc %>" style="display: none;">
									<input type="hidden" name="userID" value="<%=userID %>" style="display: none;">
									<input type="hidden" name="doctorID" value="<%=doctorIDString %>" style="display: none;">
									
									<!-- Personal Information -->
									<div class="info-widget" id="personalInfo">
										<h4 class="card-title">Thông tin cá nhân</h4>
										<div class="row">
											<div class="col-md-6 col-sm-12">
												<div class="form-group card-label">
													<label>Họ tên</label>
													<input class="form-control" type="text" required value="<%= fullname %>" name="fullname">
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group card-label">
													<label>Địa chỉ</label>
													<input class="form-control" type="text" required value="<%= address %>" name="address">
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group card-label">
													<label>Email</label>
													<input class="form-control" type="email" value="<%= email %>" name="email">
												</div>
											</div>
											<div class="col-md-6 col-sm-12">
												<div class="form-group card-label">
													<label>Phone</label>
													<input class="form-control" type="text" required value="<%= phone %>" name="phone">
												</div>
											</div>
										</div>
										<div class="exist-customer">Bạn đã có tài khoản? <a href="sign.jsp">Click vào đây
											 để đăng nhập</a></div>
									</div>
									
									<!-- /Personal Information -->
									
									<div class="payment-widget">
										<h4 class="card-title">Thông tin đặt khám</h4>

										<!-- Lần đầu khám -->
										<div class="payment-list">
											<label class="payment-radio credit-card-option">
												
												<span class="checkmark"></span>
	
											</label>
											<div class="row">

												<div class="col-md-12">
													<div class="form-group card-label">
														<label for="card_name">Ghi chú</label>
														<input class="form-control" id="notes" type="text" name="notes">
													</div>
												</div>
											
											</div>
										</div>
										<!-- /Lần đầu khám -->

										<!-- Terms Accept -->
										<div class="terms-accept">
											<div class="custom-checkbox">
												<!-- <input type="checkbox" id="terms_accept"> -->
												<label for="terms_accept">Phí hẹn khám sẽ được thu sau khi khám bệnh, vui lòng đến đúng giờ, vắng khi đến lượt quá 5 phút bệnh nhân sẽ được xếp xuống cuối hàng đợi</label>
											</div>
										</div>
										<!-- /Terms Accept -->

										<!-- Submit Section -->
										
										<!-- <div class="submit-section mt-4">
											<button type="submit" id="confirmAppointmentBtn" class="btn btn-primary submit-btn">Xác nhận hẹn khám</button>
										</div> -->
										<%
										}
										%>
										<div class="submit-section proceed-btn text-left">
											
											<button type="submit" class="btn btn-primary submit-btn">Xác nhận hẹn khám</button>
										</div>
										
										
										<!-- /Submit Section -->

									</div>
								</form>
								<!-- /Checkout Form -->

							</div>
						</div>

					</div>
<!-- Thêm mã JavaScript và jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
  $(document).ready(function () {
    // Function để lấy giá trị của tham số từ URL
    function getParameterByName(name, url) {
      if (!url) url = window.location.href;
      name = name.replace(/[\[\]]/g, "\\$&");
      var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
          results = regex.exec(url);
      if (!results) return null;
      if (!results[2]) return '';
      return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    // Lấy giá trị của các tham số từ URL
    var doctorName = getParameterByName('doctorName');
    var doctorRating = getParameterByName('doctorRating');
    var doctorLocation = getParameterByName('doctorLocation');
    var selectedTiming = getParameterByName('selectedTiming');
    var selectedDate = getParameterByName('selectedDate');
	var doctorImageSrc = getParameterByName('doctorImageSrc');
	var doctorID = getParameterByName('doctorID');

    // Hiển thị thông tin lên trang
    $('#doctorName').text(doctorName);
    $('#doctorRating').text(doctorRating);
    $('#doctorLocation').text(doctorLocation);
    $('#selectedTiming').text(selectedTiming);
    $('#selectedDate').text(selectedDate);
	$('#doctorImageSrc').attr('src', doctorImageSrc);
	$('#doctorID').text(doctorID);
  });
</script>
<!-- Kết thúc mã JavaScript và jQuery -->
					<div class="col-md-5 col-lg-4 theiaStickySidebar">

						<!-- Booking Summary -->
						<div class="card booking-card">
							<div class="card-header">
								<h4 class="card-title">Tóm tắt lịch hẹn</h4>
							</div>
							<div class="card-body">

								<!-- Booking Doctor Info -->
								<div class="booking-doc-info" id="doctorInfo">
									<a href="doctor-profile.html" class="booking-doc-img">
										<!-- <img src="assets/img/doctors/doctor-thumb-02.jpg" alt="User Image"> -->
										<img id="doctorImageSrc" alt="Doctor Image">
									</a>
									<div class="booking-info">
										<h4><a href="doctor-profile.html"><span id="doctorName"></span></a></h4>
										<div class="rating">
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star filled"></i>
											<i class="fas fa-star"></i>
											<span class="d-inline-block average-rating"><span id="doctorRating"></span></span>
										</div>
										<div class="clinic-details">
											<p class="doc-location"><i class="fas fa-map-marker-alt"></i>
												<span id="doctorLocation"></span>
											</p>
										</div>
									</div>
								</div>
								<!-- Booking Doctor Info -->

								<div class="booking-summary">
									<div class="booking-item-wrap">
										<ul class="booking-date">
											<li>Date <span id="selectedDate"></span></li>
											<li>Time <span id="selectedTiming"></span></li>
										</ul>
										<ul class="booking-fee">
											<li>Phí chung <span>10.000 Đồng</span></li>
											<li>Phí đặt lịch <span>30.000 Đồng</span></li>
											<li>Phí dịch vụ <span>10.000 Đồng</span></li>
										</ul>
										<div class="booking-total">
											<ul class="booking-total-list">
												<li>
													<span>Tổng</span>
													<span class="total-cost">50.000 Đồng</span>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /Booking Summary -->

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


</html>