<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
</head>
<body>
	<form action="<%=path%>/user/login " method="post">
		用户名:<input type="text" name="userName">
		密码:<input type="password" name="userPassword">
		<input type="submit" value="登录">
	</form>
</body>
</html>