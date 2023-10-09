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
	登录成功<%out.print(session.getAttribute("userName").toString()); %>
	<input type="button" onclick="window.location.href='/sharePlatform/page/user/delete.jsp';" value="注销">
	<input type="button" onclick="window.location.href='/sharePlatform/page/user/modify.jsp';" value="修改">
	<form action="<%=path%>/user/exit ">
		<input type="submit" value="退出">
	</form>
</body>
</html>