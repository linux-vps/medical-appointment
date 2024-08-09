import {errorModal} from "../Auth/app.js"

const userLoggedIn = (user) => {
    
	const currentUrl = window.location.pathname;
    const currentPage = currentUrl.substring(currentUrl.lastIndexOf('/') + 1);
	if (currentPage === "index.html" || currentPage === "") {
        // Nếu trang hiện tại là index.html hoặc là root (đôi khi index.html được xử lý là root)
        return; // Dừng thực thi
    } else {
        // Không phải trang index.html, tiếp tục thực thi mã
        console.log("Không phải trang index.html, tiếp tục thực thi.");
    }
	
    // Kiểm tra tên đăng nhập và lưu trạng thái vào sessionStorage
    const tenDangNhap = user.displayName;

    if (tenDangNhap) {
        try {
            sessionStorage.setItem('QLHPfouhuewuinjkjh', JSON.stringify(user));
        } catch (error) {
            sessionStorage.setItem('QLHPfouhuewuinjkjh', user);
        }
    } else {
        alert("Tên đăng nhập trống, bạn chưa đăng nhập!");
        return;
    }

    // Cập nhật giao diện người dùng
    try {
        formContainer.remove();
        $('#auth-container').removeClass('d-none');
        verifyEmailBtn.classList.add('d-none');
    } catch (error) {
        console.error("Error updating UI after login:", error);
    }

    // Hiển thị thông tin xác thực
    try {
        authText.innerText = `Đã đăng nhập thành công với\n ${user.email}\nXác thực tài khoản: ${user.emailVerified}`;
    } catch (error) {
        console.error("Error displaying auth text:", error);
    }

    // Điều hướng dựa trên trạng thái xác thực email
    if (user.emailVerified) {
        try {
            window.location.href = "index.html";
        } catch (error) {
            console.error("Error redirecting to index page:", error);
        }
    } else {
        try {
            verifyEmailBtn.classList.remove('d-none');
        } catch (error) {
            console.error("Error showing verify email button:", error);
        }
    }
};


const userLoggedOut = () => {
	// Xóa dữ liệu về trạng thái đăng nhập trong sessionStorage
	sessionStorage.removeItem('QLHPfouhuewuinjkjh');
	if (!sessionStorage.getItem('QLHPfouhuewuinjkjh')) {
		console.log("Đã đăng xuất, session ");
	}
	try {
		// Mã có thể gây ra ngoại lệ
		// window.location.href = "index.html";
		$('body')[0].append(formContainer)
		$('#auth-container')[0].classList.add('d-none')
		
	} catch (error) {
		// Xử lý ngoại lệ
	}
}

const errorHandler = (err, isInfo = false) => {
	if (isInfo) {
		$('#error-heading')[0].innerText = "Thông tin"
	} else {
		$('#error-heading')[0].innerText = "Lỗi"
	}
	$('#error-msg')[0].innerText = err.message
	errorModal.modal('show')
	console.log(err);
}

// validateForm 
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
	'use strict'

	// Fetch all the forms we want to apply custom Bootstrap validation styles to
	var forms = document.querySelectorAll('.needs-validation')

	// Loop over them and prevent submission
	Array.prototype.slice.call(forms)
		.forEach(function (form) {
			form.addEventListener('submit', function (event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}

				form.classList.add('was-validated')
			}, false)
		})
})()

export {errorHandler, userLoggedIn}