<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.PageHelper" %>
<% String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	登录成功<%out.print(session.getAttribute("userName").toString()); %>
	您的积分为<%out.print(session.getAttribute("userIntegral").toString()); %>
	<input type="button" onclick="window.location.href='/sharePlatform/page/user/delete.jsp';" value="注销">
	<input type="button" onclick="window.location.href='/sharePlatform/page/user/modify.jsp';" value="修改">
	<form action="<%=path%>/user/exit ">
		<input type="submit" value="退出">
	</form>
	<br/>
	
	<table>
		<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.articleTitle}</td>
				<td>作者：${list.userName}</td>
				<td>价格：${list.articlePrice}</td>
				<td><input type=button onclick="window.location.href='/sharePlatform/article/show?articleID='+${list.articleID};" value="打开"></td>
			</tr>
		</c:forEach>
		<tr>
			
			<c:if test="${ph.pageNo >1}">
				<td><a href="<%=path%>/article/page?pageNo=1">首页</a></td>
				<td><a href="<%=path%>/article/page?pageNo=${ph.pageNo-1}">上一页</a></td>
			</c:if>
			<c:if test="${ph.pageNo <ph.pageCount}">
				<td><a href="<%=path%>/article/page?pageNo=${ph.pageNo+1}">下一页</a></td>
				<td><a href="<%=path%>/article/page?pageNo=${ph.pageCount}">尾页</a></td>
			</c:if>
		</tr>
	</table>
	<br/>
	
	<input type="button" onclick="window.location.href='/sharePlatform/page/article/publish.jsp';" value="发布文章"><br/>
	<input type="button" onclick="window.location.href='/sharePlatform/article/getUser';" value="我的文章">
	<input type="button" onclick="window.location.href='/sharePlatform/exchange/getUser';" value="已购买的文章">
	
</body>
<script type="text/javascript">
	
</script>
</html>