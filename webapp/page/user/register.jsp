<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
    <title>注册</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: linear-gradient(to bottom, #e0f7fa, white);
            min-height: 100vh;
            overflow:hidden
        }

        .container {
            width: 300px;
            padding: 16px;
            background-color: rgba(255, 255, 255, 0.8);
            margin: 80px auto 0;
            border: 1px solid black;
            border-radius: 4px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        h2 {
            font-size: 24px;
            text-align: center;
        }

        input[type=text], input[type=email], input[type=password] {
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
        
        .captcha-container {
            display: flex;
            align-items: center;
            margin: 0px 0;
        }

        #captcha {
            flex: 1; /* 自动填充剩余的空间 */
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
            margin-top: 70px;
        }

        .alert {
            display: inline-block;
            padding: 10px;
            border: 1px solid #ccc;
            color: #222;
            margin-bottom: 10px;
            border-radius: 5px; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
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
	<form>
        <div class="container">
            <h2>注册 - 计算机资料分享平台</h2>
            <label for="username"><b>Username</b></label>
            <label>
                <input type="text" placeholder="Enter Username" id="userName" name="userName" required onblur="checkName()" onclick="hideError('userName-error')">
            </label>

            <label for="email"><b>Email Address</b></label>
            <label>
                <input type="email" placeholder="Enter Email" id="userEmail" name="userEmail" required onblur="checkEmail()" onclick="hideError('userEmail-error')">
            </label>
            
            <label for="captcha"><b>Captcha</b></label>
            <div class="captcha-container">
                <input type="text" placeholder="Enter Captcha" id="captcha" name="captcha" required>
                <button type="button" id="sendCaptchaButton" onclick="sendCaptcha()">发送验证码</button>
            </div>

            <label for="password"><b>Password</b></label>
            <label>
                <input type="password" placeholder="Enter Password" id="userPassword" name="userPassword" required onblur="checkPassword()" onclick="hideError('userPassword-error')">
            </label>
			<p style="font-size:10px; margin-top:-5px">六位以上，必须含有小写、大写字母、数字，不能含有特殊字符</p>
			
            <label for="confirm_password"><b>Confirm Password</b></label>
            <label>
                <input type="password" placeholder="Confirm Password" id="confirm_password" name="confirm_password" required onblur="checkComfirmPassword()" onclick="hideError('confirm_password-error')">
            </label>

            <button type="button" onclick="verificate()">注册</button>
            <p>已经有账号了？ <a href="login.jsp">登录</a></p>
        </div>
    </form>
</body>

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
		    userNameInput.insertAdjacentElement('afterend', errorDiv);
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
		var userEmailInput=document.getElementById("userEmail");
		var email = userEmailInput.value;
		var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		
		let errorDiv = document.getElementById('userEmail-error');
		if (!errorDiv) {
		    errorDiv = document.createElement('div');
		    errorDiv.id = 'userEmail-error';
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
		var userPasswordInput=document.getElementById("userPassword");
		var userPassword=userPasswordInput.value
		
		let errorDiv = document.getElementById('userPassword-error');
		if (!errorDiv) {
		    errorDiv = document.createElement('div');
		    errorDiv.id = 'userPassword-error';
		    errorDiv.className = 'alert alert-error'; // 使用与浏览器默认样式类似的类
		    userPasswordInput.insertAdjacentElement('afterend', errorDiv);
		}
		if(userPassword==null||userPassword==""){
            errorDiv.textContent = '密码不能为空';
            errorDiv.style.display = 'block'; // 显示错误消息
		}else{
			//正则校验，最少6位，包括至少1个大写字母，1个小写字母，1个数字,不允许特殊字符
			var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z]).*$/;
			var qPattern= /[^a-zA-Z0-9]/;
			//输出 true
			if(pPattern.test(userPassword)&&!qPattern.test(userPassword)){
	            errorDiv.textContent = ''; // 清空消息
	            errorDiv.style.display = 'none'; // 隐藏错误消息
			}else{
	            errorDiv.textContent = '密码不符合规则';
	            errorDiv.style.display = 'block'; // 显示错误消息
			}
		}
		if(document.getElementById('comfirm_Password-error')){
			checkComfirmPassword();
		}
	}
	function checkComfirmPassword(){
		var comfirmPasswordInput=document.getElementById("confirm_password");
		var userPassword=document.getElementById("userPassword").value;
		var comfirmPassword=comfirmPasswordInput.value
		
		let errorDiv = document.getElementById('comfirm_Password-error');
		if (!errorDiv) {
		    errorDiv = document.createElement('div');
		    errorDiv.id = 'comfirm_Password-error';
		    errorDiv.className = 'alert alert-error'; // 使用与浏览器默认样式类似的类
		    comfirmPasswordInput.insertAdjacentElement('afterend', errorDiv);
		}
		if(userPassword!=comfirmPassword){
            errorDiv.textContent = '两次密码不一致';
            errorDiv.style.display = 'block'; // 显示错误消息
		}else{
            errorDiv.textContent = ''; // 清空消息
            errorDiv.style.display = 'none'; // 隐藏错误消息
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
		if(isEmailValid){
			var userEmail=document.getElementById("userEmail").value;
			var sendCaptchaButton = document.getElementById("sendCaptchaButton");
			
			var xhr=new XMLHttpRequest();
			var url="/sharePlatform/user/send?userEmail="+userEmail;
			
			xhr.open("post",url,true);		//开启请求
			xhr.send();
			sendCaptchaButton.disabled = true;
			
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					//readyState 请求状态
					//status 响应状态
					
					var resText=xhr.responseText;
					if(resText=="true"){
		                
		                    
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
	}
	function verificate(){
		var vcode=document.getElementById("captcha").value;
		var vtype="register";
		var userNameError = document.getElementById('userName-error').textContent;
		var userEmailError = document.getElementById('userEmail-error').textContent;
		var userPasswordError = document.getElementById('userPassword-error').textContent;
        var userComfirmPasswordError = document.getElementById('comfirm_Password-error').textContent;        
		if(!userEmailError && !userNameError && !userPasswordError && !userComfirmPasswordError){
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
					var userName=document.getElementById("userName").value;
					var userEmail=document.getElementById("userEmail").value;
					var userPassword=document.getElementById("userPassword").value;
					
					var xhrn=new XMLHttpRequest();
					var urln="/sharePlatform/user/register?userName="+userName+"&userEmail="+userEmail+"&userPassword="+userPassword;
					
					xhrn.open("post",urln,false);		//开启请求
					xhrn.send();
					while(xhrn.status!=200){}
					if(xhrn.readyState==4&&xhrn.status==200){
						var resTextn=xhr.responseText;
						if(resTextn=="true"){
							alert("注册成功");
							window.location.href="login.jsp";
						}
						else{
							alert("注册失败");
						}
					}
				}else{
					alert("验证失败，请重新验证");
				}
			}
		}
		else{
	        alert('请先解决当前警告。');
	        return false; // 阻止表单提交
		}
	}
</script>
</html>