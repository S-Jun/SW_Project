<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User Settings</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: white;
    }

    .container {
      max-width: 100%;
      width: 800px;
      height: 1000px;
      background-color: rgb(159, 184, 212);
      padding: 20px;
      margin: 0px 50px 0px 50px;
      margin-top: 110px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .nickname {
      text-align: center;
      font-size: 20px;
      color: gray;
      margin-bottom: 20px;
    }
	
	.textfield{
		width: 300px;
		align-items: center;
	}
	
    label {
      display: block;
      margin-bottom: 10px;
      font-size: 16px;
      color: #333;
    }

    input[type="text"],
    input[type="password"] {
      width: 60%;
      padding: 8px;
      align-items: center;
      margin-bottom: 15px;
      box-sizing: border-box;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    input[type="radio"] {
      margin-right: 5px;
    }
  </style>
  
  <title>정보 수정 페이지</title>
<head>
</head>
<body>
	<div class="nickname">사용자 닉네임</div>
  <div class="container">
  	<form action = "chagePasswordAction.jsp" method = "post" id = "changepassword">
   		<label for="password">기존 비밀번호:</label>
    	<input class = "textfield" type="password" id="old-password" name="old-password"><br>
    	<label for="password">새 비밀번호:</label>
    	<input class = "textfield" type="password" id="new-password" name="new-password">
  	</form>
  	<button type = "submit" form = "chagepassword">변경하기</button>

    <label>뉴스 회사 변경:</label>
    SBS<input type="checkbox" id="option1" name="option" checked><br>
	KBS<input type="checkbox" id="option2" name="option" checked><br>
    MBC<input type="checkbox" id="option3" name="option" checked><br>
    xx<input type="checkbox" id="option4" name="option" checked><br>
    xxx<input type="checkbox" id="option5" name="option" checked><br>

    <input type="submit" value="저장">
  </div>

</body>
</html>
