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
	<form action="<%=path%>/modify" method="post">
		用户名:<input type="text" name="userName">
		密码:<input type="text" name="userPassword">
		邮箱:<input type="text" name="userEmail">
		<input type="submit" value="更改">
	</form>
</body>
</html>