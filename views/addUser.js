const userId = document.getElementById('userId');
const firstName = document.getElementById('firstName');
const lastName = document.getElementById('lastName');
const age = document.getElementById('age');
const addBtn = document.getElementById('addBtn');
const updateBtn = document.getElementById('updateBtn');
const removeBtn = document.getElementById('removeBtn');

const database = firebase.database();
const rootRef = database.ref('users');

addBtn.addEventListener('click', (e) => {
  e.preventDefault();

  rootRef.child(userId.value).set({
    first_name: firstName.value,
    last_name: lastName.value,
    age: age.value
  });
});

updateBtn.addEventListener('click', (e) => {
  e.preventDefault();
  const newData = {
    age: age.value,
    last_name: lastName.value
  };
  //   rootRef.child(userId.value).update(newData);
  const updates = {};
  updates['/users/' + userId.value] = newData;
  updates['/super-users/' + userId.value] = newData;
  database.ref().update(updates);
});

removeBtn.addEventListener('click', (e) => {
  e.preventDefault();
  rootRef
    .child(userId.value)
    .remove()
    .then(() => {
      window.alert('user deleted');
    })
    .catch((error) => {
      console.error(error);
    });

  database
    .ref('/super-users')
    .child(userId.value)
    .remove();
});

rootRef.on('child_added', (snapshot) => {
  console.log('Child(s) added');
});

rootRef.on('child_changed', (snapshot) => {
  console.log('Child(s) changed');
});

rootRef.on('child_removed', (snapshot) => {
  console.log('Child(s) removed');
});

rootRef.on('value', (snapshot) => {
  console.log('An event occured on the database');
});
