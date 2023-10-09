<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
</head>
<body>
	<form action="<%=path%>/user/register">
		用户名:<input type="text" name="userName">
		密码:<input type="password" name="userPassword">
		邮箱:<input type="text" name="userEmail">
		<input type="submit" value="注册">
	</form>
</body>
</html>