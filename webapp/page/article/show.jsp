<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.PageHelper" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% String path=request.getContextPath(); %>
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
	
	<c:if test="${userType eq 'user' }">
		<c:if test="${buyFlag eq 'false'}">
			<button  onclick="buy()" id="buy" >购买</button>
		</c:if>
		<c:if test="${buyFlag eq 'true'}">
			<button  disabled="disabled" id="buy" >已购买</button>
		</c:if>
	</c:if>
	
	<table>
		
		<c:forEach items="${list }" var="m">
			<tr>
				<td>${m.meansName}</td>
				<td>
					<form action="<%=path%>/means/download" method="post">
						<input type="hidden" name="buyFlag" value="${buyFlag}">
						<input type="hidden" name="userType" value="${userType}">
						<input type="hidden" name="meansID" value="${m.meansID}">
						<input type="hidden" name="meansName" value="${m.meansName}">
						<input type="submit" value="下载">
					</form>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	
	
	
	<br/>
	<form action="<%=path%>/comment/publish" action="post">
		<input type="hidden" value="${article.articleID}" id="articleID" name="articleID">
		<input type="text" id="commentContent" name="commentContent"><br/>
		<input type="submit" value="发表评论"><br/>
	</form>
	
	<br/>评论：<br/>
	<table>
		<c:forEach items="${commentlist }" var="commentlist">
			<tr>
				<td>${commentlist.userName}:</td>
				<td>发布时间：${commentlist.publishTime}</td>
				<td>${commentlist.commentContent}</td>
				<c:if test="${commentlist.userName==userName}">
					<td><input type="button" onclick="window.location.href='/sharePlatform/comment/delete?commentID=${commentlist.commentID}&articleID=${article.articleID}';" value="删除"></td>
				</c:if>
			</tr>
		</c:forEach>
		<tr>
			<c:if test="${ph.pageNo >1}">
				<td><a href="<%=path%>/article/show?articleID=${article.articleID}&pageNo=1">首页</a></td>
				<td><a href="<%=path%>/article/show?articleID=${article.articleID}&pageNo=${ph.pageNo-1}">上一页</a></td>
			</c:if>
			<c:if test="${ph.pageNo <ph.pageCount}">
			<td><a href="<%=path%>/article/show?articleID=${article.articleID}&pageNo=${ph.pageNo+1}">下一页</a></td>
			<td><a href="<%=path%>/article/show?articleID=${article.articleID}&pageNo=${ph.pageCount}">尾页</a></td>
			</c:if>
		</tr>
	</table>
</body>

<script type="text/javascript">
	function buy(){
		var articleID=document.getElementById("articleID").value;
		
		var xhr=new XMLHttpRequest();
		var url="/sharePlatform/exchange/buy?articleID="+articleID;
		
		xhr.open("post",url,true);		//开启请求
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				//readyState 请求状态
				//status 响应状态
				var resText=xhr.responseText;
				if(resText=="true"){
					document.getElementById("buy").innerText="已购买";
					document.getElementById("buy").disabled=true;
				}else{
					
				}
			}
		}
	}
</script>
</html>