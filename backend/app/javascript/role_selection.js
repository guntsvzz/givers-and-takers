// app/javascript/role_selection.js
function selectRole(role) {
  // Update the hidden field
  document.getElementById("user_role").value = role;
  
  // Update the form heading using JavaScript
  const formHeading = document.querySelector('#signup_form_container h2');
  formHeading.textContent = `Let's become a ${role === 'giver' ? 'Giver' : 'Taker'}`;
  
  // Hide role selection and show form
  document.getElementById("role_selection_container").classList.add('hidden');
  document.getElementById("signup_form_container").classList.remove('hidden');
}
