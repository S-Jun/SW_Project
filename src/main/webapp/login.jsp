<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style>
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
      background-color: #f4f4f4;
    }

    .login-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .login-container h2 {
      color: #333;
    }

    .login-form {
      display: flex;
      flex-direction: column;
      margin-top: 20px;
    }

    .login-form label {
      margin-bottom: 8px;
      color: #555;
    }

    .login-form input {
      padding: 10px;
      margin-bottom: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }

    .login-form button,
    .login-form .signup-button {
      padding: 12px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }

    .login-form button:hover,
    .login-form .signup-button:hover {
      background-color: #45a049;
    }

    .login-form .signup-button {
      background-color: #3498db;
      margin-top: 10px;
    }
  </style>
</head>
<body>

<div class="login-container">
  <h2>Login</h2>
  <form class="login-form" action="loginAction.jsp" method="post">
    <label for="username">UserID:</label>
    <input type="text" id="userID" name="userID" required>

    <label for="password">Password:</label>
    <input type="password" id="userPW" name="userPW" required>

    <button type="submit">Login</button>
    <a href="signUp.jsp" class="signup-button">Sign Up</a>
  </form>
</div>

</body>
</html>
