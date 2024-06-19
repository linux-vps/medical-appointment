<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collections"%>
<%@page import="HealthCare.objects.AppointmentObject"%>
<%@page import="HealthCare.process.Speciality"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HealthCare.process.Appointment"%>
<%@page import="HealthCare.process.User"%>
<%@page import="HealthCare.objects.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:20 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Bệnh viện đa khoa Đan Phượng</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
		
		<link rel="stylesheet" href="assets/plugins/morris/morris.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
            <div class="header">
			
				<!-- Logo -->
                <div class="header-left">
                    <a href="" class="logo">
						<img src="assets/img/logo.png" alt="Logo">
					</a>
					<a href="" class="logo logo-small">
						<img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
					</a>
                </div>
				<!-- /Logo -->
				
				<a href="javascript:void(0);" id="toggle_btn">
					<i class="fe fe-text-align-left"></i>
				</a>
				
				<div class="top-nav-search">
					<form>
						<input type="text" class="form-control" placeholder="Search here">
						<button class="btn" type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
				
				<!-- Mobile Menu Toggle -->
				<a class="mobile_btn" id="mobile_btn">
					<i class="fa fa-bars"></i>
				</a>
				<!-- /Mobile Menu Toggle -->
				
				<!-- Header Right Menu -->
				<ul class="nav user-menu">

					<!-- Notifications -->
					<li class="nav-item dropdown noti-dropdown">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="fe fe-bell"></i> <span class="badge badge-pill">3</span>
						</a>
						<div class="dropdown-menu notifications">
							<div class="topnav-dropdown-header">
								<span class="notification-title">Notifications</span>
								<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
							</div>
							<div class="noti-content">
								<ul class="notification-list">
								<!-- Notification list start -->
									<li class="notification-message">
										<a href="#">
											<div class="media">
												<span class="avatar avatar-sm">
													<img class="avatar-img rounded-circle" alt="User Image" src="assets/img/doctors/doctor-thumb-01.jpg">
												</span>
												<div class="media-body">
													<p class="noti-details"><span class="noti-title">Dr. Ruby Perrin</span> Schedule <span class="noti-title">her appointment</span></p>
													<p class="noti-time"><span class="notification-time">4 mins ago</span></p>
												</div>
											</div>
										</a>
									</li>
									<!-- Notification list end -->
								</ul>
							</div>
							<div class="topnav-dropdown-footer">
								<a href="#">View all Notifications</a>
							</div>
						</div>
					</li>
					<!-- /Notifications -->
					
					<%//get loggedin administrator
						HttpSession userSession = request.getSession();
						UserObject loggedInUser = (UserObject) userSession .getAttribute("loggedInUser");
						if (loggedInUser != null) {
							
					%>
					<!-- User Menu -->
					<li class="nav-item dropdown has-arrow">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="<%=loggedInUser.getUser_fullname()%>"></span>
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6><%=loggedInUser.getUser_fullname() %></h6>
									<p class="text-muted mb-0">Administrator</p>
								</div>
							</div>
							<a class="dropdown-item" href="">My Profile</a>
							<a class="dropdown-item" href="">Settings</a>
							<a class="dropdown-item" href="../LogoutControl">Logout</a>
						</div>
					</li>
					<!-- /User Menu -->
					<%} else {response.sendRedirect("../sign.jsp");%>
						<li class="nav-item">
						   <a class="nav-link header-login" href="../sign.jsp">Đăng nhập / Đăng ký</a>
						</li>
					<%} %>
					
				</ul>
				<!-- /Header Right Menu -->
				
            </div>
			<!-- /Header -->
			
			<!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
					<div id="sidebar-menu" class="sidebar-menu">
						<ul>
							<li class="menu-title"> 
								<span>Main</span>
							</li>
							<li class="active"> 
								<a href="index.jsp"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li> 
								<a href="appointment-list.jsp"><i class="fe fe-layout"></i> <span>Appointments</span></a>
							</li>
							<li> 
								<a href="speciality-list.jsp"><i class="fe fe-users"></i> <span>Specialities</span></a>
							</li>
							<li> 
								<a href="doctor-list.jsp"><i class="fe fe-user-plus"></i> <span>Doctors</span></a>
							</li>
							<li> 
								<a href="patient-list.jsp"><i class="fe fe-user"></i> <span>Patients</span></a>
							</li>
							<li> 
								<a href=""><i class="fe fe-star-o"></i> <span>Reviews</span></a>
							</li>
							<li> 
								<a href=""><i class="fe fe-activity"></i> <span>Transactions</span></a>
							</li>
							<li> 
								<a href=""><i class="fe fe-vector"></i> <span>Settings</span></a>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-document"></i> <span> Reports</span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="">Invoice Reports</a></li>
								</ul>
							</li>
							<li class="menu-title"> 
								<span>Pages</span>
							</li>
							<li> 
								<a href=""><i class="fe fe-user-plus"></i> <span>Profile</span></a>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-document"></i> <span> Authentication </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="login.html"> Login </a></li>
									<li><a href="register.html"> Register </a></li>
									<li><a href="forgot-password.html"> Forgot Password </a></li>
									<li><a href="lock-screen.html"> Lock Screen </a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-warning"></i> <span> Error Pages </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="error-404.html">404 Error </a></li>
									<li><a href="error-500.html">500 Error </a></li>
								</ul>
							</li>
							<li> 
								<a href="blank-page.html"><i class="fe fe-file"></i> <span>Blank Page</span></a>
							</li>
							<li class="menu-title"> 
								<span>UI Interface</span>
							</li>
							<li> 
								<a href="components.html"><i class="fe fe-vector"></i> <span>Components</span></a>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-layout"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="form-basic-inputs.html">Basic Inputs </a></li>
									<li><a href="form-input-groups.html">Input Groups </a></li>
									<li><a href="form-horizontal.html">Horizontal Form </a></li>
									<li><a href="form-vertical.html"> Vertical Form </a></li>
									<li><a href="form-mask.html"> Form Mask </a></li>
									<li><a href="form-validation.html"> Form Validation </a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><i class="fe fe-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li><a href="tables-basic.html">Basic Tables </a></li>
									<li><a href="data-tables.html">Data Table </a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="javascript:void(0);"><i class="fe fe-code"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
									<li class="submenu">
										<a href="javascript:void(0);"> <span>Level 1</span> <span class="menu-arrow"></span></a>
										<ul style="display: none;">
											<li><a href="javascript:void(0);"><span>Level 2</span></a></li>
											<li class="submenu">
												<a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a>
												<ul style="display: none;">
													<li><a href="javascript:void(0);">Level 3</a></li>
													<li><a href="javascript:void(0);">Level 3</a></li>
												</ul>
											</li>
											<li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
										</ul>
									</li>
									<li>
										<a href="javascript:void(0);"> <span>Level 1</span></a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
                </div>
            </div>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
                <div class="content container-fluid">
					
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Welcome Admin!</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item active">Dashboard</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<%//get total information
						User u = new User();
						int totalDoctor = u.countUserByCondition("user_roles = 'd'");
						int totalPatient = u.countUserByCondition("user_roles = 'p'");
						
						Appointment a = new Appointment();
						int totalApp = a.countAppointments();
					%>

					<div class="row">
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-primary border-primary">
											<i class="fe fe-users"></i>
										</span>
										<div class="dash-count">
											<h3><%=totalDoctor %></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										<h6 class="text-muted">Doctors</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-primary w-50"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-success">
											<i class="fe fe-credit-card"></i>
										</span>
										<div class="dash-count">
											<h3><%=totalPatient %></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Patients</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-success w-50"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-danger border-danger">
											<i class="fe fe-money"></i>
										</span>
										<div class="dash-count">
											<h3><%= totalApp %></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Appointment</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-danger w-50"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-warning border-warning">
											<i class="fe fe-folder"></i>
										</span>
										<div class="dash-count">
											<h3>$2003</h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Revenue</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-warning w-50"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					</div>
					<div class="row">
						<div class="col-md-12">
						
							<!-- Sales Chart -->
							<div class="card card-chart">
								<div class="card-header">
									<h4 class="card-title">Appointment per Doctor</h4><br>
									<Button id="sortAppointment" onclick="sortAppointment()" >Sort / Not sort</Button>
								</div>
								<div class="card-body">
									<div id="morrisBar"></div>
								</div>
							</div>
							<!-- /Sales Chart -->
							
						</div>
					</div>
					<div class="row" style="display: none;">
						<div class="col-md-12">
						
							<!-- Invoice Chart -->
							<div class="card card-chart">
								<div class="card-header">
									<h4 class="card-title">User Status</h4>
								</div>
								<div class="card-body">
									<div id="morrisLine"></div>
								</div>
							</div>
							<!-- /Invoice Chart -->
							
						</div>	
					</div>
					<div class="row" style="display: none;">
						<div class="col-md-12">
						
							<!-- Invoice Chart -->
							<div class="card card-chart">
								<div class="card-header">
									<h4 class="card-title">User Status</h4>
								</div>
								<div class="card-body">
									<div id="morrisArea"></div>
								</div>
							</div>
							<!-- /Invoice Chart -->
							
						</div>	
					</div>
					<div class="row">
						<div class="col-md-12">
						
							<!-- Area Chart -->
							<div class="card card-chart">
								<div class="card-header">
									<h4 class="card-title">Status</h4>
								</div>
								<div class="card-body">
									<canvas id="myAreaChart"></canvas>
								</div>
							</div>
							<!-- /Area Chart -->
							
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 d-flex">
						
							<!-- Recent Orders -->
							<div class="card card-table flex-fill">
								<div class="card-header">
									<h4 class="card-title">Doctors List</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>Speciality</th>
													<th>Id</th>
												</tr>
											</thead>
											<tbody>
											<%// get doctor list
												ArrayList<UserObject> doctors = u.searchUserByCondition("user_roles = 'd' LIMIT 10 ");
												Speciality sp = new Speciality();
												for (UserObject doctor : doctors) {
											%>
												<tr>
													<td>
														<h2 class="table-avatar">
															<a href="" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%=doctor.getUser_avatar() %>" alt="User Image"></a>
															<a href="">Dr. <%=doctor.getUser_fullname()  %></a>
														</h2>
													</td>
													<td><%=sp.getDoctorSp(doctor.getUser_parent_id()) %></td>
													<td><%=doctor.getUser_id() %></td>
													<!--  review <th>Review</th>
													<td>
														<i class="fe fe-star text-warning"></i>
														<i class="fe fe-star text-warning"></i>
														<i class="fe fe-star text-warning"></i>
														<i class="fe fe-star text-warning"></i>
														<i class="fe fe-star-o text-secondary"></i>
													</td>-->
												</tr>
												<%} %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- /Recent Orders -->
							
						</div>
						<div class="col-md-6 d-flex">
						
						<%//get patient list
							ArrayList<UserObject> patients = u.searchUserByCondition("user_roles = 'p' LIMIT 10 ");
						%>
						
							<!-- Feed Activity -->
							<div class="card  card-table flex-fill">
								<div class="card-header">
									<h4 class="card-title">Patients List</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-center mb-0">
											<thead>
												<tr>													
													<th>Patient Name</th>
													<th>Phone</th>
													<th>Last Visit</th>
													<th>Paid</th>													
												</tr>
											</thead>
											<tbody>
												<% 							        
												for (UserObject patient : patients) {
												%>
												<tr>
													<td>
														<h2 class="table-avatar">
															<a href="" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%=patient.getUser_avatar() %>" alt="User Image"></a>
															<a href=""><%=patient.getUser_fullname() %> </a>
														</h2>
													</td>
													<td><%=patient.getUser_phone() %></td>
													<td><%=patient.getUser_last_logined() %></td>
													<td class="text-right">$100</td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- /Feed Activity -->
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						
							<!-- Recent Orders -->
							<div class="card card-table">
								<div class="card-header">
									<h4 class="card-title">Appointment List</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>Speciality</th>
													<th>Patient Name</th>
													<th>Apointment Time</th>
													<th>Status</th>
													<th class="text-right">Amount</th>
												</tr>
											</thead>
											<tbody>
											<%// get recent appointment
											ArrayList<AppointmentObject> apps = a.getAppointmentFromNow(null, 10);
											for (AppointmentObject app : apps) {
												UserObject doctor = u.getUserById(app.getDoctor_id());
												UserObject patient = u.getUserById(app.getUser_id());
											%>
												<tr>
													<td>
														<h2 class="table-avatar">
															<a href="" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%=doctor.getUser_avatar() %>" alt="User Image"></a>
															<a href="">Dr. <%=doctor.getUser_fullname() %></a>
														</h2>
													</td>
													<td><%=sp.getDoctorSp(doctor.getUser_parent_id())%></td>
													<td>
														<h2 class="table-avatar">
															<a href="" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%=patient.getUser_avatar() %>" alt="User Image"></a>
															<a href=""><%=patient.getUser_fullname() %> </a>
														</h2>
													</td>
													<td><%=app.getApp_date() %> <span class="text-primary d-block"><%=app.getApp_time() %></span></td>
													<td>
														<div class="status-toggle">
															<input type="checkbox" id="status+<%=app.getApp_id() %>" class="check" checked>
															<label for="status_1" class="checktoggle">checkbox</label>
														</div>
													</td>
													<td class="text-right">
														$2003.00
													</td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- /Recent Orders -->
							
						</div>
					</div>
					
				</div>			
			</div>
			<!-- /Page Wrapper -->
		
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<script src="assets/plugins/raphael/raphael.min.js"></script>    
		<script src="assets/plugins/morris/morris.min.js"></script>  
		<script src="assets/js/chart.morris.js"></script>
		
		<!-- Custom JS -->
		<script  src="assets/js/script.js"></script>
		
		<!-- Embed the Morris Bar Chart -->
		<script>
		window.mC = Morris.Bar({
		    element: 'morrisBar',
		    data: [
		        { y: '2013', a: 30 },
		        { y: '2014', a: 60 },
		        { y: '2015', a: 90 },
		        { y: '2016', a: 120 },
		        { y: '2017', a: 150 },
		        { y: '2018', a: 180 },
		        { y: '2019', a: 210 },
		    ],
		    xkey: 'y',
		    ykeys: ['a'],
		    labels: ['Appointments'],
		    barColors: ['#1b5a90'],
		    gridTextSize: 10,
		    hideHover: 'auto',
		    resize: true,
		    redraw: true
		});
		var dataBarChart = []
		var sortedData = []
		<%	ArrayList<UserObject> doctorList = u.getAllDoctor(null);
			for (UserObject doctor : doctorList) {	
			int doctorApp = a.getTotalAppointment(doctor.getUser_id());%>
			dataBarChart.push({ y: '<%=doctor.getUser_id()%>', a: <%=doctorApp%> });
		<%} %>
		sortedData = dataBarChart.slice().sort(function(a, b) {
		    var aA = parseInt(a.a, 10);
		    var bA = parseInt(b.a, 10);
		    return aA - bA;
		});
		var currentData = dataBarChart;  // Initially set to the original data

		if (mC) {
		    mC.setData(currentData);
		    mC.redraw();
		}

		function sortAppointment() {
		    // Check if the current data is the same as the original data
		    function arraysEqual(arr1, arr2) {
		        if (arr1.length !== arr2.length) return false;
		        for (var i = 0; i < arr1.length; i++) {
		            if (arr1[i] !== arr2[i]) return false;
		        }
		        return true;
		    }

		    if (arraysEqual(currentData, dataBarChart)) {
		        // If the current data is the same as the original data, switch to sorted data
		        currentData = sortedData;
		    } else {
		        // If the current data is not the same as the original data, switch back to original data
		        currentData = dataBarChart;
		    }
		    if (mC) {
		        mC.setData(currentData);
		        mC.redraw();
		    }
		}
		</script>
		
		<!-- Area chart -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script>
        <!-- Set data for line chart -->
			var labelChart = []
			var dataChart = []
	        <%
	        ArrayList<String> month = new ArrayList<String>();
	        ArrayList<Integer> total = new ArrayList<Integer>();
	        if (a.countAppPerMonth(month, total)) {
	            for (int i = 0; i < month.size(); i++) {%>
	            var mValue = '<%=month.get(i)%>';
	            var tValue = <%= total.get(i)%>;
	            labelChart.push(mValue);
	            dataChart.push(tValue);
	        <%}}%>
	     // Data for the area chart
        var data = {
            labels: labelChart,
            datasets: [{
                label: 'Total appointment',
                data: dataChart,
                backgroundColor: 'rgba(75, 192, 192, 0.2)', // Area color
                borderColor: 'rgba(75, 192, 192, 1)', // Border color
                borderWidth: 1
            }]
        };

        // Configuration options
        var options = {
            scales: {
                x: {
                    type: 'category',
                    labels: labelChart
                },
                y: {
                    beginAtZero: true
                }
            }
        };

        // Get the canvas element
        var ctx = document.getElementById('myAreaChart').getContext('2d');

        // Create the area chart
        var myAreaChart = new Chart(ctx, {
            type: 'line', // Specify the chart type as 'line' to create an area chart
            data: data,
            options: options
        });
        </script>
        </body>
        
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:34 GMT -->
</html>