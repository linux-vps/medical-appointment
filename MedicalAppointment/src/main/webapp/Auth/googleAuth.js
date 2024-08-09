import { auth, GoogleAuthProvider, signInWithPopup } from "../firebase.js";
import {errorHandler} from "../Auth/index.js";
import { userLoggedIn } from "./index.js";
var provider = new GoogleAuthProvider();
let user = null

// provider.addScope('https://www.googleapis.com/auth/contacts.readonly');

const signInUserWithGoogle = () => {
	signInWithPopup(auth, provider).then(res => {
		// console.log(res.user);
		// var token = res.credential.accessToken;
		// console.log(token)
		user = res.user;
		userLoggedIn(user);
	}).catch(err => {
		errorHandler(err)
	})
	// This code below does not open the auth in new window
	/* auth.signInWithRedirect(provider).then(res => {
		console.log(res)
		var token = res.credential.accessToken;
		console.log(token)
		user = res.user
	}).catch(err => {
		console.log(err)
	}) */
}

export {signInUserWithGoogle}