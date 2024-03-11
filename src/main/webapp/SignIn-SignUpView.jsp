<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp_SignIn</title>
    <style type="text/css">
    	  	*{
    margin: 0px;
    padding: 0px;;
  }
  
  body{
    font-family:cursive;
  }
  .container
  {
    display: grid;
    grid-template-columns: 1fr 2fr;
    position: absolute;
    top: 50%;
    left: 50%;
    translate: -50% -50%;
    background: linear-gradient(to bottom,  rgba(0, 0, 255, 0.801),  rgb(5, 5, 114));
    width: 1000px;
    height: 500px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.151);
  }

  .content-holder
  {
    text-align: center;
    margin-top: 30%;
    padding-top: 50px;
  }
  .content-holder h2
  {
    color: white;
    font-size: 34px;
    margin: 20px auto;
  }
  .content-holder button
  {
    border:none;
    font-size: 15px;
    padding: 10px;
    border-radius: 6px;
    background-color: white;
    width: 150px;
    margin: auto;
  }
  .box-2{
    background-color: whitesmoke;
    margin: 5px;
  }
  .login-form-container
  {
    text-align: center;
    margin-top: 10%;
  }
  .login-form-container h1
  {
    color: black;
    font-size: 24px;
    padding: 20px;
  }
  .input-field
  {
    box-sizing: border-box;
    font-size: 14px;
    padding: 10px;
    width: 250px;
    outline: none;
    border-radius: 10px;
    border: none;
    background-color: whitesmoke;  
    box-shadow: inset 5px 5px 5px -1px rgba(88, 85, 85, 0.11),
    inset -5px -5px 5px -1px white;
    
  }
  .login-button{
    box-sizing: border-box;
    color: white;
    font-size: 14px;
    padding: 13px;
    border-radius: 7px;
    border: none;
    width: 250px;
    background-color: rgb(39,39,218);
  }
  .button-2
  {
    display: none;
  }
  .signup-form-container
  {
    text-align: center;
    margin-top: 10%;
    display: none;
  }
  .signup-form-container h1
  {
    color: black;
    font-size: 24px;
    padding: 20px;
  }
  .signup-button{
    box-sizing: border-box;
    color: white;
    font-size: 14px;
    padding: 13px;
    border-radius: 7px;
    border: none;
    width: 250px;
    background-color:  #D90368;  
  }
  .signup-button:active, .login-button:active,.content-holder button:active{
    opacity: 80%;  
  }
  .signup-button:hover{
    box-shadow: 0 0 0 1px whitesmoke,0 0 0 2px #D90368;
  }
  .login-button:hover{
    box-shadow: 0 0 0 1px whitesmoke,0 0 0 2px rgb(39,39,218);
  }
  .signup-button,.login-button,.content-holder button{
    cursor: pointer;
  }
  .content-holder button:hover{
    box-shadow: 0 0 0 2px whitesmoke;
  }
  .forget{
    cursor: pointer;
    color: blue;
  }
    </style>
</head>
<body>
    <div class="container">
        <!--Data or Content-->
        <div class="box-1">
            <div class="content-holder">
                <h2>Welcome !</h2>
               
                <button class="button-1" onclick="signup()">Sign up</button>
                <button class="button-2" onclick="login()">Login</button>
            </div>
        </div>
  
        
        <!--Forms-->
        <div class="box-2">
            <div class="login-form-container">
                <form action="SignInServlet" method="post">
                    <h1>Login</h1>
                    <input type="text" placeholder="Username" name="username" class="input-field" required>
                    <br><br>
                    <input type="password" placeholder="Password" name="password" class="input-field" required>
                    <br><br>
                    <button class="login-button" type="submit">Login</button><br><br>
                    <p class="forget" onclick="contactadmin()">Forget Password ?</p>
                </form>
            </div>
  
  
  <!--Create Container for Signup form-->
        <div class="signup-form-container">
            <form action="SignUpServlet" method="post">
                <h1>Sign Up </h1>
                <input type="text" placeholder="Username" name="username" class="input-field" required>
                <br><br>
                <input type="email" placeholder="Email" name="email" class="input-field" required>
                <br><br>
                <input type="password" placeholder="Password" name="password" class="input-field" required>
                <br><br>
                <button class="signup-button" type="submit">Sign Up</button>
            </form>
        </div>
        </div>
    </div>
    <span id="user" style="display:none"><%=request.getAttribute("username") %></span>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                 
            function signup()
            {
                document.querySelector(".login-form-container").style.cssText = "display: none;";
                document.querySelector(".signup-form-container").style.cssText = "display: block;";
                document.querySelector(".container").style.cssText = "background: linear-gradient(to bottom,  #D90368,  #880542);";
                document.querySelector(".button-1").style.cssText = "display: none";
                document.querySelector(".button-2").style.cssText = "display: block";

            }
            function login()
            {
                document.querySelector(".signup-form-container").style.cssText = "display: none;";
                document.querySelector(".login-form-container").style.cssText = "display: block;";
                document.querySelector(".container").style.cssText = "background: linear-gradient(to bottom,  rgba(0, 0, 255, 0.801),  rgb(5, 5, 114));";
                document.querySelector(".button-2").style.cssText = "display: none";
                document.querySelector(".button-1").style.cssText = "display: block";
            }
            function contactadmin(){
                Swal.fire({
                title: 'Cantact System Admin (JEEVANANTHAM)!!!',
                icon: 'info',
                confirmButtonText: "Ok"            
              });
            }
            <% if (request.getAttribute("signinfail") != null) { %>
            Swal.fire({
                title: 'No Account Found !!!',
                text: 'Please SignUp before Login..',
                icon: 'error',
                confirmButtonText: "Ok"            
              });
            	signup();
            <% } %>  
            <% if (request.getAttribute("signinfailinvalid") != null) { %>
            Swal.fire({
                title: 'Invalid Username or Password!',
                text: 'Check Login credentials...',
                icon: 'error',
                confirmButtonText: "Ok"            
              });
            <% } %>
            <% if (request.getAttribute("signupsuccess") != null) { %>
            Swal.fire({
                title: 'Success !!',
                text: 'New Account Created ...  Login to Access...',
                icon: 'success',
                confirmButtonText: "Ok",
                confirmButtonColor: "rgb(34, 139, 34)"
              });
            <% } %>  
            <% if (request.getAttribute("signupfail") != null) { %>
            Swal.fire({
                title: 'SignUp Failed!! Username('+document.getElementById("user").innerText+') already exists... ',
                text: ' Use Different username for SignUp...',
                icon: 'error',
                confirmButtonText: "Ok"            
              });
            signup();
            <% } %> 
        </script>
</body>
</html>