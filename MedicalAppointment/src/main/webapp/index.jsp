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
	<title>Bệnh Viện Đa khoa Quốc tế</title>

	<!-- Favicons -->
	<link type="image/x-icon" href="assets/img/favicon-32x32.png" rel="icon">

	<!-- Bootstrap CSS -->


	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <!-- Vendor CSS Files -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="assets/css/aos.css" rel="stylesheet">
    <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/style.css">


</head>
<body>
  <!-- ======= Header ======= -->
    
  <header id="header" class="fixed-top">
    <div id="container" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.jsp"><img src="assets/img/logo.png" width="80px" height="70px"></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto " href="#hero">Trang chủ</a></li>
          <li><a class="nav-link scrollto " href="#departments">Chuyên khoa</a></li>
          <li><a class="nav-link scrollto " href="#doctor">Bác sĩ</a></li>
          <li class="dropdown"><a href="#"><span>Bệnh nhân</span> <i class="bi bi-chevron-down"></i></a>
            
            <ul>
              <li><a href="doctor-profile.html">Hồ sơ bác sĩ</a></li>
              <li><a href="patient-dashboard.jsp">Bảng điều khiển của bệnh nhân</a></li>
              <li><a href="#">Yêu thích</a></li>
              <li><a href="#">Trò chuyện</a></li>
              <li><a href="#">Cài đặt hồ sơ</a></li>
              <li><a href="#">Đổi mật khẩu</a></li>            </ul>
          </li>
          <li><a class="nav-link scrollto " href="#Infrastructure">Cơ sở vật chất</a></li>

          <li><a class="nav-link scrollto" href="#contact">Liên hệ</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      
      <%
						// Lấy thông tin người dùng từ Session
						HttpSession userSession  = request.getSession();
						UserObject loggedInUser = (UserObject) userSession .getAttribute("loggedInUser");
						
						// Kiểm tra xem người dùng đã đăng nhập hay chưa
						if (loggedInUser == null) {
						    // Người dùng chưa đăng nhập
						%>
						    <li class="nav-item">
						    <a href="sign.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">Đăng nhập / Đăng ký</a>
						    </li>
						<%
						} else {
						    // Người dùng đã đăng nhập
						%>
						<li class="nav-item">
						    <a href="search.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">Đặt lịch ngay</a>
						    </li>
						    
							<%
							}
							%>
    </div>
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero">


    <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">

      <div class="carousel-item active" style="background-image: url(assets/img/hero-carousel/hero-carousel-1.jpg)">
        <div class="info d-flex align-items-center">
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-lg-9 text-center">
                  <h2 data-aos="fade-down">Vinmec</span></h2>
                  <p class="p " data-aos="fade-up">Chăm sóc bằng tài năng </p>
                  <p class="p " data-aos="fade-up">  y đức và sự thấu cảm</p>
                </div>
              </div>
            </div>
          </div>
      
      </div>
      <div class="carousel-item" style="background-image: url(assets/img/hero-carousel/hero-carousel-2.jpg)">

        <div class="info d-flex align-items-center">
            <div class="container">
              <div class="row justify-content-left">
                <div class="col-lg-6 text-center">
                 
                  <p data-aos="fade-up" class="p1 "> Đặt lịch mọi nơi </font></p>
                  <p data-aos="fade-up" class="p1 ">  đi khám thảnh thơi</font></p>
                  
                  <%if (loggedInUser != null){ %>
									
									<a data-aos="fade-up" data-aos-delay="200" href="search.jsp" class="btn-get-started">Đặt lịch ngay</a>
									<%} else { %>
									
									<a data-aos="fade-up" data-aos-delay="200" href="sign.jsp" class="btn-get-started">Đặt lịch ngay</a>
									<%} %>
                </div>
              </div>
            </div>
          </div>

    </div>

      <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>

  </section><!-- End Hero Section -->

<!-- Phòng khám và Chuyên môn -->
    <!-- ======= Our Projects Section ======= -->
    <section class="departments section-specialities" id="departments">
        <div class="container-fluid">
            <div class="section-header text-center">
                <h2>Phòng khám và Chuyên khoa</h2>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-9">
                    <!-- Slider -->
                    <div class="specialities-slider slider">

                        <!-- Slider Item -->
                        <div class="speicality-item text-center">
                            <div class="speicality-img">
                                <img src="assets/img/specialities/specialities-01.png" class="img-fluid"
                                    alt="Speciality">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                            </div>
                            <p>Tiết niệu</p>
                        </div>
                        <!-- /Slider Item -->

                        <!-- Slider Item -->
                        <div class="speicality-item text-center">
                            <div class="speicality-img">
                                <img src="assets/img/specialities/specialities-02.png" class="img-fluid"
                                    alt="Speciality">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                            </div>
                            <p>Thần kinh</p>
                        </div>
                        <!-- /Slider Item -->

                        <!-- Slider Item -->
                        <div class="speicality-item text-center">
                            <div class="speicality-img">
                                <img src="assets/img/specialities/specialities-03.png" class="img-fluid"
                                    alt="Speciality">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                            </div>
                            <p>Chỉnh hình</p>
                        </div>
                        <!-- /Slider Item -->

                        <!-- Slider Item -->
                        <div class="speicality-item text-center">
                            <div class="speicality-img">
                                <img src="assets/img/specialities/specialities-04.png" class="img-fluid"
                                    alt="Speciality">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                            </div>
                            <p>Tim mạch</p>
                        </div>
                        <!-- /Slider Item -->

                        <!-- Slider Item -->
                        <div class="speicality-item text-center">
                            <div class="speicality-img">
                                <img src="assets/img/specialities/specialities-05.png" class="img-fluid"
                                    alt="Speciality">
                                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                            </div>
                            <p>Nha khoa</p>
                        </div>
                        <!-- /Slider Item -->

                    </div>
                    <!-- /Slider -->

                </div>
            </div>
        </div>
    </section>

<!-- Phòng khám và Chuyên môn -->

<!-- BAC SIII -->



                <section id="doctor" class="doctor">
            <div class="container">
      
              <div class="section-title">
                <h2>Bác sĩ</h2>
                <p>Vinnmec quy tụ đội ngũ chuyên gia, bác sĩ, dược sĩ và điều dưỡng được đào tạo bài bản đến chuyên sâu tại Việt nam và nhiều nước có y học phát triển .</p>
              </div>
      
              <div class="row ">
                <div class="col-lg-3">
                  <ul class="nav nav-tabs flex-column">
                    <li class="nav-item">
                      <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Tiết niệu</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Thần kinh</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Chinh hình</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Tim mạch</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#tab-5">Nha khoa</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-9">
                  <div class="tab-content">
                    <div class="tab-pane active show" id="tab-1">
                        <div class="doctor-slider slider">
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-01.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Phạm Đức Huấn</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tiết niệu</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-02.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Võ Thành Nhân</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tiết niệu</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-04.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Nguyễn Tấn Cường</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tiết niệu</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-03.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Nguyễn Đình Tời</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tiết niệu</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
    

                            
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <div class="doctor-slider slider">
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-05.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Nguyễn Văn Đĩnh</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa thần kinh</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-06.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Huỳnh Thoại Loan</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa thân kinh</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-07.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Nguyễn Viết Nhân</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa thân kinh</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            

                        </div>
                    </div>
                    <div class="tab-pane" id="tab-3">
                      <div class="row gy-4">
                        <div class="doctor-slider slider">
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-08.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Võ Thành Nhân</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa chỉnh hình</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-09.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Nguyễn Ngọc Chiến</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS -Chuyên khoa chỉnh hình</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-10.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Phạm Nhật An</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS -Chuyên khoa chỉnh hình</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="tab-4">
                      <div class="row gy-4">
                        <div class="doctor-slider slider">
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-01.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Phạm Đức Huấn</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tim mạch</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-02.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Võ Thành Nhân</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tim mạch</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-04.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Nguyễn Tấn Cường</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tim mạch</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-03.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Nguyễn Đình Tời</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Chuyên khoa tim mạch</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
    

                            
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="tab-5">
                        <div class="doctor-slider slider">
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-05.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Bs.Nguyễn Văn Đĩnh</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS -  Nha khoa</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-06.png">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Huỳnh Thoại Loan</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Nha khoa</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="profile-widget" style="width: 100%;">
                                <div class="doc-img">
                                    <a href="doctor-profile.html">
                                        <img class="img-fluid" alt="Hình ảnh Người dùng" src="assets/img/doctors/doctor-07.jpg">
                                    </a>
                                    <a href="javascript:void(0)" class="fav-btn">
                                        <i class="far fa-bookmark"></i>
                                    </a>
                                </div>
                                <div class="pro-content">
                                    <h3 class="title">
                                        <a href="doctor-profile.html">Nguyễn Viết Nhân</a>
                                        <i class="fas fa-check-circle verified"></i>
                                    </h3>
                                    <p class="speciality">MDS - Nha khoa</p>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <span class="d-inline-block average-rating">(17)</span>
                                    </div>
                                    <ul class="available-info">
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i> Hà Nội, Việt Nam
                                        </li>
                                        <li>
                                            <i class="far fa-clock"></i> Có mặt vào Thứ Sáu, 22 Tháng Ba
                                        </li>
                                        <li>
                                            <i class="far fa-money-bill-alt"></i> 300.000-500.000(VND)
                                            <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                        </li>
                                    </ul>
                                    <div class="row row-sm">
                                        <div class="col-6">
                                            <a href="doctor-profile.html" class="btn view-btn">Xem Hồ sơ</a>
                                        </div>
                                        <div class="col-6">
                                            <a href="booking.html" class="btn book-btn">Đặt Ngay</a>
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
          </section><!-- End Departments Section -->

		<!-- Các Tính Năng Có Sẵn -->
        <section id="Infrastructure" class="Infrastructure" id="Infrastructure">
    <div class="container" data-aos="fade-up""> 
        <div class="section-header text-center">
            <h2>Cơ sở vật chất</h2>
            <p class="sub-title">Sở hữu không gian khám chữa bệnh văn minh, sang trọng, hiện đại hỗ trợ hiệu quả cho việc chẩn đoán và điều trị.</p>
        </div>
  
            <div class="row gy-5">
      
              <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                <div class="post-item position-relative h-100">
      
                  <div class="post-img position-relative overflow-hidden">
                    <img src="assets/img/blog/blog-1.jpg" class="img-fluid" alt="">
                  </div>
      
                  <div class="post-content d-flex flex-column">
      
                    <h3 class="post-title">Hệ thống phòng mổ Hybrid hiện đại nhất Việt Nam</h3>
      
      
      
                  </div>
      
                </div>
              </div><!-- End post item -->
      
              <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="post-item position-relative h-100">
      
                  <div class="post-img position-relative overflow-hidden">
                    <img src="assets/img/blog/blog-2.jpg" class="img-fluid" alt="">
                  </div>
      
                  <div class="post-content d-flex flex-column">
      
                    <h3 class="post-title"> Hệ thống phòng sinh hiện đại giúp mẹ bầu vượt cạn</nav></h3>
                    
                  </div>
      
                </div>
              </div><!-- End post item -->
      
              <div class="col-xl-4 col-md-6">
                <div class="post-item position-relative h-100" data-aos="fade-up" data-aos-delay="300">
      
                  <div class="post-img position-relative overflow-hidden">
                    <img src="assets/img/blog/blog-3.jpg" class="img-fluid" alt="">
                  </div>
      
                  <div class="post-content d-flex flex-column">
      
                    <h3 class="post-title">Nhà thuốc  đạt tiêu chuẩn GPP với danh mục thuốc</h3>
      
            </div>
                    </div>      
                </div>
              </div><!-- End post item -->
      
            </div>
      
            </div>
          </section>
      <!-- Các Tính Năng Có Sẵn -->


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

	<!-- Slick JS -->
	<script src="assets/js/slick.js"></script>

    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/aos.js"></script>
    <script src="assets/js/purecounter_vanilla.js"></script>


	<!-- Custom JS -->
	<script src="assets/js/script.js"></script>

</body>
</html>