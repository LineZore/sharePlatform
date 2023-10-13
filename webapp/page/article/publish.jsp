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
	<form action="<%=path%>/article/publish" method="post" enctype="multipart/form-data" id="form1">
		名称：<input type="text" id="articleTitle" name="articleTitle"><br/>
		简介：<input type="text" id="articleContent" name="articleContent"><br/>
		价格：<input type="text" id="articlePrice" name="articlePrice"><br/>
	
		<input type="file" name="file" multiple><br/>
		<input type="submit"  value="提交">
	</form>
</body>

</html>