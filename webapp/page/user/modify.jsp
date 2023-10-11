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
	<form action="<%=path%>/user/modifyBase" method="post" id="form1">
		基本信息：<br/>
		用户名:<input type="text" id="modifyName" name="modifyName" value="${userName }" onblur="checkName()"><span id="signName"></span><br/>
		<input type="button" onclick="submitmb()" value="更改">
	</form>
	<form action="<%=path%>/user/modifyEmail" method="post" id="form2">
		邮箱：<br/>
		旧邮箱：<%out.print(session.getAttribute("userEmail").toString()); %><br/>
		新邮箱：<input type="text" id="modifyEmail" name="modifyEmail" value="${userEmail }" onblur="checkEmail()"><span id="signEmail"></span><br/>
		<input type="button" value="获取验证码" onclick="sendEmail()"><span id="signSend"></span><br/>
		验证码：<input type="text" id="vcode" name="vcode"><br/>
		<input type="button" onclick="submitme()" value="更改">
	</form>
	<form action="<%=path%>/user/modifyPassword" method="post" id="form3">
		修改密码：<br/>
		旧密码:<input type="password" id="userPassword" name="userPassword"><br/>
		新密码:<input type="password" id="modifyPassword" name="modifyPassword" onblur="checkPassword()">
		<span id="signPassword"></span><br/>
		<input type="button" onclick="submitmp()" value="修改">
	</form>
	
<script type="text/javascript">
	function checkName(){
		var modifyName=document.getElementById("modifyName").value;
		var spanNode=document.getElementById("signName");
		var userName="<%=session.getAttribute("userName")%>";
		
		if(modifyName==null||modifyName==""){
			spanNode.innerHTML="用户名不能为空";
			spanNode.color="red";
		}else if(userName==modifyName){
			spanNode.innerHTML="√";
			spanNode.color="green";
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
		var userEmail="<%=session.getAttribute("userEmail")%>";
		var pPattern = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		if(modifyEmail==null||modifyEmail==""){
			spanNode.innerHTML="邮箱不能为空";
			spanNode.color="red";
		}else if(userEmail==modifyEmail){
			spanNode.innerHTML="√";
			spanNode.color="green";
		}else if(!pPattern.test(modifyEmail)){
			spanNode.innerHTML="邮箱格式错误";
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
	function submitmb(){
		var checkNameFlag=document.getElementById("signName").innerHTML;
		var modifyName=document.getElementById("modifyName").value;
		if((checkNameFlag=="√"||checkNameFlag=="")){
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/modifyBase?modifyName="+modifyName;
			
			xhr.open("post",url,false);		//开启请求
			xhr.send();
			while(xhr.status!=200){}
			if(xhr.readyState==4&&xhr.status==200){
				//readyState 请求状态
				//status 响应状态
				var resText=xhr.responseText;
				if(resText=="true"){
					alert("修改成功");			
					window.location.href="/sharePlatform/page/user/modify.jsp";
				}else{
					alert("修改失败");
					
				}
			}
			
		}
		else{
			alert("用户名不可用");
		}
	}
	function submitme(){
		var vcode=document.getElementById("vcode").value;
		var checkEmailFlag=document.getElementById("signEmail").innerHTML;
		var vtype="modify";
		if(checkEmailFlag=="√"||checkEmailFlag==""){
			
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/verificate?vcode="+vcode+"&vtype="+vtype;
			
			xhr.open("post",url,false);		//开启请求
			xhr.send();
			while(xhr.status!=200){}
			if(xhr.readyState==4&&xhr.status==200){
				//readyState 请求状态
				//status 响应状态
				var resText=xhr.responseText;
				if(resText=="true"){
					var modifyEmail=document.getElementById("modifyEmail").value;
					var xhrn=new XMLHttpRequest();
					var urln="/sharePlatform/user/modifyEmail?modifyEmail="+modifyEmail;
					
					xhrn.open("post",urln,false);		//开启请求
					xhrn.send();
					while(xhrn.status!=200){}
					if(xhrn.readyState==4&&xhrn.status==200){
						//readyState 请求状态
						//status 响应状态
						var resTextn=xhrn.responseText;
						if(resTextn=="true"){
							alert("修改成功");		
							window.location.href="/sharePlatform/page/user/modify.jsp";
						}else{
							alert("修改失败");
							
						}
					}
					
				}else{
					alert("验证失败，请重新验证");
					
				}
			}
			
		}
		else{
			alert("邮箱格式错误");
		}
	}
	
	function submitmp(){
		var userPassword=document.getElementById("userPassword").value;
		var modifyPassword=document.getElementById("modifyPassword").value;
		var checkPasswordFlag=document.getElementById("signPassword").innerHTML;
		if((checkPasswordFlag=="√")){
			
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/modifyPassword?userPassword="+userPassword+"&modifyPassword="+modifyPassword;
			
			xhr.open("post",url,false);		//开启请求
			xhr.send();
			while(xhr.status!=200){}
			if(xhr.readyState==4&&xhr.status==200){
				//readyState 请求状态
				//status 响应状态
				var resText=xhr.responseText;
				if(resText=="false"){
					alert("原密码错误");
				}else{
					alert("修改成功");
					window.location.href="/sharePlatform/page/user/login.jsp";
				}
			}
			
		}
		else{
			alert("密码不符合要求");
		}
	}
	function sendEmail(){
		var checkEmailFlag=document.getElementById("signEmail").innerHTML;
		if(checkEmailFlag=="√"){
			var userEmail=document.getElementById("modifyEmail").value;
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
					else{
						spanNode.innerHTML="请稍等重试";
						spanNode.color="green";
					}
				}
			}
		}
		else{
			alert("邮箱格式错误");
		}
	}
</script>
</body>
</html>