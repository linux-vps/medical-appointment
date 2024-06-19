<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="HealthCare.objects.AppointmentObject"%>
<%@page import="HealthCare.process.Appointment"%>
<%@page import="HealthCare.objects.UserObject"%>
<%@page import="HealthCare.process.User" %>
<!DOCTYPE html>
<html lang="en">
<!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:14 GMT -->
<head>
	<meta charset="utf-8">
	<title>Đan Phượng Hospital</title>
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

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css">

	<link rel="stylesheet" href="assets/plugins/dropzone/dropzone.min.css">

	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/style.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>

<body>
<%//get logged user
	UserObject loggedInUser = (UserObject) session.getAttribute("loggedInUser");
	Appointment a = new Appointment();
	User u = new User();
%>
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
					<a href="" class="navbar-brand logo">
						<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
					</a>
				</div>
				<div class="main-menu-wrapper">
					<div class="menu-header">
						<a href="#" class="menu-logo">
							<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
						</a>
						<a id="menu_close" class="menu-close" href="javascript:void(0);">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<ul class="main-nav">
						<li>
							<a href="#">Home</a>
						</li>
						<li class="has-submenu active">
							<a href="#">Doctors <i class="fas fa-chevron-down"></i></a>
							<ul class="submenu">
								<li class="active"><a href="doctor-dashboard.jsp">Doctor Dashboard</a></li>
								<li><a href="appointments.jsp">Appointments</a></li>
								<li><a href="schedule-timings.jsp">Schedule Timing</a></li>
								<li><a href="">Patients List</a></li>
								<li><a href="">Patients Profile</a></li>
								<li><a href="">Chat</a></li>
								<li><a href="">Invoices</a></li>
								<li><a href="${request.getContextPath()}/DoctorProfile">Profile Settings</a></li>
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
					

					<%//get user information from session
						HttpSession userSession = request.getSession();
						if (loggedInUser == null) {
							response.sendRedirect("sign.jsp");
						%>
						<li class="nav-item">
					        <a class="nav-link header-login" href="sign.jsp">Đăng nhập / Đăng ký</a>
					    </li>
					<% 
						} else {%>
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
									alt="<%= loggedInUser.getUser_fullname()%>">
							</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="<%=loggedInUser.getUser_avatar() %>" alt="User Image"
										class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6><%= loggedInUser.getUser_fullname()%></h6>
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
								<li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
							</ol>
						</nav>
						<h2 class="breadcrumb-title">Profile Settings</h2>
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
										<h3>Dr. <%= loggedInUser.getUser_fullname() %></h3>

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
										<li class="active">
											<a href="">
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
						<form action="DoctorProfile" method="post">
						<!-- Basic Information -->
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Basic Information</h4>
								<div class="row form-row">
									<div class="col-md-12">
										<div class="form-group">
											<div class="change-avatar">
												<div class="profile-img">
													<img src="<%=loggedInUser.getUser_avatar() %>" alt="User Image">
												</div>
												<div class="upload-img">
													<div class="change-photo-btn">
														<span><i class="fa fa-upload"></i> Upload Photo</span>
														<input type="file" class="upload">
													</div>
													<small class="form-text text-muted">Allowed JPG, GIF or PNG. Max
														size of 2MB</small>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Username <span class="text-danger">*</span></label>
											<input type="text" name="username" class="form-control" readonly value="<%= loggedInUser.getUser_name()%>">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Email <span class="text-danger">*</span></label>
											<input type="email" name="email" class="form-control" value="<%=loggedInUser.getUser_email()%>">
										</div>
									</div>
									<% String name[] = loggedInUser.getUser_fullname().split(" ");
									String firstName = "";
									String lastName = "";
									try {
										firstName = name[0] + " "+name[1];
										if (name.length >= 4) {
											lastName = name[2] + " "+name[3];
										} else {
											lastName = name[2];
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
									<div class="col-md-6">
										<div class="form-group">
											<label>First Name <span class="text-danger">*</span></label>
											<input type="text" name="firstname" class="form-control" value="<%= firstName%>">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Last Name <span class="text-danger">*</span></label>
											<input type="text" name="lastname" class="form-control" value="<%= lastName%>">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Phone Number</label>
											<input type="text" name="phone" class="form-control" value="<%= loggedInUser.getUser_phone()%>">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Gender</label>
											<select class="form-control select" name="gender">
												<!--  <option>Select</option>-->
												<option>Male</option>
												<option>Female</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group mb-0">
											<label>Date of Birth</label>
											<input type="text" name="dateofbirth" class="form-control" value="<%= loggedInUser.getUser_birthday()%>">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /Basic Information -->

						<div class="submit-section submit-btn-bottom">
							<button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
						</div></form>

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
										<p> Sở y tế Hà Nội - Bệnh viện đa khoa huyện Đan Phượng<br> Thị Trấn Phùng - Đan Phượng - Hà nội </p>
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
	
	<!-- Update successful modal -->
	<div class="modal" id="successModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update Successful</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Your profile has been successfully updated.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="failModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update Failed</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Error when updating your profile.
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

	<!-- Select2 JS -->
	<script src="assets/plugins/select2/js/select2.min.js"></script>

	<!-- Dropzone JS -->
	<script src="assets/plugins/dropzone/dropzone.min.js"></script>

	<!-- Bootstrap Tagsinput JS -->
	<script src="assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>

	<!-- Profile Settings JS -->
	<script src="assets/js/profile-settings.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>
	
	 <!-- Script to show the modal if the 'updateSuccess' attribute is set -->
    <script>
        <% if (request.getAttribute("updateSuccess") != null){ 
        	if ((boolean) request.getAttribute("updateSuccess")){ %>
            $(document).ready(function () {
                $('#successModal').modal('show');
            });
        <% } else { %>
	        $(document).ready(function () {
	            $('#failModal').modal('show');
	        });
        <%}}%>
        
    </script>

</body>

<!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:15 GMT -->

</html>