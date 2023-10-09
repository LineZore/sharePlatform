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
	密码是：<%out.print(request.getAttribute("userPassword")); %>
	<form>
		<input type="button" onclick="window.location.href='./page/user/login.jsp';" value="登录">
	</form>
</body>
</html>