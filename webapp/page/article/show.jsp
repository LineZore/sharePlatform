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
	<%
	%>
	标题：${article.articleTitle}<br/>
	内容：${article.articleContent}<br/>
	价格：${article.articlePrice}<br/>
	
	<table>
		
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.meansName}</td>
				<td><input type=button onclick="window.location.href='/sharePlatform/means/download?meansID=${m.meansID}&meansName=${m.meansName}';" value="下载"></td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>