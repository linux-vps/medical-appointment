<%@page import="HealthCare.objects.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="HealthCare.process.User"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>BVDK Appointment</title>
  <!--<script>
    // Kiểm tra xem người dùng đã đăng nhập hay chưa
    if (sessionStorage.getItem('QLHPfouhuewuinjkjh')) {
      console.log("Đã đăng nhập");
  
      // Lấy đối tượng user từ sessionStorage và chuyển đổi thành đối tượng JavaScript
      const loggedInUser = JSON.parse(sessionStorage.getItem('QLHPfouhuewuinjkjh'));
      
      
    } else {
      window.location.href = "../sign.html?autolog=false";
    }
  </script> -->
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Datatables CSS -->
<link href="https://cdn.datatables.net/v/bs5/jq-3.7.0/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/date-1.5.2/r-3.0.2/datatables.min.css" rel="stylesheet">
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/v/bs5/jq-3.7.0/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/date-1.5.2/r-3.0.2/datatables.min.js"></script>


  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
            /* dropdown cho phép chọn và xoá nhiều mục, có cả js ở dưới nữa */
            .dropdown {
              position: relative;
              display: inline-block;
          }
  
          .dropdown-item input[type="checkbox"] {
              display: none;
          }
  
          .dropdown-item:hover {
              color: #ffffff;
              /* Màu chữ khi hover */
              background-color: #000000;
              /* Màu nền khi hover */
          }
  
          .show {
              display: block;
          }
  
  
          .selected-option {
              background-color: #f1f1f1;
              color: black;
              padding: 5px 30px;
              border-radius: 10px;
              margin-right: 18px;
              margin-bottom: 5px;
              display: inline-block;
              align-items: center;
          }
  
          .selected-options {
              flex-wrap: wrap;
              display: inline-block;
              vertical-align: top;
              margin-right: 10px;
              position: absolute;
              top: 2.5px;
          }
  
          .selected-option:hover {
              background-color: #ddd;
          }
  
          .selected-option span {
              margin-right: 5px;
              cursor: pointer;
          }
          h2{
          font-size: 1rem;
          }
  </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <!-- <img src="https://i.ibb.co/fx24MnV/favicon.png" alt=""> -->
        <span class="d-none d-lg-block">Appointment</span>
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
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" id="userAvatar">
            <span id="userName1" class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6 id="userName">Kevin Anderson</h6>
              <span id="userEmail">Teacher</span>
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
              <a class="dropdown-item d-flex align-items-center" id="sign-out-btn" onclick="signOutUser()" href="../sign.html?autolog=false">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
          <!--  <script>
              // Lấy đối tượng user từ sessionStorage và chuyển đổi thành đối tượng JavaScript
              const loggedInUser = JSON.parse(sessionStorage.getItem('QLHPfouhuewuinjkjh'));
        
              const userName = loggedInUser.displayName;
              const userEmail = loggedInUser.email;
              const userAvatar = loggedInUser.photoURL;
        
              // Hiển thị thông tin người dùng trong user menu
              document.getElementById('userName').textContent = userName;
              document.getElementById('userName1').textContent = userName;
              document.getElementById('userEmail').innerText = userEmail;
        
              // Nếu có ảnh đại diện của người dùng, hiển thị nó
              if (loggedInUser.photoURL) {
                document.getElementById('userAvatar').src = userAvatar;
              }
            </script> -->

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->
  <!-- script này có tác dụng hiển thị thông tin người dùng -->
  <!--  <script src="getUserInfor.js"></script> -->
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed " href="index.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->
	  <li class="nav-item">
        <a class="nav-link  " href="appointment-list.jsp">
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

    <div class="pagetitle">
      <h1>Blank Page</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Danh sách lớp</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          
         <!-- Recent Orders -->
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
									
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Patient ID</th>
													<th>Patient Name</th>
													<th>Address</th>
													<th>Phone</th>
													<th>Last Visit</th>
												</tr>
											</thead>
											<tbody>
												<%
												User patient = new User();
												UserObject patientObject = new UserObject();
												List<UserObject> patientList = patient.getUsersByRole("d");
												for (UserObject p : patientList) {
												%>
												<tr>
													<td><%=p.getUser_id() %></td>
													<td>
														<h2 class="table-avatar">
															<a href="#" class="avatar avatar-sm mr-2"><img style="width:10%;" class="avatar-img rounded-circle" src="<%=p.getUser_avatar() %>" alt="User Image"></a>
															<a href="#"><%=p.getUser_fullname() %></a>
														</h2>
													</td>
													<td><%=p.getUser_address() %></td>
													<td><%=p.getUser_phone() %></td>
													<td><%=p.getUser_last_logined() %></td>
												</tr>
												<%
												} 
												%>								
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- /Recent Orders -->

        </div>


      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>HaUI</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      <!-- Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <!-- MODAL -->
  <!-- Add Modal -->
  <div class="modal fade" id="Add_Class" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Thêm lớp học</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="modal-body">
            <div class="row form-row">
                <div class="col-12 col-sm-12">
                    <div class="form-group">
                        <input type="text" class="form-control mb-2" id="className" placeholder="Tên lớp">
                    </div>
                </div>
                <div class="col-12 col-sm-12">
                    <div class="form-group">
                        <!-- chọn nhiều mục -->
                        <div id="dropdownBtn" onclick="toggleDropdown()"
                            class="btn btn-secondary btn-block mb-2">Chọn lịch học:</div>
                        <div class="dropdown form-control" style="min-height: 80px;">
                            <div id="selectedOptions" class="selected-options"></div>
                            <div id="myDropdown" class="dropdown-content dropdown-menu">
                                <label class="dropdown-item" for="monday"><input type="checkbox" id="monday"
                                        name="options" value="monday"> Thứ 2</label>
                                <label class="dropdown-item" for="tuesday"><input type="checkbox"
                                        id="tuesday" name="options" value="tuesday"> Thứ 3</label>
                                <label class="dropdown-item" for="wednesday"><input type="checkbox"
                                        id="wednesday" name="options" value="wednesday"> Thứ 4</label>
                                <label class="dropdown-item" for="thursday"><input type="checkbox"
                                        id="thursday" name="options" value="thursday"> Thứ 5</label>
                                <label class="dropdown-item" for="friday"><input type="checkbox" id="friday"
                                        name="options" value="friday"> Thứ 6</label>
                                <label class="dropdown-item" for="saturday"><input type="checkbox"
                                        id="saturday" name="options" value="saturday"> Thứ 7</label>
                                <label class="dropdown-item" for="sunday"><input type="checkbox" id="sunday"
                                        name="options" value="sunday"> Chủ nhật</label>
                            </div>
                        </div>
                        <!-- hết thẻ chọn nhiều mục -->
                    </div>
                </div>
                <div class="col-12 col-sm-12 mb-2">
                    <div class="form-group">
                        <label>Loại</label>
                        <select class="selectpicker form-control" id="classType">
                            <option>Lớp học</option>
                            <option>Gia sư</option>
                        </select>
                    </div>
                </div>
                <div class="col-12 col-sm-12 mb-2">
                    <div class="form-group">
                        
                        <input type="text" class="form-control" id="timeStudy" placeholder="Thời gian">
                    </div>
                </div>
                <div class="input-group mb-1">
                    <label for="amountOfMoney" class="input-group-text shadow-sm">
                      <i class="bi bi-cash-coin"></i>
                    </label>
                    <input type="text" class="form-control shadow-sm rounded-end" id="amountOfMoney"
                        placeholder="Học phí" onkeyup="convert_text(this)" onchange="convert_text(this)"
                        required><br>
                </div>
                <div class="input-group mb-1 text-center d-flex align-items-center justify-content-center">
                    <p id="result">
                </div>
            </div>
        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" id="add-btn">Thêm</button>
        </div>
      </div>
    </div>
  </div>
  <!-- /ADD Modal -->
  <!-- Edit Details Modal -->

  <!-- END MODAL -->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

  <script>
    function toggleDropdown() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    document.addEventListener("click", function (event) {
        var dropdown = document.getElementById("myDropdown");
        var button = document.getElementById("dropdownBtn");
        if (!dropdown.contains(event.target) && event.target !== button) {
            dropdown.classList.remove("show");
        }
    });

    document.querySelectorAll('input[name="options"]').forEach(function (item) {
        item.addEventListener("change", function () {
            updateSelectedOptions();
        });
    });

    function updateSelectedOptions() {
        var selectedOptions = [];
        document.querySelectorAll('input[name="options"]:checked').forEach(function (item) {
            selectedOptions.push(item.value);
        });
        displaySelectedOptions(selectedOptions);
    }

    function displaySelectedOptions(selectedOptions) {
        var resultDiv = document.getElementById("selectedOptions");
        resultDiv.innerHTML = "";
        if (selectedOptions.length > 0) {
            // Tạo một đối tượng ánh xạ từ tiếng Anh sang tiếng Việt
            var englishToVietnamese = {
                "monday": "Thứ 2",
                "tuesday": "Thứ 3",
                "wednesday": "Thứ 4",
                "thursday": "Thứ 5",
                "friday": "Thứ 6",
                "saturday": "Thứ 7",
                "sunday": "Chủ nhật"
            };

            selectedOptions.forEach
                (day => {
                    var dayName = englishToVietnamese[day];
                    var optionDiv = document.createElement("div");
                    optionDiv.classList.add("selected-option");
                    optionDiv.innerHTML = dayName + " <span onclick='removeSelectedDay(\"" + day + "\")'><i class='fas fa-times'></i></span>";


                    resultDiv.appendChild(optionDiv);
                });
        } else {
            resultDiv.innerHTML = "Bạn chưa chọn bất kỳ tùy chọn nào.";
        }
    }

    function removeSelectedDay(day) {
        document.getElementById(day).checked = false;
        updateSelectedOptions();
    }
</script>
<script>

  function FillEditModal(classKey, ten_lop, loai, ngay, gio_day, hoc_phi) {
      // Điền thông tin từ hàng được chọn vào các trường input trong modal sửa
      document.getElementById("classNameEdit").value = ten_lop;
      document.getElementById("classTypeEdit").value = loai;
      document.getElementById("timeStudyEdit").value = gio_day;
      document.getElementById("classKeyHidden").value = classKey;
      // document.getElementById("amountOfMoney").value = hoc_phi;
      // Chuyển đổi chuỗi JSON thành một đối tượng
      try {
          ngay = decodeURIComponent(ngay)
      ngay = JSON.parse(ngay);

      } catch (error) {
          
      }
      console.log("ngay: ", ngay);
      
  }
  function FillDeleteModal(classKey, ten_lop) {
      document.getElementById("classIDToDel").value = classKey;
      document.getElementById("classNameToDel").value = ten_lop;

  }
  /**
 * Convert from number to Vietnamese string.
 * By Dong Hung Phung <donghung.viethanit@gmail.com>
 */
 (function () {
      var default_numbers = ' hai ba bốn năm sáu bảy tám chín';
      var dict = {
          units: ('? một' + default_numbers).split(' '),
          tens: ('lẻ mười' + default_numbers).split(' '),
          hundreds: ('không một' + default_numbers).split(' '),
      }
      const tram = 'trăm';
      var digits = 'x nghìn triệu tỉ nghìn'.split(' ');

      /**
       * additional words
       * @param  {string} block_of_2 [description]
       * @return {string}   [description]
       */
      function tenth(block_of_2) {
          var sl1 = dict.units[block_of_2[1]];
          var result = [dict.tens[block_of_2[0]]]
          if (block_of_2[0] > 0 && block_of_2[1] == 5)
              sl1 = 'lăm';
          if (block_of_2[0] > 1) {
              result.push('mươi');
              if (block_of_2[1] == 1)
                  sl1 = 'mốt';
          }
          if (sl1 != '?') result.push(sl1);
          return result.join(' ');
      }

      /**
       * convert number in blocks of 3
       * @param  {string} block "block of 3 mumbers"
       * @return {string}   [description]
       */
      function block_of_three(block) {

          switch (block.length) {
              case 1:
                  return dict.units[block];

              case 2:
                  return tenth(block);

              case 3:
                  var result = [dict.hundreds[block[0]], tram];
                  if (block.slice(1, 3) != '00') {
                      var sl12 = tenth(block.slice(1, 3));
                      result.push(sl12);
                  }
                  return result.join(' ');
          }
          return '';
      }
      /**
       * Get number from unit, to string
       * @param  {mixed} nStr input money
       * @return {String}  money string, removed digits
       */
      function formatnumber(nStr) {
          nStr += '';
          var x = nStr.split('.');
          var x1 = x[0];
          var x2 = x.length > 1 ? '.' + x[1] : '';
          var rgx = /(\d+)(\d{3})/;
          while (rgx.test(x1)) {
              x1 = x1.replace(rgx, '$1' + ',' + '$2');
          }
          return x1 + x2;
      };

      function digit_counting(i, digit_counter) {
          var result = digits[i]

          return result
      }
      function to_vietnamese(input, currency) {
          var str = parseInt(input.replace(/[^\d,]/g, "")) + '';
          var index = str.length;
          if (index == 0 || str == 'NaN')
              return '';
          var i = 0;
          var arr = [];
          var result = []

          //explode number string into blocks of 3numbers and push to queue
          while (index >= 0) {
              arr.push(str.substring(index, Math.max(index - 3, 0)));
              index -= 3;
          }
          //loop though queue and convert each block
          var digit_counter = 0;
          var digit;
          var adding;
          for (i = arr.length - 1; i >= 0; i--) {
              if (arr[i] == '000') {
                  digit_counter += 1;
                  if (i == 2 && digit_counter == 2) {
                      result.push(digit_counting(i + 1, digit_counter));
                  }
              }
              else if (arr[i] != '') {
                  digit_counter = 0
                  result.push(block_of_three(arr[i]))
                  digit = digit_counting(i, digit_counter);
                  if (digit && digit != 'x') result.push(digit);
              }
          }
          if (currency)
              result.push(currency);
          //remove unwanted white space
          return result.join(' ')
      }

      if (typeof module !== 'undefined' && typeof module.exports !== 'undefined') {
          module.exports = to_vietnamese;
      }
      else if (typeof window !== undefined) {
          window.to_vietnamese = to_vietnamese;
      }
      return to_vietnamese
  })();

  function convert_text(e) {

      var result = document.getElementById('result');
      var resultEdit = document.getElementById('resultEdit');
      if (e.validity.valid) {
          // Lấy giá trị từ input và chuyển thành tiếng Việt
          let chuoi = to_vietnamese(e.value);
          // Kiểm tra nếu chuỗi không rỗng thì thêm chữ "đồng"
          if (chuoi !== "") {
              // Chuyển chữ cái đầu của chuỗi thành chữ in hoa
              chuoi = chuoi.charAt(0).toUpperCase() + chuoi.slice(1);
              result.innerHTML = chuoi + " đồng.";
              resultEdit.innerHTML = chuoi + " đồng.";
          } else {
              result.innerHTML = chuoi;
              resultEdit.innerHTML = chuoi;
          }
      }
  }
</script>

<!-- <script defer type="module" src="main.js"></script>
<script src="./Auth/index.js"></script> -->


</body>

</html>
