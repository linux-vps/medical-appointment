<%@page import="HealthCare.process.User"%>
<%@page import="HealthCare.objects.AppointmentObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HealthCare.process.Appointment"%>
<%@page import="HealthCare.objects.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html lang="en">

<!-- doccure/doctor-dashboard.jsp  30 Nov 2019 04:12:03 GMT -->

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
					<div class="menu-header">
				</div>
					<ul class="main-nav">
						<li>
							<a href="#">Home</a>
						</li>
						<li class="has-submenu active">
							<a href="#">Doctors <i class="fas fa-chevron-down"></i></a>
							<ul class="submenu">
								<li class="active"><a href="DoctorDashboard">Doctor Dashboard</a></li>
								<li><a href="appointments.jsp">Appointments</a></li>
								<li><a href="schedule-timings.jsp">Schedule Timing</a></li>
								<li><a href="">Patients List</a></li>
								<li><a href="">Patients Profile</a></li>
								<li><a href="">Chat</a></li>
								<li><a href="">Invoices</a></li>
								<li><a href="doctor-profile-settings.jsp">Profile Settings</a></li>
								<li><a href="">Reviews</a></li>
								<li><a href="">Doctor Register</a></li>
							</ul>
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
									UserObject loggedInUser = (UserObject) userSession.getAttribute("loggedInUser");
									Appointment a = new Appointment(); //init
									if (loggedInUser == null) {
										response.sendRedirect("sign.jsp");%>
									
<%-- 									<c:if test="${loggedInUser == null }">
									<jsp:forward page="sign.jsp" />
									</c:if>	 --%>
						<li class="nav-item">
					        <a class="nav-link header-login" href="login.jsp">Đăng nhập / Đăng ký</a>
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
								<li class="breadcrumb-item"><a href="">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Dashboard</h2>
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
										<li class="active">
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
										<li>
											<a href="schedule-timings.jsp">
												<i class="fas fa-hourglass-start"></i>
												<span>Schedule Timings</span>
											</a>
										</li>
										<li>
											<a href="">
												<i class="fas fa-star"></i>
												<span>Manager</span>
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
							<div class="col-md-12">
								<div class="card dash-card">
									<div class="card-body">
										<div class="row">
											<div class="col-md-12 col-lg-4">
												<div class="dash-widget dct-border-rht">
													<div class="circle-bar circle-bar1">
														<div class="circle-graph1" data-percent="75">
															<img src="assets/img/icon-01.png" class="img-fluid"
																alt="patient">
														</div>
													</div>
													<%
													//get count 
														LocalDate today = LocalDate.now();
														DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd/MM/YYYY");
												        String formattedDate1 = today.format(formatter1);
												        int total_patient = a.getTotalPatient(loggedInUser.getUser_id());
												        int today_patient = a.getTotalPatientDate(formattedDate1, loggedInUser.getUser_id());
												        int today_appointment = a.getTotalAppointmentDate(formattedDate1, loggedInUser.getUser_id());
													%>
													<div class="dash-widget-info">
														<h6>Total Patient</h6>
														<h3><%=total_patient%></h3>
														<p class="text-muted">Till Today</p>
													</div>
												</div>
											</div>

											<div class="col-md-12 col-lg-4">
												<div class="dash-widget dct-border-rht">
													<div class="circle-bar circle-bar2">
														<div class="circle-graph2" data-percent="50">
															<img src="assets/img/icon-02.png" class="img-fluid"
																alt="Patient">
														</div>
													</div>
													<div class="dash-widget-info">
														<h6>Today Patient</h6>
														<h3><%=today_patient%></h3>
														<p class="text-muted">
														<%
														DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd, MMM yyyy");
												        String formattedDate = today.format(formatter);
													    out.print(formattedDate);
														%>
												        </p>
													</div>
												</div>
											</div>

											<div class="col-md-12 col-lg-4">
												<div class="dash-widget">
													<div class="circle-bar circle-bar3">
														<div class="circle-graph3" data-percent="50">
															<img src="assets/img/icon-03.png" class="img-fluid"
																alt="Patient">
														</div>
													</div>
													<div class="dash-widget-info">
														<h6>Appointments</h6>
														<h3><%=today_appointment%></h3>
														<p class="text-muted"><%=formattedDate%></p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h4 class="mb-4">Patient Appointments</h4>
								<div class="appointment-tab">

									<!-- Appointment Tab -->
									<ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
										<li class="nav-item">
											<a class="nav-link active" href="#upcoming-appointments"
												data-toggle="tab">Upcoming</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#confirmed-appointments" data-toggle="tab">Confirmed</a>
										</li><li class="nav-item">
											<a class="nav-link" href="#today-appointments" data-toggle="tab">Today</a>
										</li>
									</ul>
									<!-- /Appointment Tab -->

									<div class="tab-content">

										<!-- Upcoming Appointment Tab -->
										<div class="tab-pane show active" id="upcoming-appointments">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>Patient Name</th>
																	<th>Appt Date</th>
																	<th>Purpose</th>
																	
																	<th></th>
																</tr>
															</thead>
															<tbody>
															<%
															//get doctor appointments
																int doctorId = loggedInUser.getUser_id();
																
																User u = new User(); //for getting user data from appointment
																ArrayList<AppointmentObject> apps = a.getAppointmentByDoctorId(doctorId, "Scheduled", "is not null");
																for (AppointmentObject app : apps) {
																	UserObject patient = u.getUserById(app.getUser_id());
															%>
																<tr>
																	<td>
																		<h2 class="table-avatar">
																			<a href=""
																				class="avatar avatar-sm mr-2"><img
																					class="avatar-img rounded-circle"
																					src="<%=patient.getUser_avatar() %>"
																					alt="User Image"></a>
																			<a href=""><%=patient.getUser_fullname()%> 
																			<span>#<%=patient.getUser_id()%></span></a>
																		</h2>
																	</td>
																	<td><%=app.getApp_date()%> <span
																			class="d-block text-info"><%=app.getApp_time()%></span>
																	</td>
																	<td><%=app.getApp_notes()%></td>
																	<td class="text-center"></td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href=""
																				class="btn btn-sm bg-info-light" data-toggle="modal"
																				data-target="#appt_details<%=app.getApp_id()%>">
																				<i class="far fa-eye"></i> View
																			</a>

																			<a href="StatusAppointment?id=<%=app.getApp_id()%>&s=1"
																				class="btn btn-sm bg-success-light">
																				<i class="fas fa-check"></i> Accept
																			</a>
																			<a href="StatusAppointment?id=<%=app.getApp_id()%>&s=0"
																				class="btn btn-sm bg-danger-light">
																				<i class="fas fa-times"></i> Cancel
																			</a>
																		</div>
																	</td>
																</tr>
															<%
															}
															%>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Upcoming Appointment Tab -->
										
										<!-- Confirmed Appointment Tab -->
										<div class="tab-pane" id="confirmed-appointments">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>Patient Name</th>
																	<th>Appt Date</th>
																	<th>Purpose</th>
																	<th>Price</th>
																	<th class="text-center"></th>
																	<th></th>
																</tr>
															</thead>
															<tbody>
															<%
															// get confirmed appointment
																DateTimeFormatter sqlFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
													        	String sqlDate = today.format(sqlFormatter);
																ArrayList<AppointmentObject> confirmedApps = a.getAppointmentByDoctorId(doctorId,"Confirmed","is not null");
															for (AppointmentObject app : confirmedApps) {
																UserObject patient = u.getUserById(app.getUser_id());
															%>
																<tr>
																	<td>
																		<h2 class="table-avatar">
																			<a href=""
																				class="avatar avatar-sm mr-2"><img
																					class="avatar-img rounded-circle"
																					src="<%=patient.getUser_avatar() %>"
																					alt="User Image"></a>
																			<a href=""><%=patient.getUser_fullname()%> 
																			<span>#<%=patient.getUser_id()%></span></a>
																		</h2>
																	</td>
																	<td><%=app.getApp_date()%> <span
																			class="d-block text-info"><%=app.getApp_time()%></span>
																	</td>
																	<td><%=app.getApp_notes()%></td>
																	<td class="text-center">$150</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href=""
																				class="btn btn-sm bg-info-light" data-toggle="modal"
																				data-target="#appt_details<%=app.getApp_id()%>">
																				<i class="far fa-eye"></i> View
																			</a>
																		</div>
																	</td>
																</tr>
															<%
															}
															%>

															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Confirmed Appointment Tab -->

										<!-- Today Appointment Tab -->
										<div class="tab-pane" id="today-appointments">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>Patient Name</th>
																	<th>Appt Date</th>
																	<th>Purpose</th>
																	<th>Price</th>
																	<th class="text-center"></th>
																	<th></th>
																</tr>
															</thead>
															<tbody>
															<%
															// get today appointment
																ArrayList<AppointmentObject> todayApps = a.getAppointmentByDoctorId(doctorId,"Confirmed"," = "+sqlDate);
															for (AppointmentObject app : todayApps) {
																UserObject patient = u.getUserById(app.getUser_id());
															%>
																<tr>
																	<td>
																		<h2 class="table-avatar">
																			<a href=""
																				class="avatar avatar-sm mr-2"><img
																					class="avatar-img rounded-circle"
																					src="<%=patient.getUser_avatar() %>"
																					alt="User Image"></a>
																			<a href=""><%=patient.getUser_fullname()%> 
																			<span>#<%=patient.getUser_id()%></span></a>
																		</h2>
																	</td>
																	<td><%=app.getApp_date()%> <span
																			class="d-block text-info"><%=app.getApp_time()%></span>
																	</td>
																	<td><%=app.getApp_notes()%></td>
																	<td class="text-center">$150</td>
																	<td class="text-right">
																		<div class="table-action">
																			<a href=""
																				class="btn btn-sm bg-info-light" data-toggle="modal"
																				data-target="#appt_details<%=app.getApp_id()%>">
																				<i class="far fa-eye"></i> View
																			</a>
																		</div>
																	</td>
																</tr>
															<%
															}
															%>

															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Today Appointment Tab -->

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
									<img src="assets/img/footer-logo.png" alt="logo">
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
							<div class="footer-widget footer-contact">
								<h2 class="footer-title">Liên hệ</h2>
								<div class="footer-contact-info">
									<div class="footer-address">
										<span><i class="fas fa-map-marker-alt"></i></span>
										<p> Sở y tế Hà Nội - Bệnh viện đa khoa huyện Vinmec<br> Thị Trấn Phùng - Vinmec - Hà nội </p>
									</div>
									<p>
										<i class="fas fa-phone-alt"></i>
										0433636050
									</p>
									<p class="mb-0">
										<i class="fas fa-envelope"></i>
										benhviendakhoadanphuong@email.com
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
		apps.addAll(todayApps);
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
												id="topup_status"><%= app.getApp_status() %></button>
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
	
	<!-- Update appointment successful -->
	<!-- Bootstrap Modal -->
    <div class="modal fade custom-modal" id="successAcceptModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Accept Successful</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    The appointment has been successfully accepted.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="successCancelModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cancel Successful</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    The appointment has been successfully canceled.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

	<!-- jQuery -->
	<script src="assets/js/jquery.min.js"></script>
	

	<!-- Bootstrap Core JS -->
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Sticky Sidebar JS -->
	<script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
	<script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

	<!-- Circle Progress JS -->
	<script src="assets/js/circle-progress.min.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>
	
	 <!-- Script to show the modal if the 'updateSuccess' attribute is set -->
    <script>
        <% if (request.getAttribute("updateSuccess") != null ){
        	int i = (int) request.getAttribute("updateSuccess");  
        	if (i == 0) {%>
            $(document).ready(function () {
                $('#successCancelModal').modal('show');
            });
            <%} else if (i == 1) {%>
            $(document).ready(function () {
                $('#successAcceptModal').modal('show');
            });
        <% }} %>
    </script>
    
</body>

<!-- doccure/doctor-dashboard.jsp  30 Nov 2019 04:12:09 GMT -->

</html>