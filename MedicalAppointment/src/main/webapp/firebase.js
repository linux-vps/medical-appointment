import { initializeApp } from "https://www.gstatic.com/firebasejs/10.9.0/firebase-app.js";
import { getMessaging, getToken, onMessage } from "https://www.gstatic.com/firebasejs/10.9.0/firebase-messaging.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.9.0/firebase-analytics.js";
import { getAuth, GoogleAuthProvider, signInWithPopup } from "https://www.gstatic.com/firebasejs/10.9.0/firebase-auth.js";
import { getDatabase, ref, 
    get, set, child, update, 
    remove, onValue, OnDisconnect, 
    serverTimestamp, onChildChanged,orderByValue ,
    onChildAdded,onChildMoved, onChildRemoved
} from "https://www.gstatic.com/firebasejs/10.9.0/firebase-database.js";


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

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);
const db = getDatabase();
const messaging = getMessaging(app);




export const fetchToken = async (setTokenFound) => {
    try {
        const currentToken = await getToken(messaging, {
            // key pair ở cloud messaging
            vapidKey: "BN423VzsRZpmibgVn8EqxGYRTgc2e9nJowX70zQVqcelFKjYoDzULYq5Rn51NX9ZBBy9YuJ-qkhLvC5ejtpZruI",
        });

        if (currentToken) {
            // console.log("current token for client: ", currentToken);
            setTokenFound(true);
            return currentToken;
        } else {
            console.log("No registration token available. Request permission to generate one.");
            setTokenFound(false);
            return null;
        }
    } catch (err) {
        console.log("An error occurred while retrieving token. ", err);
        return null;
    }
};

export const onMessageListener = () =>
    new Promise((resolve) => {
        onMessage(messaging, (payload) => {
            resolve(payload);
        });
    });

export { db, 
    getDatabase, ref, getToken,
    get, set, child, update, 
    remove, onValue, OnDisconnect, 
    serverTimestamp, onChildChanged,orderByValue ,
    onChildAdded,onChildMoved, onChildRemoved, getAuth, GoogleAuthProvider, signInWithPopup };
 
export {app, analytics, auth}
