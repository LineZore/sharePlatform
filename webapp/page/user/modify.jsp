<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改信息</title>
</head>

<body>
	<form action="<%=path%>/user/modifyBase" method="post">
		基本信息：<br/>
		用户名:<input type="text" id="modifyName" name="modifyName" value="${userName }" onblur="checkName()"><span id="signName"></span><br/>
		邮箱:<input type="text" id="modifyEmail" name="modifyEmail" value="${userEmail }" onblur="checkEmail()"><span id="signEmail"></span><br/>
		<input type="submit" value="更改">
		
	</form>
	<form action="<%=path%>/user/modifyPassword" method="post">
		修改密码：<br/>
		旧密码:<input type="password" name="userPassword"><br/>
		新密码:<input type="password" id="modifyPassword" name="modifyPassword" onblur="checkPassword()">
		<span id="signPassword"></span><br/>
		<input type="submit" value="修改">
	</form>
	
<script type="text/javascript">
	function checkName(){
		var modifyName=document.getElementById("modifyName").value;
		var spanNode=document.getElementById("signName");
		if(modifyName==null||modifyName==""){
			spanNode.innerHTML="用户名不能为空";
			spanNode.color="red";
		}else{
			//去数据库查询
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/checkName?userName="+modifyName;
			
			xhr.open("post",url,true);		//开启请求
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					//readyState 请求状态
					//status 响应状态
					var resText=xhr.responseText;
					if(resText=="true"){
						spanNode.innerHTML="√";
						spanNode.color="green";
					}else{
						spanNode.innerHTML="用户名已经存在";
						spanNode.color="red";
					}
				}
			}
		}
	}
	
	function checkEmail(){
		var modifyEmail=document.getElementById("modifyEmail").value;
		var spanNode=document.getElementById("signEmail");
		if(modifyEmail==null||modifyEmail==""){
			spanNode.innerHTML="邮箱不能为空";
			spanNode.color="red";
		}else{
			//去数据库查询
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/checkEmail?userEmail="+modifyEmail;
			
			xhr.open("post",url,true);		//开启请求
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					//readyState 请求状态
					//status 响应状态
					var resText=xhr.responseText;
					if(resText=="true"){
						spanNode.innerHTML="√";
						spanNode.color="green";
					}else{
						spanNode.innerHTML="邮箱已经被使用";
						spanNode.color="red";
					}
				}
			}
		}
	}
	function checkPassword(){
		var modifyPassword=document.getElementById("modifyPassword").value;
		var spanNode=document.getElementById("signPassword");
		if(modifyPassword==null||modifyPassword==""){
			spanNode.innerHTML="密码不能为空";
			spanNode.color="red";
		}else{
			//正则校验，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
			var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
			//输出 true
			if(pPattern.test(modifyPassword)){
				spanNode.innerHTML="√";
				spanNode.color="green";
			}else{
				spanNode.innerHTML="密码不符合规则";
				spanNode.color="red";
			}
		}
	}
</script>
</body>
</html>