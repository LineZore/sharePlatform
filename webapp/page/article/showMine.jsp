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
				<td><input type=button onclick="window.location.href='/sharePlatform/article/show?articleID=${list.articleID}&showType=modify';" value="修改"></td>
				<td><input type=button onclick="deleteReg(${list.articleID })" value="删除"></td>

			</tr>
		</c:forEach>
	</table	>
</body>
<script type="text/javascript">

function deleteReg(id){
	var xhr=new XMLHttpRequest();
	var url="/sharePlatform/article/delete?articleID="+id;
	
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