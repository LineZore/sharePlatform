<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=path%>/article/modify" method="post"  id="form1">
		<input type="hidden" value="${article.articleID}" id="articleID" name="articleID"><br/>
		名称：<input type="text" value="${article.articleTitle}" id="articleTitle" name="articleTitle"><br/>
		简介：<input type="text" value="${article.articleContent}" id="articleContent" name="articleContent"><br/>
		价格：<input type="text" value="${article.articlePrice}" id="articlePrice" name="articlePrice"><br/>
		<input type="submit"  value="修改">
	</form>
	
	<form action="<%=path%>/means/upload?articleID=${article.articleID}" method="post" enctype="multipart/form-data" id="form2">
		<input type="file" name="file" multiple><br/>
		<input type="submit"  value="添加">
	</form>
	
	<table>
		<c:forEach items="${list }" var="m">
			<tr id="tr_${m.meansID }">
				<td>${m.meansName}</td>
				<td><input type=button onclick="window.location.href='/sharePlatform/means/download?meansID=${m.meansID}&meansName=${m.meansName}';" value="下载"></td>
				<td><input type=button onclick="deleteReg(${m.meansID })" value="删除"></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
<script type="text/javascript">

function deleteReg(id){
	var xhr=new XMLHttpRequest();
	var url="/sharePlatform/means/delete?meansID="+id;
	
	xhr.open("post",url,true);		//开启请求
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			//readyState 请求状态
			//status 响应状态
			var resText=xhr.responseText;
			if(resText=="true"){
				alert("删除成功");
			 	var div = document.getElementById("tr_"+id);
			 	div.remove();
			}else{
				alert("删除失败");
			}
		}
	}
	
}
	
</script>
	
</html>