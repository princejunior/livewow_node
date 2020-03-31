function login(value) {
  if (value == 1) {
    document.getElementById('login').style.display = 'block';
    document.getElementById('signUp').style.display = 'none';
    document.getElementById('trainerSignUp').style.display = 'none';
  }
  if (value == 2) {
    document.getElementById('login').style.display = 'none';
    document.getElementById('signUp').style.display = 'block';
    document.getElementById('trainerSignUp').style.display = 'none';
  }
  if (value == 3) {
    document.getElementById('login').style.display = 'none';
    document.getElementById('signUp').style.display = 'none';
    document.getElementById('trainerSignUp').style.display = 'block';
  }
}

function register() {
  var app = document.querySelector('#signUp');
  var email = document.querySelector('#signUpEmail');
  var password = document.querySelector('#password');

  app.register = function register() {
    var email = document.querySelector('#signUpEmail');
    var password = document.querySelector('#password');
    console.log(email, ' ', password);
    // var email = app.email;
    // var password = app.password;

    if (!email || !password) {
      return console.log('email and password required');
    }

    // Register user
    firebase
      .auth()
      .createUserWithEmailAndPassword(email, password)
      .catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        if (errorCode == 'auth/weak-password') {
          alert('The password is too weak.');
        } else {
          alert(errorMessage);
        }
        console.log(error);
      });
  };
}

(function() {
  var app = document.querySelector('#signUp');
  var login = document.querySelector('#login');
  login.signIn = function() {
    var email = app.email;
    var password = app.password;

    if (!email || !password) {
      return console.log('email and password required');
    }

    // Sign in user
    firebase
      .auth()
      .signInWithEmailAndPassword(email, password)
      .catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        console.log('signIn error', error);
        // ...
      });
  };

  app.register = function register() {
    var email = app.email;
    var password = app.password;

    if (!email || !password) {
      return console.log('email and password required');
    }

    // Register user
    firebase
      .auth()
      .createUserWithEmailAndPassword(email, password)
      .catch(function(error) {
        console.log('register error', error);
        if (error.code === 'auth/email-already-in-use') {
          var credential = firebase.auth.EmailAuthProvider.credential(
            email,
            password
          );

          //   app.signInWithGoogle().then(function() {
          //     firebase
          //       .auth()
          //       .currentUser.link(credential)
          //       .then(
          //         function(user) {
          //           console.log('Account linking success', user);
          //         },
          //         function(error) {
          //           console.log('Account linking error', error);
          //         }
          //       );
          //   });
        }
      });
  };

  app.signOut = function() {
    // Sign out
    firebase.auth().signOut();
  };

  // Listen to auth state changes
  firebase.auth().onAuthStateChanged(function(user) {
    app.user = user;
    console.log('user', user);
  });
})();
