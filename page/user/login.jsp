<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ch">
<title>登录</title>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: linear-gradient(to bottom, #e0f7fa, white);
            height: 100vh;
            overflow:hidden
        }

        .container {
            width: 300px;
            padding: 16px;
            background-color: rgba(255, 255, 255, 0.8);
            margin: 160px auto 0;
            border: 1px solid black;
            border-radius: 4px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        h2 {
            font-size: 28px;
            text-align: center;
        }

        input[type=text], input[type=password] {
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
	        <h2>计算机资料分享平台</h2>
	        <label for="username"><b>Username</b></label>
	        <label>
	            <input type="text" placeholder="Enter Username" name="username" id="userName" required>
	        </label>
	
	        <label for="password"><b>Password</b></label>
	        <label>
	            <input type="password" placeholder="Enter Password" name="password" id="userPassword" required>
	        </label>
	
	        <button type="button" onclick="login()">登录</button>
            <p>还没有账号？ <a href="register.jsp">注册</a> <span style="float: right;"><a href="find.jsp">忘记密码</a></span></p>
	    </div>
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
					window.location.href="/sharePlatform/article/page";
					
				}
			}
			
	}
</script>
</body>
</html>
