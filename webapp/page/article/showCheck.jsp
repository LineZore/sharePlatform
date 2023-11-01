<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach items="${list }" var="list">
			<tr id="tr_${list.articleID}">
				<td>${list.articleTitle}</td>
				<td>作者：${list.userName}</td>
				<td>价格：${list.articlePrice}</td>
				<td><input type=button onclick="window.location.href='/sharePlatform/article/show?articleID=${list.articleID}';" value="打开"></td>

			</tr>
		</c:forEach>
	</table	>
</body>
</html>