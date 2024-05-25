<%@page import="User.userDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="User.userDTO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = session.getAttribute("userID")+"";
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		userDAO udao = new userDAO();
		int result = udao.login(user.getUserID(),user.getUserPW());
		if(result == 0){
			PrintWriter script = response.getWriter();
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("alert('로그인 되었습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('틀렸습니다')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");	
			script.println("alert('오류')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
	%>
</body>
</html>