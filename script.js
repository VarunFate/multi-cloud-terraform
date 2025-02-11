function validateForm(event) {
   
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    
   
    const errorMessage = document.getElementById('error-message');
    
    
    errorMessage.innerHTML = "";

  
    if (username === "" || password === "") {
        event.preventDefault(); 
        errorMessage.innerHTML = "Both username and password are required.";
    } else {
  
        alert("Login successful!");
    }
}


document.getElementById('loginForm').addEventListener('submit', validateForm);
