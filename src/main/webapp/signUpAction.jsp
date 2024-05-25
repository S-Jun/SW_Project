<%@page import="User.userDAO"%>
<%@page import="java.io.PrintWriter"%>
<
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="User.userDTO" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="nickName"/>
<jsp:setProperty name="user" property="gender"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
			System.out.println(userID);
		}
		if(userID != null){
			PrintWriter script = response.getWriter();			
			script.println("<script>");
			script.println("alert('이미 로그인 되었습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		userDAO udao = new userDAO();
		int result = -1;
		
		if(user.getGender() != null && user.getNickName() != null
				&& user.getUserID() != null && user.getUserPW() != null){
			result = udao.SignUP(user);
		}
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 아이디')");
			script.println("location.href='signUp.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("alert('로그인 되었습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>