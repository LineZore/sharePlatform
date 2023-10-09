<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找回密码</title>
</head>
<body>
	<form action="<%=path%>/user/find" method="post">
		用户名:<input type="text" name="userName">
		邮箱:<input type="text" name="userEmail">
		<input type="submit" value="找回密码">
	</form>
</body>
</html>