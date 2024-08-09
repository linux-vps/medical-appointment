<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng nhập</title>
	<!-- CSS -->
	<link rel="stylesheet" href="assets\css\all.min.css">
	<!-- <link rel="stylesheet" href="assets\css\sign.css"> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	
	<style>
		.login-with-google-btn {
			transition: background-color .3s, box-shadow .3s;

			padding: 12px 16px 12px 42px;
			border: none;
			border-radius: 3px;
			box-shadow: 0 -1px 0 rgba(0, 0, 0, .05), 0 1px 4px rgba(0, 0, 0, .25);

			color: #757575;
			font-size: 14px;
			font-weight: 500;
			font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;

			background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMTcuNiA5LjJsLS4xLTEuOEg5djMuNGg0LjhDMTMuNiAxMiAxMyAxMyAxMiAxMy42djIuMmgzYTguOCA4LjggMCAwIDAgMi42LTYuNnoiIGZpbGw9IiM0Mjg1RjQiIGZpbGwtcnVsZT0ibm9uemVybyIvPjxwYXRoIGQ9Ik05IDE4YzIuNCAwIDQuNS0uOCA2LTIuMmwtMy0yLjJhNS40IDUuNCAwIDAgMS04LTIuOUgxVjEzYTkgOSAwIDAgMCA4IDV6IiBmaWxsPSIjMzRBODUzIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz48cGF0aCBkPSJNNCAxMC43YTUuNCA1LjQgMCAwIDEgMC0zLjRWNUgxYTkgOSAwIDAgMCAwIDhsMy0yLjN6IiBmaWxsPSIjRkJCQzA1IiBmaWxsLXJ1bGU9Im5vbnplcm8iLz48cGF0aCBkPSJNOSAzLjZjMS4zIDAgMi41LjQgMy40IDEuM0wxNSAyLjNBOSA5IDAgMCAwIDEgNWwzIDIuNGE1LjQgNS40IDAgMCAxIDUtMy43eiIgZmlsbD0iI0VBNDMzNSIgZmlsbC1ydWxlPSJub256ZXJvIi8+PHBhdGggZD0iTTAgMGgxOHYxOEgweiIvPjwvZz48L3N2Zz4=);
			background-color: white;
			background-repeat: no-repeat;
			background-position: 12px 11px;

			&:hover {
				box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 2px 4px rgba(0, 0, 0, .25);
			}

			&:active {
				background-color: #eeeeee;
			}

			&:focus {
				outline: none;
				box-shadow:
					0 -1px 0 rgba(0, 0, 0, .04),
					0 2px 4px rgba(0, 0, 0, .25),
					0 0 0 3px #c8dafc;
			}

			&:disabled {
				filter: grayscale(100%);
				background-color: #ebebeb;
				box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 1px 1px rgba(0, 0, 0, .25);
				cursor: not-allowed;
			}
		}

		body {
			text-align: center;
			padding-top: 2rem;
		}
	</style>
	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</head>

<body>
	<div id="auth-container" class="d-none container text-center">
		<h3 id="auth-text" class="font-weight-bold text-center mb-5 mt-5"></h3>
		<button id="sign-out-btn" class="btn btn-danger font-weight-bolder btn-lg m-3">Đăng xuất</button>
		<button id="email-verify-btn" class="btn btn-primary font-weight-bolder btn-lg m-3">Xác thực</button>
	</div>
	<div id="form-container" class="vh-100 d-flex flex-column justify-content-center container-sm">
		<h1 id="heading" class="font-weight-bolder text-center mb-5">Đăng ký</h1>

		
		<form id="form-el" class="form-signin text-center mb-4 needs-validation" novalidate>
			<div style="max-width: 500px;" class="container-sm">
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text shadow-sm"><i class="fa-solid fa-envelope"></i></span>
					</div>
					<input class="form-control shadow-sm" type="email"
					style="border-end-end-radius: 4px; border-start-end-radius: 4px;" required
					 placeholder="Email" name="email" id="emailInput" />		
					<div style="width: 10px;"></div>
					<div class="invalid-feedback">Vui lòng nhập email.</div>
				</div>
				<div class="form-group input-group mb-5">
					<div class="input-group-prepend"  id="passwordContainer">
						<span class="input-group-text shadow-sm"><i class="fa-solid fa-key"></i></span>
					</div>
					<input class="form-control shadow-sm" 
					style="border-end-end-radius: 4px; border-start-end-radius: 4px;" required
					type="password" minlength="8" value="" placeholder="Password" name="password" id="passwordInput" />
					<div style="width: 10px;"></div>	
					<div class="invalid-feedback">Vui lòng nhập mật khẩu.</div>
				</div>
			</div>
			<button id="form-submit-btn" class="font-weight-bold btn btn-primary btn-lg col-sm-3 col-12">Đăng ký</button><br />
			<button id="forgot-pass-btn" class="d-none btn btn-link mt-3">Quên mật khẩu</button>
			<hr class="my-4 w-50">
		</form>
		
		<div class="text-center">
			<button type="button" id="google-auth" class="login-with-google-btn mb-3 col-sm-3">
				Đăng nhập với Google
			</button>
		</div>
		<p class="text-center mt-3">
			<span id="switch-note">Bạn đã có tài khoản ?</span>
			<button aria-data="sign-in" id="swap-sign-in-up" class="btn btn-link">Đăng nhập</button>
		</p>
		<!-- copyright -->
		<div class="row justify-content-center mt-3">
			<span class="text-center">Copyright 2024 © <strong>ĐM HaUI</strong></span>
		</div>
		<hr class="my-4 w-50">
		<!-- /copyright -->

	</div>			
	<div class="modal fade" id="error-modal" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="error-heading" class="modal-title"></h5>
					<button class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="error-msg" class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn btn-info" data-dismiss="modal">Okay</button>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-analytics.js"></script>
	<script>
		// For Firebase JS SDK v7.20.0 and later, measurementId is optional
		const firebaseConfig = {
			apiKey: "AIzaSyAy2pYqsON8gyH1_HzB-jfSZRTXc46rzyM",
			authDomain: "qlhp-6dc0a.firebaseapp.com",
			databaseURL: "https://qlhp-6dc0a-default-rtdb.asia-southeast1.firebasedatabase.app",
			projectId: "qlhp-6dc0a",
			storageBucket: "qlhp-6dc0a.appspot.com",
			messagingSenderId: "215730772223",
			appId: "1:215730772223:web:5cb60d9b0a31c632d914ca",
			measurementId: "G-53J8STD2EP"
		};
		firebase.initializeApp(firebaseConfig);
		// References for Auth, Firestore
		const auth = firebase.auth();
	</script> -->
	

	<script type="module" src="./Auth/auth.js"></script>
	<!-- <script defer type="module" src="./Auth/googleAuth.js"></script>
	<script defer type="module" src="./Auth/index.js"></script>
	<script defer type="module" src="./Auth/app.js"></script> -->
</body>

</html>