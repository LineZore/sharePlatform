<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	登录成功<%out.print(session.getAttribute("userName").toString()); %>
	<input type="button" onclick="window.location.href='delete.jsp';" value="注销">
	<input type="button" onclick="window.location.href='modify.jsp';" value="修改">
</body>
</html>