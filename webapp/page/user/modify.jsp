<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注销</title>
</head>

<body>
	<form action="<%=path%>/user/modify" method="post">
		用户名:<input type="text" name="modifyName">
		密码:<input type="text" name="modifyPassword">
		邮箱:<input type="text" name="modifyEmail">
		<input type="submit" value="更改">
	</form>
</body>
</html>