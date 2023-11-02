<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <title>修改信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: linear-gradient(to bottom, #e0f7fa, white);
        }

        .container {
            width: 350px;
            padding: 0px 16px;
            padding-bottom: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            margin: 10px auto 0;
            margin-bottom: 10px;
            border: 1px solid black;
            border-radius: 4px;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin: 20px;
            font-size: 28px;
            text-align: center;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        .input-container {
            display: flex;
            align-items: center;
            margin: 0px 0;
        }

        .input-container button {
            margin-left: 10px; 
            width: 100px;
            padding: 12px 5px;
        }

        .captcha-container {
            display: flex;
            align-items: center;
            margin: 0px 0;
        }

        #captcha {
            flex: 1; 
            padding: 12px 20px;
        }

        #sendCaptchaButton {
            margin-left: 10px;
            padding: 12px 5px;
            background-color: #0073e6;
            color: white;
            border: none;
            width: 100px
        }

        #messages {
            position: fixed;
            left: 50%;
            transform: translateX(-50%);
            margin-top: 100px;
        }

        .alert {
            display: inline-block;
            padding: 10px;
            border: 1px solid #ccc;
            color: #222;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            transition: all 0.5s ease;
        }

        .alert-success {
            background-color: rgba(144, 238, 144, 0.5);
        }

        .alert-error {
            background-color: rgba(255, 192, 203, 0.8);
        }
    </style>
</head>

<body>
    <button class="button" onclick="window.location.href='/sharePlatform/article/page';" id="exit-button" style="position: absolute; top: 10px; left: 10px; background-color: #333; color: white; border: none; border-radius: 5px; cursor: pointer; padding: 10px 20px; width: auto;">退出</button>
    <div class="container">
        <h2>修改信息</h2>
        <form action="<%=path%>/user/modifyBase" method="post" id="form1" onsubmit="return submitmb()">
            <h3>基本信息：</h3>
            <label for="modifyName">用户名:</label>
            <div class="input-container">
                <input type="text" id="userName" name="userName" value="${userName}" onblur="checkName()" onclick="hideError('userName-error')">
                <button type="submit" id="modifyNameButton">更改</button>
            </div>
            <div id="error-container"></div>
        </form>

        <form action="<%=path%>/user/modifyEmail" method="post" id="form2" onsubmit="return submitme()">
            <h3>邮箱：</h3>
            <p>旧邮箱: <%=session.getAttribute("userEmail").toString()%></p>
            <label for="modifyEmail">新邮箱:</label>
            <input type="text" id="modifyEmail" name="modifyEmail" onblur="checkEmail()" onclick="hideError('modifyEmail-error')">
            <label for="captcha">验证码</label>
            <div class="captcha-container">
                <input type="text" id="captcha" name="captcha" required>
                <button type="button" id="sendCaptchaButton" onclick="sendCaptcha()">发送验证码</button>
            </div>
            <button type="submit">更改</button>
        </form>

        <form action="<%=path%>/user/modifyPassword" method="post" id="form3" onsubmit="return submitmp()">
            <h3>修改密码：</h3>
            <label for="userPassword">旧密码:</label>
            <input type="text" id="userPassword" name="userPassword">
            <br />
            <label for="modifyPassword">新密码:</label>
            <input type="password" id="modifyPassword" name="modifyPassword" onblur="checkPassword()" onclick="hideError('modifyPassword-error')">
            <br />
            <button type="submit">修改</button>
        </form>
		<h3>注销账号：</h3>
        <button style="background-color: #f44336" onclick="window.location.href='<%=path%>/user/delete'">注销</button>
    </div>
	
<script type="text/javascript">
	var isEmailValid = false; // 标志变量，表示邮箱是否有效
	function checkName(){
		var userNameInput=document.getElementById("userName");
		var userName=userNameInput.value		
		
		let errorDiv = document.getElementById('userName-error');
		if(!errorDiv) {
		    errorDiv = document.createElement('div');
		    errorDiv.id = 'userName-error';
		    errorDiv.className = 'alert alert-error'; // 使用与浏览器默认样式类似的类
		    var container = document.getElementById('error-container'); // 获取容器元素
		    container.insertAdjacentElement('beforeend', errorDiv); // 将错误提醒插入到容器的末尾
		}
		if(userName==null||userName==""){
            errorDiv.textContent = '用户名不能为空';
            errorDiv.style.display = 'block'; // 显示错误消息
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
			            errorDiv.textContent = ''; // 清空消息
			            errorDiv.style.display = 'none'; // 隐藏错误消息
					}else{
			            errorDiv.textContent = '用户名已存在';
			            errorDiv.style.display = 'block'; // 显示错误消息
					}
				}
			}
		}
	}
	function checkEmail(){
		var userEmailInput=document.getElementById("modifyEmail");
		var email = userEmailInput.value;
		var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		
		let errorDiv = document.getElementById('modifyEmail-error');
		if (!errorDiv) {
		    errorDiv = document.createElement('div');
		    errorDiv.id = 'modifyEmail-error';
		    errorDiv.className = 'alert alert-error'; // 使用与浏览器默认样式类似的类
		    userEmailInput.insertAdjacentElement('afterend', errorDiv);
		}
		if(email==null||email==""){
            errorDiv.textContent = '邮箱不能为空';
            errorDiv.style.display = 'block'; // 显示错误消息
            isEmailValid = false
            
		}
		else if(!email.match(emailRegex)){
            errorDiv.textContent = '邮箱格式不正确';
            errorDiv.style.display = 'block'; // 显示错误消息
            isEmailValid = false
		}
		else{
			//去数据库查询
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/checkEmail?userEmail="+email;
			
			xhr.open("post",url,true);		//开启请求
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					//readyState 请求状态
					//status 响应状态 
					var resText=xhr.responseText;
					if(resText=="true"){
			            errorDiv.textContent = ''; // 清空消息
			            errorDiv.style.display = 'none'; // 隐藏错误消息
			            isEmailValid = true;
					}else{
			            errorDiv.textContent = '邮箱已被使用';
			            errorDiv.style.display = 'block'; // 显示错误消息
			            isEmailValid = false
					}
				}
			}
		}
	}
	function checkPassword(){
		var userPasswordInput=document.getElementById("modifyPassword");
		var userPassword=userPasswordInput.value
		
		let errorDiv = document.getElementById('modifyPassword-error');
		if (!errorDiv) {
		    errorDiv = document.createElement('div');
		    errorDiv.id = 'modifyPassword-error';
		    errorDiv.className = 'alert alert-error'; // 使用与浏览器默认样式类似的类
		    userPasswordInput.insertAdjacentElement('afterend', errorDiv);
		}
		if(userPassword==null||userPassword==""){
            errorDiv.textContent = '密码不能为空';
            errorDiv.style.display = 'block'; // 显示错误消息
		}else{
			//正则校验，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
			var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
			//输出 true
			if(pPattern.test(userPassword)){
	            errorDiv.textContent = ''; // 清空消息
	            errorDiv.style.display = 'none'; // 隐藏错误消息
			}else{
	            errorDiv.textContent = '密码不符合规则';
	            errorDiv.style.display = 'block'; // 显示错误消息
			}
		}
	}
	function submitmb(){
		if(!document.getElementById('userName-error')){
			checkName();
			return false;
		}
		var modifyName=document.getElementById("userName").value;
        var userNameError = document.getElementById('userName-error').textContent;
		if(!userNameError){
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
			return false;
		}
	}
	function submitme(){
		if(!document.getElementById('modifyEmail-error')){
			checkEmail();
			return false;
		}
		var vcode=document.getElementById("captcha").value;
        var vtype="modify";
        var modifyEmailError = document.getElementById('modifyEmail-error').textContent;
		if(!modifyEmailError){
			
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
			return false;
		}
	}
	
	function submitmp(){
		if(!document.getElementById('modifyPassword-error')){
			checkPassword();
			return false;
		}
		var userPassword=document.getElementById("userPassword").value;
		var modifyPassword=document.getElementById("modifyPassword").value;
        var modifyPasswordError = document.getElementById('modifyPassword-error').textContent;
		if(!modifyPasswordError){
			
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
			return false;
		}
	}
    function hideError(errorId) {
	    var errorDiv = document.getElementById(errorId);
	    if (errorDiv) {
	        errorDiv.textContent = ''; // 清空消息
	        errorDiv.style.display = 'none'; // 隐藏错误消息
	    }
	}
	function sendCaptcha(){
		if(!document.getElementById('modifyEmail-error')){
			checkEmail();
			return false;
		}
		if(isEmailValid){
			var userEmail=document.getElementById("modifyEmail").value;
			var sendCaptchaButton = document.getElementById("sendCaptchaButton");
			
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
		                var resText = xhr.responseText;
		                if(resText == "true"){
		                    sendCaptchaButton.disabled = true;
		                    var countDown = 30; // 倒计时秒数
		                    var countdownInterval = setInterval(function () {
		                        if (countDown > 0) {
		                            sendCaptchaButton.innerText = "发送成功 (" + countDown + ")";
		                            countDown--;
		                        } else {
		                            clearInterval(countdownInterval);
		                            sendCaptchaButton.innerText = "重新发送";
		                            sendCaptchaButton.disabled = false; // 启用按钮
		                        }
		                    }, 1000); // 1秒更新一次倒计时文本
						}
					}    
					else{
	                    sendCaptchaButton.innerText = "请稍后重试";
	                    sendCaptchaButton.disabled = true;
	                    setTimeout(function() {
	                        sendCaptchaButton.innerText = "重新发送";
	                        sendCaptchaButton.disabled = false;
	                    }, 5000); // 延迟5秒将按钮文本设置为"重新发送"
					}
				}
			}
		}
		else{
			alert("邮箱不符合要求");
			return false;
		}
	}
</script>
</body>
</html>