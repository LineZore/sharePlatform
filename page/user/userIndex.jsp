<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="button" onclick="window.location.href='login.jsp';" value="登录">
		<input type="button" onclick="window.location.href='register.jsp';" value="注册">
		<input type="button" onclick="window.location.href='find.jsp';" value="找回密码">		
	</form>
</body>
</html>