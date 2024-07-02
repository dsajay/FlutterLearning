importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyDGbgUyOmc2qI5391UtUxBw0ko7jXpC9FI",
    authDomain: "flutter1-af24f.firebaseapp.com",
    projectId: "flutter1-af24f",
    storageBucket: "flutter1-af24f.appspot.com",
    messagingSenderId: "718092694581",
    appId: "1:718092694581:web:8be4c548b69effba4fad7c",
    measurementId: "G-T0F3DLQQ36"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});