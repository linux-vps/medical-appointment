/*  The callback function passed in this function get's triggered on reload and recives one arguement
	if the arguement is not null / undefined that means the user is already signed in. 
	You can access all the information from that object  */ 
import { auth } from "../firebase.js";
import { userLoggedIn } from "./index.js";



const signUpUser = (email, pass) => {
    auth.createUserWithEmailAndPassword(email, pass)
        .then(res => {
            console.log(res)
        })
        .catch(err => {
            errorHandler(err)
        })
}

const signInUser = (email, pass) => {
    auth.signInWithEmailAndPassword(email, pass)
        .then(res => {
            // No need of handling anything here auth.onAuthStateChanged function got this
            console.log("Đã đăng nhập")
            // console.log(res)
        })
        .catch(err => {
            errorHandler(err)
        })
}

const signOutUser = () => {
    auth.signOut()
        .then(() => {
            console.log("Đã đăng xuất")
            userLoggedOut()
        })
        .catch(err => {
            console.log(err)
            errorHandler(err)
        })
}

const verifyEmail = () => {
    const user = auth.currentUser
    user.sendEmailVerification()
        .then(() => {
            errorHandler({ message: "Đã gửi link xác thực.\nVui lòng kiểm tra Email của bạn" }, true)
        })
        .catch(err => {
            errorHandler(err)
        })
}

const resetPassword = (email) => {
    auth.sendPasswordResetEmail(email)
        .then(() => {
            errorHandler({ message: "Email is sent.\nCheck your Mail's." }, true)
        })
        .catch(err => {
            errorHandler(err)
        })
}

auth.onAuthStateChanged(user => {
    if (user) {
        const currentUrl = window.location.pathname;
        const currentPage = currentUrl.substring(currentUrl.lastIndexOf('/') + 1);
        if (currentPage !== "sign.html") {
            // Nếu trang hiện tại KHÔNG PHẢI LÀ sign.html thì
            return; // Dừng thực thi
        } 

        userLoggedIn(user);
    } else {
        console.log("No user is signed in.. Sign Up")
    }
})

export {signOutUser}