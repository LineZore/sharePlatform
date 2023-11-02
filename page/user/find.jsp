<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <title>找回密码</title>
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
            margin: 140px auto 0;
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
            <h2>找回密码</h2>
            <label for="username"><b>Username</b></label>
            <label>
                <input type="text" placeholder="Enter Username" id="userName" name="userName">
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
            <button type="button" onclick="findout()">找回密码</button>
            <p>记起密码了？ <a href="login.jsp">登录</a></p>
        </div>
    </form>
</body>
<script type="text/javascript">
var isEmailValid = false; // 标志变量，表示邮箱是否有效
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
		            errorDiv.textContent = '邮箱未被注册'; // 清空消息
		            errorDiv.style.display = 'block'; // 隐藏错误消息
		            isEmailValid = false;
				}else{
		            errorDiv.textContent = '';
		            errorDiv.style.display = 'none'; // 显示错误消息
		            isEmailValid = true
				}
			}
		}
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
}
	
	function findout(){
		var vcode=document.getElementById("captcha").value;
		var vtype="find";
        var userEmailError = document.getElementById('userEmail-error').textContent;
		if(!userEmailError){
			
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
							if(resTextn=="true"){
								alert("已发送至您的邮箱中");
								window.location.href="/sharePlatform/page/user/login.jsp";
							}
							else {
								alert("邮箱不匹配或不存在");
							}
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
	function hideError(errorId) {
	    var errorDiv = document.getElementById(errorId);
	    if (errorDiv) {
	        errorDiv.textContent = ''; // 清空消息
	        errorDiv.style.display = 'none'; // 隐藏错误消息
	    }
	}
</script>

</html>