<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="HealthCare.process.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HealthCare.objects.AppointmentObject"%>
<%@page import="HealthCare.process.Appointment"%>
<%@page import="HealthCare.objects.UserObject"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Vinmec Hospital</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

	<!-- Favicons -->
	<link href="assets/img/favicon.png" rel="icon">

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
<%
//get logged user
	HttpSession userSession = request.getSession();
	UserObject loggedInUser = (UserObject) userSession.getAttribute("loggedInUser");
	Appointment a = new Appointment();
	User u = new User();
%>

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
					<a href="index-2.html" class="navbar-brand logo">
						<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
					</a>
				</div>
				<div class="main-menu-wrapper">
					<ul class="main-nav">
						<li>
							<a href="">Home</a>
						</li>
						<li class="login-link">
							<a href="">Login / Signup</a>
						</li>
					</ul>
				</div>
				<ul class="nav header-navbar-rht">
					

					<%
					//get user information from session
									
									if (loggedInUser == null) {
										response.sendRedirect("sign.jsp");
										
					%>
						<li class="nav-item">
					        <a class="nav-link header-login" href="sign.jsp">Đăng nhập / Đăng ký</a>
					    </li>
					<%
					} else {
					%>
					<li class="nav-item contact-item">
						<div class="header-contact-img">
							<i class="far fa-hospital"></i>
						</div>
						<div class="header-contact-detail">
							<p class="contact-header">Contact</p>
							<p class="contact-info-header"><%=loggedInUser.getUser_phone() %></p>
						</div>
					</li>
						<!-- User Menu -->
					<li class="nav-item dropdown has-arrow logged-item">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img">
								<img class="rounded-circle" src="<%=loggedInUser.getUser_avatar() %>" width="31"
									alt="<%=loggedInUser.getUser_fullname()%>">
							</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="<%=loggedInUser.getUser_avatar() %>" alt="User Image"
										class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6><%=loggedInUser.getUser_fullname()%></h6>
									<p class="text-muted mb-0">Doctor</p>
								</div>
							</div>
							<a class="dropdown-item" href="doctor-dashboard.jsp">Dashboard</a>
							<a class="dropdown-item" href="doctor-profile-settings.jsp">Profile Settings</a>
							<a class="dropdown-item" href="LogoutControl">Logout</a>
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
								<li class="breadcrumb-item active" aria-current="page">Appointments</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Appointments</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- /Breadcrumb -->

		<!-- Page Content -->
		<div class="content">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

						<!-- Profile Sidebar -->
						<div class="profile-sidebar">
							<div class="widget-profile pro-widget-content">
								<div class="profile-info-widget">
									<a href="#" class="booking-doc-img">
										<img src="<%=loggedInUser.getUser_avatar() %>" alt="User Image">
									</a>
									<div class="profile-det-info">
										<h3>Dr. <%=loggedInUser.getUser_fullname()%></h3>

										<div class="patient-details">
											<h5 class="mb-0"><%=loggedInUser.getUser_jobarea()%></h5>
										</div>
									</div>
								</div>
							</div>
							<div class="dashboard-widget">
								<nav class="dashboard-menu">
									<ul>
										<li>
											<a href="doctor-dashboard.jsp">
												<i class="fas fa-columns"></i>
												<span>Dashboard</span>
											</a>
										</li>
										<li class="active">
											<a href="appointments.jsp">
												<i class="fas fa-calendar-check"></i>
												<span>Appointments</span>
											</a>
										</li>
										<li>
											<a href="">
												<i class="fas fa-user-injured"></i>
												<span>My Patients</span>
											</a>
										</li>
										<li>
											<a href="schedule-timings.jsp">
												<i class="fas fa-hourglass-start"></i>
												<span>Schedule Timings</span>
											</a>
										</li>
										<li>
											<a href="">
												<i class="fas fa-star"></i>
												<span>Reviews</span>
											</a>
										</li>
										<li>
											<a href="doctor-profile-settings.jsp">
												<i class="fas fa-user-cog"></i>
												<span>Profile Settings</span>
											</a>
										</li>
										<li>
											<a href="LogoutControl">
												<i class="fas fa-sign-out-alt"></i>
												<span>Logout</span>
											</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- /Profile Sidebar -->

					</div>

					<div class="col-md-7 col-lg-8 col-xl-9">
						<div class="appointments">
						<%
						//get appointment
										ArrayList<AppointmentObject> apps = a.getAppointmentByDoctorId(loggedInUser.getUser_id(), "Scheduled", "is not null ");
										LocalDate today = LocalDate.now();
										DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd, MMM yyyy");
								        
										for (AppointmentObject app : apps) {
											UserObject patient = u.getUserById(app.getUser_id());
											String date = app.getApp_date().formatted(formatter);
						%>

							<!-- Appointment List -->
							<div class="appointment-list">
								<div class="profile-info-widget">
									<a href="patient-profile.html" class="booking-doc-img">
										<img src="<%=patient.getUser_avatar() %>" alt="User Image">
									</a>
									<div class="profile-det-info">
										<h3><a href="patient-profile.html"><%=patient.getUser_fullname()%></a></h3>
										<div class="patient-details">
											<h5><i class="far fa-clock"></i> <%=date%>, <%=app.getApp_time()%></h5>
											<h5><i class="fas fa-map-marker-alt"></i> <%=patient.getUser_address()%></h5>
											<h5><i class="fas fa-envelope"></i> <%=patient.getUser_email()%></h5>
											<h5 class="mb-0"><i class="fas fa-phone"></i><%=patient.getUser_phone()%></h5>
										</div>
									</div>
								</div>
								<div class="appointment-action">
									<a href="" class="btn btn-sm bg-info-light" data-toggle="modal"
										data-target="#appt_details<%=app.getApp_id()%>">
										<i class="far fa-eye"></i> View
									</a>
									<a href="StatusAppointment?id=<%=app.getApp_id()%>&s=1" class="btn btn-sm bg-success-light">
										<i class="fas fa-check"></i> Accept
									</a>
									<a href="StatusAppointment?id=<%=app.getApp_id()%>&s=0" class="btn btn-sm bg-danger-light">
										<i class="fas fa-times"></i> Cancel
									</a>
								</div>
							</div>
							<!-- /Appointment List -->
							<%
							}
							%>
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
<%
//apps modal
for (AppointmentObject app : apps) {
	String date = app.getApp_date().formatted(formatter);
%>
	<!-- Appointment Details Modal -->
	<div class="modal fade custom-modal" id="appt_details<%=app.getApp_id()%>">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Appointment Details</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<ul class="info-details">
						<li>
							<div class="details-header">
								<div class="row">
									<div class="col-md-6">
										<span class="title">#<%=app.getApp_id() %></span>
										<span class="text"><%=date %>, <%=app.getApp_time() %></span>
									</div>
									<div class="col-md-6">
										<div class="text-right">
											<button type="button" class="btn bg-success-light btn-sm"
												id="topup_status">Completed</button>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<span class="title">Status:</span>
							<span class="text"><%=app.getApp_status() %></span>
						</li>
						<li>
							<span class="title">Confirm Date:</span>
							<span class="text"><%=date %></span>
						</li>
						<li>
							<span class="title">Paid Amount</span>
							<span class="text">$450</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /Appointment Details Modal -->
	<%} %>

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

<!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->

</html>