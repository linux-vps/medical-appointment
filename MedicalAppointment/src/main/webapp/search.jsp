<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="HealthCare.objects.UserObject" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="HealthCare.process.User"%>
<%@ page import="HealthCare.objects.SpecialityObject"%>
<%@ page import="HealthCare.process.Speciality"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<%
// Lấy thông tin người dùng từ Session
HttpSession userSession  = request.getSession();
UserObject loggedInUser = (UserObject) userSession .getAttribute("loggedInUser");
if (loggedInUser == null) {
    // Người dùng chưa đăng nhập
	response.sendRedirect("sign.jsp");
}
%>


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

	<!-- Datetimepicker CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

	<!-- Select2 CSS -->
	<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

	<!-- Fancybox CSS -->
	<link rel="stylesheet" href="assets/plugins/fancybox/jquery.fancybox.min.css">

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
					<div class="col-md-8 col-12">
						<nav aria-label="breadcrumb" class="page-breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
								<li class="breadcrumb-item active" aria-current="page">Tìm kiếm bác sĩ</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Kết quả được tìm thấy</h2>
					</div>
					<div class="col-md-4 col-12 d-md-block d-none">
						<div class="sort-by">
							<span class="sort-title">Sắp xếp</span>
							<span class="sortby-fliter">
								<select class="select">
									<option>Lựa chọn</option>
									<option class="sorting">Đánh giá</option>
									<option class="sorting">Phổ biến</option>
									<option class="sorting">Gần đây</option>
									<option class="sorting">Miễn phí</option>
								</select>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->

		<!-- Page Content -->
		<div class="content">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">

						<!-- Search Filter -->
						<div class="card search-filter">
							<div class="card-header">
								<h4 class="card-title mb-0">Lọc</h4>
							</div>
							<div class="card-body">
								<div class="filter-widget">
									<div class="cal-icon">
										<input type="text" class="form-control datetimepicker"
											placeholder="Chọn ngày">
									</div>
								</div>
								<div class="filter-widget">
									<h4>Giới tính</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender_type" >
											<!-- thêm checked nếu muốn được tích -->
											<span class="checkmark"></span> Bác sĩ nam
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="gender_type" >
											<span class="checkmark"></span> Bác sĩ nữ
										</label>
									</div>
								</div>
								<div class="filter-widget">
									<h4>Chuyên ngành</h4>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="select_specialist" >
											<span class="checkmark"></span> Tiết tiệu
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="select_specialist" >
											<span class="checkmark"></span> Thần kinh
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="select_specialist">
											<span class="checkmark"></span> Nha khoa
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="select_specialist">
											<span class="checkmark"></span> Chỉnh hình
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="select_specialist">
											<span class="checkmark"></span> Tim mạch
										</label>
									</div>
									<div>
										<label class="custom_check">
											<input type="checkbox" name="select_specialist">
											<span class="checkmark"></span> Tai mũi họng
										</label>
									</div>
								</div>
								<div class="btn-search">
									<button type="button" class="btn btn-block">Tìm kiếm</button>
								</div>
							</div>
						</div>
						<!-- /Search Filter -->

					</div>

					<div class="col-md-12 col-lg-8 col-xl-9">
							<%
							User doctor = new User();
							UserObject doctorObject = new UserObject();
							List<UserObject> docList = doctor.getUsersByRole("d");
							Speciality sp = new Speciality();
							SpecialityObject searchSP = new SpecialityObject();
							for (UserObject doc : docList) {
							%>
						<!-- Doctor Widget -->
						<div class="card">
							<div class="card-body">

								<div class="doctor-widget" id="doctorWidget" >
									<div class="doc-info-left">
										<div class="doctor-img">
											<a href="doctor-profile.html?id=<%=doc.getUser_id()%>">											
												<img src="<%=doc.getUser_avatar() %>" class="img-fluid"
													alt="User Image">
											</a>
										</div>									
										<span style="display: none;" class = "doctorID"><%=doc.getUser_id() %></span>
										<div class="doc-info-cont">
											<h4 class="doc-name"><a href="doctor-profile.html"><%=doc.getUser_fullname() %></a></h4>
											<p class="doc-speciality"><%=sp.getDoctorSp(doc.getUser_parent_id()) %>
											</p>
											<div class="rating">
												<i class="fas fa-star filled"></i>
												<i class="fas fa-star filled"></i>
												<i class="fas fa-star filled"></i>
												<i class="fas fa-star filled"></i>
												<i class="fas fa-star"></i>
												<span class="d-inline-block average-rating">(<%=doc.getUser_actions() %>)</span>
											</div>
											<div class="clinic-details">
												<p class="doc-location"><i class="fas fa-map-marker-alt"></i><%=doc.getUser_address() %></p>
												<ul class="clinic-gallery">
													<li>
														<a href="assets/img/features/feature-01.jpg"
															data-fancybox="gallery">
															<img src="assets/img/features/feature-01.jpg" alt="Feature">
														</a>
													</li>
													<li>
														<a href="assets/img/features/feature-02.jpg"
															data-fancybox="gallery">
															<img src="assets/img/features/feature-02.jpg" alt="Feature">
														</a>
													</li>
													<li>
														<a href="assets/img/features/feature-03.jpg"
															data-fancybox="gallery">
															<img src="assets/img/features/feature-03.jpg" alt="Feature">
														</a>
													</li>
													<li>
														<a href="assets/img/features/feature-04.jpg"
															data-fancybox="gallery">
															<img src="assets/img/features/feature-04.jpg" alt="Feature">
														</a>
													</li>
												</ul>
											</div>
											<div class="clinic-services">
											</div>
										</div>
									</div>
									<div class="doc-info-right">
										<div class="clini-infos">
											<ul>
												<li><i class="far fa-thumbs-up"></i> 100%</li>
												<li><i class="far fa-comment"></i> <%=doc.getUser_actions() %> Đánh giá</li>
												<li><i class="fas fa-map-marker-alt"></i><%=doc.getUser_jobarea() %></li>
												<li><i class="far fa-money-bill-alt"></i> 30.000 Đồng <i
														class="fas fa-info-circle" data-toggle="tooltip"
														title="Lorem Ipsum"></i> </li>
											</ul>
										</div>
										<div class="clinic-booking">
											<a class="view-pro-btn" href="doctor-profile.html">Xem hồ sơ</a>
											<a class="apt-btn" href="booking.html">Đặt lịch khám bệnh</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /Doctor Widget -->
						<%
						}
						%>
						

						<div class="load-more text-center">
							<a class="btn btn-primary btn-sm" href="javascript:void(0);">Xem thêm</a>
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

	<!-- Select2 JS -->
	<script src="assets/plugins/select2/js/select2.min.js"></script>

	<!-- Datetimepicker JS -->
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

	<!-- Fancybox JS -->
	<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>

</body>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        // Xử lý sự kiện cho mỗi widget
        $('.doctor-widget .apt-btn').on('click', function (e) {
            e.preventDefault();

            // Lấy thông tin từ widget của bác sĩ
            var doctorWidget = $(this).closest('.doctor-widget');
            var doctorName = doctorWidget.find('.doc-name').text();
            var rating = doctorWidget.find('.average-rating').text();
            var address = doctorWidget.find('.doc-location').text();
            var imageSrc = doctorWidget.find('.doctor-img img').attr('src');
            var doctorID = doctorWidget.find('.doctorID').text();

            // Chuyển hướng tới trang booking.html và truyền các thông tin
            var redirectURL = 'booking.html' +
                '?doctorName=' + encodeURIComponent(doctorName) +
                '&rating=' + encodeURIComponent(rating) +
                '&address=' + encodeURIComponent(address) +
                '&imageSrc=' + encodeURIComponent(imageSrc)+
                '&doctorID=' + encodeURIComponent(doctorID);

            window.location.href = redirectURL;
        });
    });
</script>


</html>