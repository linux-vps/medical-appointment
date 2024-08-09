<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collections"%>
<%@page import="HealthCare.objects.AppointmentObject"%>
<%@page import="HealthCare.objects.*"%>
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

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">


  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
  <style>
  h2{
  font-size: 1rem;
  }
  </style>
   
</head>

<body>

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  
</head>

<body>


   <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">NiceAdmin</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Atque rerum nesciunt</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Sit rerum fuga</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Dicta reprehenderit</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

<li class="nav-item dropdown pe-3">

<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
<img src="assets/img/profile-img.jpg" alt="" class="rounded-circle" id="userAvatar">
<span id="userName1" class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
</a><!-- End Profile Iamge Icon -->

<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
<li class="dropdown-header">
<h6 id="userName">Admin</h6>
<span id="userEmail">Admin</span>
</li>
<li>
<hr class="dropdown-divider">
</li>

<li>
<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
<i class="bi bi-person"></i>
<span>My Profile</span>
</a>
</li>
<li>
<hr class="dropdown-divider">
</li>

<li>
<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
<i class="bi bi-gear"></i>
<span>Account Settings</span>
</a>
</li>
<li>
<hr class="dropdown-divider">
</li>

<li>
<a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
<i class="bi bi-question-circle"></i>
<span>Need Help?</span>
</a>
</li>
<li>
<hr class="dropdown-divider">
</li>

<li>
<a class="dropdown-item d-flex align-items-center" id="sign-out-btn" onclick="signOutUser()" href="../sign.jsp?autolog=false">
<i class="bi bi-box-arrow-right"></i>
<span>Sign Out</span>
</a>
</li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

    <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link  " href="index.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->
	  <li class="nav-item">
        <a class="nav-link collapsed " href="appointment-list.jsp">
          <i class="bx bx-list-check"></i>
          <span>Appointments</span>
        </a>
      </li><!-- End Dashboard Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="speciality-list.jsp">
          <i class="ri-todo-line"></i>
          <span>Specialities</span>
        </a>
      </li><!-- End Dashboard Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="doctor-list.jsp">
          <i class="ri-user-2-line"></i>
          <span>Doctors</span>
        </a>
      </li><!-- End Dashboard Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="patient-list.jsp">
          <i class="ri-user-heart-line"></i>
          <span>Patients</span>
        </a>
      </li><!-- End Dashboard Nav -->
 

    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">


    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Doctor Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">
					<%//get total information
						User u = new User();
						int totalDoctor = u.countUserByCondition("user_roles = 'd'");
						int totalPatient = u.countUserByCondition("user_roles = 'p'");
						
						Appointment a = new Appointment();
						int totalApp = a.countAppointments();
						
					%>
                <div class="card-body">
                  <h5 class="card-title">Doctors</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="ri-user-2-line"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=totalDoctor %></h6>             
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Sales Card -->

            <!-- Patients Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">
                <div class="card-body">
                  <h5 class="card-title">Patients</h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="ri-user-heart-line"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=totalPatient%></h6>                      
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End Revenue Card -->

            <!-- Appointment Card -->
            <div class="col-xxl-4 col-xl-12">
              <div class="card info-card customers-card">
                <div class="card-body">
                  <h5 class="card-title">Appointment </h5>
                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bx bx-list-check"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=totalApp%></h6>                     
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

            <!-- Reports -->
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Age</h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>
<%
	ArrayList<Integer> ageGroupData = u.getUserAgeGroupData();
%>
                  <script>
    document.addEventListener("DOMContentLoaded", () => {

        var colors = ['#4154f1', '#2eca6a', '#ff771d', '#e91e63', '#00bcd4', '#9c27b0', '#ffc107', '#8bc34a', '#ff5722', '#607d8b', '#795548', '#673ab7'];

        
        new ApexCharts(document.querySelector("#reportsChart"), {
        	series: [{
                data: [<%= ageGroupData.get(0) %>, <%= ageGroupData.get(1) %>, <%= ageGroupData.get(2) %>, 
                    <%= ageGroupData.get(3) %>, <%= ageGroupData.get(4) %>, <%= ageGroupData.get(5) %>, 
                    <%= ageGroupData.get(6) %>]
         }],
                chart: {
                height: 350,
                type: 'bar',
                events: {
                  click: function(chart, w, e) {
                    // console.log(chart, w, e)
                  }
                }
              },
              colors: colors,
              plotOptions: {
                bar: {
                  columnWidth: '45%',
                  distributed: true,
                }
              },
              dataLabels: {
                enabled: false
              },
              legend: {
                show: false
              },
              xaxis: {
                categories: [
                  ['0 - 1', 'Infant'],
                  ['2 - 12', 'Child'],
                  ['3 - 17', 'Teenager'],
                  ['18 -  34', 'Adult'],
                  ['35 - 64', 'Middle-aged'],
                  ['65 - 84', 'Oldster'],
                  ['Over 85', 'Elderly'],
                ],
                labels: {
                  style: {
                    colors: colors,
                    fontSize: '12px'
                  }
                }
              }
        }).render();
    });      
</script>
<!-- End Line Chart -->

              

    <div id="morrisBarSpecialty" style="height: 250px;"></div>
    <button onclick="sortSpecialty()">Sort by Number of Doctors</button>

                  
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
<div id="bar-chart" style="height: 250px;"></div>
                </div>

              </div>
            </div><!-- End Reports -->





          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">



          <!-- Website Traffic -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">Website Traffic <span>| Today</span></h5>

              <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End Website Traffic -->

          <!-- News & Updates Traffic -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">News &amp; Updates <span>| Today</span></h5>

              <div class="news">
                <div class="post-item clearfix">
                  <img src="assets/img/news-1.jpg" alt="">
                  <h4><a href="#">Nihil blanditiis at in nihil autem</a></h4>
                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-2.jpg" alt="">
                  <h4><a href="#">Quidem autem et impedit</a></h4>
                  <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-3.jpg" alt="">
                  <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-4.jpg" alt="">
                  <h4><a href="#">Laborum corporis quo dara net para</a></h4>
                  <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/news-5.jpg" alt="">
                  <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
                  <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
                </div>

              </div><!-- End sidebar recent posts-->

            </div>
          </div><!-- End News & Updates -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/js/jquery-3.2.1.min.js"></script>
  		<script src="assets/plugins/raphael/raphael.min.js"></script>    
		<script src="assets/plugins/morris/morris.min.js"></script>  
		<script src="assets/js/chart.morris.js"></script>
  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
  
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
		<!-- Embed the Morris Bar Chart -->


<%
    Speciality sp = new Speciality();
    ArrayList<SpecialityObject> specialties = sp.getAllSpecialties();
%>

<script>
    $(document).ready(function() {
        var data = [
            <% 
                for (SpecialityObject specialty : specialties) {
                    int doctorCount = sp.getDoctorCountBySpecialty(specialty.getSp_id());
                    %>
                    { y: '<%= specialty.getSp_name() %>', a: <%= doctorCount %> },
                    <% 
                }
            %>
        ];

        new Morris.Bar({
            element: 'bar-chart',
            data: data,
            xkey: 'y',
            ykeys: ['a'],
            labels: ['Number of Doctors'],
            barColors: ['#1b5a90'],
            gridTextSize: 10,
            hideHover: 'auto',
            resize: true,
            redraw: true
        });
    });
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

</html>
