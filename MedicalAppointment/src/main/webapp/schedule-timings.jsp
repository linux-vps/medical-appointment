<%@page import="HealthCare.process.User"%>
<%@page import="HealthCare.process.Appointment"%>
<%@page import="HealthCare.objects.UserObject"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->

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

	<!-- Select2 CSS -->
	<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

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
	UserObject loggedInUser = (UserObject) session.getAttribute("loggedInUser");
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
					<a href="" class="navbar-brand logo">
						<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
					</a>
				</div>
				<div class="main-menu-wrapper">
					<ul class="main-nav">
						<li>
							<a href="#">Home</a>
						</li>
						<li class="login-link">
							<a href="">Login / Signup</a>
						</li>
					</ul>
				</div>
				<ul class="nav header-navbar-rht">
					

					<%
					//get user information from session
									HttpSession userSession = request.getSession();
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
							<p class="contact-info-header"> <%=loggedInUser.getUser_phone() %></p>
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
								<li class="breadcrumb-item"><a href="">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Schedule Timings</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Schedule Timings</h2>
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
										<h3>Dr. <%=loggedInUser.getUser_fullname() %></h3>

										<div class="patient-details">
											<h5 class="mb-0"><%= loggedInUser.getUser_jobarea() %></h5>
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
										<li>
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
										<li class="active">
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

						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">Schedule Timings</h4>
										<div class="profile-box">
											<div class="row">

												<div class="col-lg-4">
													<div class="form-group">
														<label>Timing Slot Duration</label>
														<select class="select form-control">
															<option>-</option>
															<option>15 mins</option>
															<option selected="selected">30 mins</option>
															<option>45 mins</option>
															<option>1 Hour</option>
														</select>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="card schedule-widget mb-0">

														<!-- Schedule Header -->
														<div class="schedule-header">

															<!-- Schedule Nav -->
															<div class="schedule-nav">
																<ul class="nav nav-tabs nav-justified">
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab"
																			href="#slot_sunday">Sunday</a>
																	</li>
																	<li class="nav-item">
																		<a class="nav-link active" data-toggle="tab"
																			href="#slot_monday">Monday</a>
																	</li>
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab"
																			href="#slot_tuesday">Tuesday</a>
																	</li>
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab"
																			href="#slot_wednesday">Wednesday</a>
																	</li>
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab"
																			href="#slot_thursday">Thursday</a>
																	</li>
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab"
																			href="#slot_friday">Friday</a>
																	</li>
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab"
																			href="#slot_saturday">Saturday</a>
																	</li>
																</ul>
															</div>
															<!-- /Schedule Nav -->

														</div>
														<!-- /Schedule Header -->

														<!-- Schedule Content -->
														<div class="tab-content schedule-cont">

															<!-- Sunday Slot -->
															<div id="slot_sunday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#add_time_slot"><i
																			class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Sunday Slot -->

															<!-- Monday Slot -->
															<div id="slot_monday" class="tab-pane fade show active">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#edit_time_slot"><i
																			class="fa fa-edit mr-1"></i>Edit</a>
																</h4>

																<!-- Slot List -->
																<div class="doc-times">
																	<div class="doc-slot-list">
																		8:00 pm - 11:30 pm
																		<a href="javascript:void(0)"
																			class="delete_schedule">
																			<i class="fa fa-times"></i>
																		</a>
																	</div>
																	<div class="doc-slot-list">
																		11:30 pm - 1:30 pm
																		<a href="javascript:void(0)"
																			class="delete_schedule">
																			<i class="fa fa-times"></i>
																		</a>
																	</div>
																	<div class="doc-slot-list">
																		3:00 pm - 5:00 pm
																		<a href="javascript:void(0)"
																			class="delete_schedule">
																			<i class="fa fa-times"></i>
																		</a>
																	</div>
																	<div class="doc-slot-list">
																		6:00 pm - 11:00 pm
																		<a href="javascript:void(0)"
																			class="delete_schedule">
																			<i class="fa fa-times"></i>
																		</a>
																	</div>
																</div>
																<!-- /Slot List -->

															</div>
															<!-- /Monday Slot -->

															<!-- Tuesday Slot -->
															<div id="slot_tuesday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#add_time_slot"><i
																			class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Tuesday Slot -->

															<!-- Wednesday Slot -->
															<div id="slot_wednesday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#add_time_slot"><i
																			class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Wednesday Slot -->

															<!-- Thursday Slot -->
															<div id="slot_thursday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#add_time_slot"><i
																			class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Thursday Slot -->

															<!-- Friday Slot -->
															<div id="slot_friday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#add_time_slot"><i
																			class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Friday Slot -->

															<!-- Saturday Slot -->
															<div id="slot_saturday" class="tab-pane fade">
																<h4 class="card-title d-flex justify-content-between">
																	<span>Time Slots</span>
																	<a class="edit-link" data-toggle="modal"
																		href="#add_time_slot"><i
																			class="fa fa-plus-circle"></i> Add Slot</a>
																</h4>
																<p class="text-muted mb-0">Not Available</p>
															</div>
															<!-- /Saturday Slot -->

														</div>
														<!-- /Schedule Content -->

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
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

	<!-- Add Time Slot Modal -->
	<div class="modal fade custom-modal" id="add_time_slot">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Time Slots</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="hours-info">
							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="add-more mb-3">
							<a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add
								More</a>
						</div>
						<div class="submit-section text-center">
							<button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Add Time Slot Modal -->

	<!-- Edit Time Slot Modal -->
	<div class="modal fade custom-modal" id="edit_time_slot">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Edit Time Slots</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="hours-info">
							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label>
												<select class="form-control">
													<option>-</option>
													<option selected>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option selected>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option selected>12.30 am</option>
													<option>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option selected>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a
										href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>
							</div>

							<div class="row form-row hours-cont">
								<div class="col-12 col-md-10">
									<div class="row form-row">
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>Start Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option selected>1.00 am</option>
													<option>1.30 am</option>
												</select>
											</div>
										</div>
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label>End Time</label>
												<select class="form-control">
													<option>-</option>
													<option>12.00 am</option>
													<option>12.30 am</option>
													<option>1.00 am</option>
													<option selected>1.30 am</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a
										href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>
							</div>

						</div>

						<div class="add-more mb-3">
							<a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add
								More</a>
						</div>
						<div class="submit-section text-center">
							<button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Edit Time Slot Modal -->

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

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>

</body>

<!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->

</html>