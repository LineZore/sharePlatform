<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找回密码</title>
</head>
<body>
	<form action="<%=path%>/user/find" method="post" id="form1">
		用户名:<input type="text" id="userName" name="userName">
		邮箱:<input type="text" id="userEmail" name="userEmail" onblur="checkEmail()"><span id="signEmail"></span><br/>
		<input type="button" value="获取验证码" onclick="sendEmail()"><span id="signSend"></span><br/>
		验证码：<input type="text" id="vcode" name="vcode"><br/>
		<input type="button" onclick="findout()" value="找回密码">
	</form>
</body>
<script type="text/javascript">
	function checkEmail(){
		var userEmail=document.getElementById("userEmail").value;
		var spanNode=document.getElementById("signEmail");
		var pPattern = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		if(userEmail==null||userEmail==""){
			spanNode.innerHTML="邮箱不能为空";
			spanNode.color="red";
		}else if(!pPattern.test(userEmail)){
			spanNode.innerHTML="邮箱格式错误";
			spanNode.color="red";
		}else{
			
			spanNode.innerHTML="";
			spanNode.color="green";
		}
	}
	function sendEmail(){
		var checkEmailFlag=document.getElementById("signEmail").innerHTML;
		if(checkEmailFlag==""){
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
					else{
						spanNode.innerHTML="请稍等重试";
						spanNode.color="green";
					}
				}
			}
		}
		else{
			alert("邮箱出错");
		}
	}
	
	function findout(){
		var vcode=document.getElementById("vcode").value;
		var vtype="find";
		var checkEmailFlag=document.getElementById("signEmail").innerHTML;
		if(checkEmailFlag==""){
			
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
						var userEmail=document.getElementById("userEmail").value;
						var userName=document.getElementById("userName").value;
						var xhrn=new XMLHttpRequest();
						var urln="/sharePlatform/user/find?userName="+userName+"&userEmail="+userEmail;
						
						xhrn.open("post",urln,false);		//开启请求
						xhrn.send();
						while(xhrn.status!=200){}
						if(xhrn.readyState==4&&xhrn.status==200){
							var resTextn=xhrn.responseText;
							if(resTextn=="true")
								alert("已发送至您的邮箱中");
							else alert("邮箱不匹配或不存在");
						}
						else{
							alert("请求出错");
						}
						
						
					}else{
						alert("验证失败，请重新验证");
						
					}
			
			}
		}
		else{
			alert("格式错误");
		}
		
		
	}
</script>

</html>