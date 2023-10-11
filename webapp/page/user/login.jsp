<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
</head>
<body>
	<form action="<%=path%>/user/login " method="post">
		用户名:<input type="text" id="userName" name="userName">
		密码:<input type="password" id="userPassword" name="userPassword">
		<input type="button" onclick="login()" value="登录">
	</form>
<script type="text/javascript">

	function login(){
		var userPassword=document.getElementById("userPassword").value;
		var userName=document.getElementById("userName").value;
			
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/login?userPassword="+userPassword+"&userName="+userName;
			
			xhr.open("post",url,false);		//开启请求
			xhr.send();
			while(xhr.status!=200){}
			if(xhr.readyState==4&&xhr.status==200){
				//readyState 请求状态
				//status 响应状态
				var resText=xhr.responseText;
				if(resText=="false"){
					alert("登录失败");
				}else{
					alert("登录成功");
					window.location.href="/sharePlatform/page/user/loginSuccess.jsp";
				}
			}
			
	}
</script>
</body>
</html>