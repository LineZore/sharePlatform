<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
</head>

<body>
	<form action="<%=path%>/user/register" id="form1">
		用户名:<input type="text" id="userName" name="userName" onblur="checkName()"><span id="signName"></span><br/>
		密码:<input type="password" id="userPassword" name="userPassword" onblur="checkPassword()" >
		<span id="signPassword"></span><br/>
		邮箱:<input type="text" id="userEmail" name="userEmail" onblur="checkEmail()"><span id="signEmail"></span><br/>
		
		<input type="button" value="获取验证码" onclick="sendEmail()"><span id="signSend"></span><br/>
		验证码：<input type="text" id="vcode" name="vcode"><br/>
		<input type="button" onclick="verificate()" value="注册">
	</form>
</body>

<script type="text/javascript">
	function checkName(){
		var userName=document.getElementById("userName").value;
		var spanNode=document.getElementById("signName");
		if(userName==null||userName==""){
			spanNode.innerHTML="用户名不能为空";
			spanNode.color="red";
		}else{
			//去数据库查询
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/checkName?userName="+userName;
			
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
		var userEmail=document.getElementById("userEmail").value;
		var spanNode=document.getElementById("signEmail");
		if(userEmail==null||userEmail==""){
			spanNode.innerHTML="邮箱不能为空";
			spanNode.color="red";
		}else{
			//去数据库查询
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/checkEmail?userEmail="+userEmail;
			
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
		var userPassword=document.getElementById("userPassword").value;
		var spanNode=document.getElementById("signPassword");
		if(userPassword==null||userPassword==""){
			spanNode.innerHTML="密码不能为空";
			spanNode.color="red";
		}else{
			//正则校验，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
			var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
			//输出 true
			if(pPattern.test(userPassword)){
				spanNode.innerHTML="√";
				spanNode.color="green";
			}else{
				spanNode.innerHTML="密码不符合规则";
				spanNode.color="red";
			}
		}
	}
	function sendEmail(){
		var userEmail=document.getElementById("userEmail").value;
		var spanNode=document.getElementById("signSend");
		
		var xhr=new XMLHttpRequest();
		var url="/sharePlatform/user/send?userEmail="+userEmail;
		
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
				}
			}
		}
	}
	function verificate(){
		var vcode=document.getElementById("vcode").value
		
		var xhr=new XMLHttpRequest();
		var url="/sharePlatform/user/verificate?vcode="+vcode;
		
		xhr.open("post",url,true);		//开启请求
		xhr.send();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				//readyState 请求状态
				//status 响应状态
				var resText=xhr.responseText;
				if(resText=="true"){
					document.getElementById('form1').submit();
					
				}else{
					alert("验证失败，请重新验证");
					
				}
			}
		}
		
		
	}
</script>
</html>