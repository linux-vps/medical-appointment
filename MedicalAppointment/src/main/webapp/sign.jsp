<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./assets/css/sign.css" />
    <title>Đăng ký và đăng nhập</title>
    <link rel="icon" href="/assets/img/favicon.png" />
</head>

<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form action="LoginControl" method="POST" class="sign-in-form">
                 <h2 class="title">Đăng nhập</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input name="username" type="text" placeholder="Tài khoản / Email / Điện thoại" required />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input name="password" type="password" placeholder="Mật khẩu" required />
                    </div>
                    <input name="SignIn" type="submit" value="Đăng nhập" class="btn solid" />
                </form>

                <form action="RegisterControl" method="POST" class="sign-up-form">
                    <h2 class="title">Đăng ký</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input name="username" type="text" placeholder="Tên đăng nhập" required />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input name="password1" type="password" placeholder="Mật khẩu" required />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input name="password2" type="password" placeholder="Nhập lại mật khẩu" required />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input name="email" type="email" placeholder="yourmail@gmail.com" required />
                    </div>
                    
                    <input name="SignUp" type="submit" class="btn" value="Đăng ký" />
                </form>
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>Thành viên mới?</h3>
                    <p>Nếu bạn chưa có tài khoản. Hãy tạo ngay một tài khoản và tham gia cùng chúng tôi nào!</p>
                    <button class="btn transparent" id="sign-up-btn">Đăng ký</button>
                </div>
                <img src="./assets/img/log.svg" class="image" alt="" />
            </div>

            <div class="panel right-panel">
                <div class="content">
                    <h3>Xin chào!</h3>
                    <p>Nếu bạn đã có tài khoản. Hãy đăng nhập vào để bắt đầu!</p>
                    <button class="btn transparent" id="sign-in-btn">Đăng nhập</button>
                </div>
                <img src="./assets/img/register.svg" class="image" alt="" />
            </div>
        </div>
    </div>

    <script src="./assets/js/sign.js"></script>
</body>

</html>