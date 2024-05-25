<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <style>
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
      background-color: #f4f4f4;
    }

    .signup-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .signup-container h2 {
      color: #333;
    }

    .signup-form {
      display: flex;
      flex-direction: column;
      margin-top: 20px;
    }

    .signup-form label {
      margin-bottom: 8px;
      color: #555;
    }

    .signup-form input {
      padding: 10px;
      margin-bottom: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }

    .signup-form .gender-label {
      margin-bottom: 8px;
      color: #555;
    }

    .signup-form .radio-group {
      display: flex;
      justify-content: space-between;
    }

    .signup-form input[type="radio"] {
      margin-right: 8px;
    }

    .signup-form button {
      padding: 12px;
      background-color: #3498db;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }

    .signup-form button:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>

<div class="signup-container">
  <h2>Sign Up</h2>
  <form class="signup-form" action="signUpAction.jsp" method="post">
    <label for="username">UserID:</label>
    <input type="text" id="userID" name="userID" required>

    <label for="password">Password:</label>
    <input type="password" id="userPW" name="userPW" required>

    <label for="nickname">Nickname:</label>
    <input type="text" id="nickName" name="nickName" required>

    <div class="gender-label">Gender:</div>
    <div class="radio-group">
      <input type="radio" id="male" name="gender" value="male" required>
      <label for="male">Male</label>

      <input type="radio" id="female" name="gender" value="female" required>
      <label for="female">Female</label>
    </div>

    <button type="submit">Sign Up</button>
  </form>
</div>

</body>
</html>