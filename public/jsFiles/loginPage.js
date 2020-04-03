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
