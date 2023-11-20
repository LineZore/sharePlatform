<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }
        .container {
            max-width: 550px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label, input, textarea {
            margin: 5px;
            text-align: left;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;sss
        }
        #drop-zone {
            width: 100%;
            height: 200px;
            border: 2px dashed #ddd;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            cursor: pointer;
            background-color: rgb(255, 255, 255, 0.4);
            flex-direction: column;
        }
        .folder-icon {
            width: 60px;
            height: 40px;
            fill: #4CAF50;
            margin-bottom: 10px;
        }
        input[type="submit"] {
        	margin-top:20px;
            padding: 10px 20px;
            border: none;
            background-color: #007BFF;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            background-color: #007BFF;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        #file-list {
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            width: 95%;
            overflow-y: auto;
        }
        #clearFilesButton {
        	display: none;
	        margin-top: 10px;
	        padding: 8px 16px;
	        background-color: #f44336;
	        color: #fff;
	        border: none;
	        border-radius: 5px;
	        cursor: pointer;
	        font-size: 14px;
	    }
	
	    #clearFilesButton:hover {
	        background-color: #bb2d3b;
	    }
    </style>
</head>
<body>
	<button class="button" onclick="window.location.href='/sharePlatform/article/page';" id="exit-button" style="position: absolute; top: 10px; left: 10px; background-color: #333; color: white; border: none; border-radius: 5px; cursor: pointer; padding: 10px 20px;">退出</button>
    <div class="container">
        <form action="<%=path%>/article/modify" method="post" id="form1">
            <label for="articleTitle">标题:</label>
            <input type="text" id="articleTitle" name="articleTitle" value="${article.articleTitle}">
            <label for="articleContent">简介:</label>
            <textarea id="articleContent" name="articleContent" rows="10">${article.articleContent}</textarea>
            <label for="articlePrice">价格:</label>
            <input type="text" id="articlePrice" name="articlePrice" value="${article.articlePrice}">
			<input type="submit" value="修改">
		</form>
			<form action="<%=path%>/means/upload?articleID=${article.articleID}" method="post" enctype="multipart/form-data" id="form2">
				<label for="articleFile">添加文件:</label>
	            <div id="drop-zone">
	                <svg class="folder-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="none" stroke="#000000" stroke-width="2" d="M2,10 L2,6 L2,2 L10,2 L13,6 L22,6 L22,10 L2,10 Z M2,14 L22,14 L22,22 L2,22 L2,14 Z"></path></svg>
	                <p class="drop-text">点击或拖拽即可上传文件</p>
	                <input type="file" id="articleFile" name="file" multiple style="display: none;">
	            </div>
	            <label for="articleFile">已添加文件:</label>
	            <div id="file-list"></div>
	            <button type="button" id="clearFilesButton">清空已上传文件</button>
	            <input type="submit"  value="添加">
		    </form>
	    <script>
	const dropZone = document.getElementById('drop-zone');
	const fileInput = document.getElementById('articleFile');
	const fileListContainer = document.getElementById('file-list');
	
	dropZone.addEventListener('dragover', (e) => {
	    e.preventDefault();
	    dropZone.style.borderColor = '#007BFF';
	});
	
	dropZone.addEventListener('dragleave', () => {
	    dropZone.style.borderColor = '#ddd';
	});
	
	dropZone.addEventListener('drop', (e) => {
	    e.preventDefault();
	    dropZone.style.borderColor = '#ddd';
	
	    const files = e.dataTransfer.files;
	    clearFilesButton.style.display = files.length > 0 ? 'inline-block' : 'none';
	    fileListContainer.innerHTML = ''; // 清空文件列表
	    for (const file of files) {
	        const listItem = document.createElement('div');
	        listItem.textContent = file.name;
	        fileListContainer.appendChild(listItem);
	    }
	
	    fileInput.files = files; 
	});
	
	
	dropZone.addEventListener('click', () => {
	    fileInput.click();
	});
	   
	   const clearFilesButton = document.getElementById('clearFilesButton');
	
	   clearFilesButton.addEventListener('click', () => {
	       fileListContainer.innerHTML = ''; // 清空文件列表
	       fileInput.value = null; // 清空文件输入框的值
	       clearFilesButton.style.display = 'none'; // 隐藏清空按钮
	   });
	
	   fileInput.addEventListener('change', () => {
	       const files = fileInput.files;
	
	       // 显示或隐藏清空按钮
	       clearFilesButton.style.display = files.length > 0 ? 'inline-block' : 'none';
	
	       fileListContainer.innerHTML = ''; // 清空文件列表
	       for (const file of files) {
	           const listItem = document.createElement('div');
	           listItem.textContent = file.name;
	           fileListContainer.appendChild(listItem);
	       }
	   });
	
</script>
          	<label for="articleFile">当前文件:</label>
			<div id="file-list" style="color: #000; background-color: #fff; border: 1px solid #ccc; padding: 10px; width: 95%; height: 35px; overflow-y: auto;">
				<table style="margin: 0 auto;">
					<c:forEach items="${list }" var="m">
						<tr id="tr_${m.meansID }">
							<td>${m.meansName}</td>
							<td><input type=button onclick="window.location.href='/sharePlatform/means/download?meansID=${m.meansID}&meansName=${m.meansName}';" value="下载"></td>
							<td><input type=button onclick="deleteReg(${m.meansID })" value="删除"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
    </div>
</body>
<script type="text/javascript">

function deleteReg(id){
	var xhr=new XMLHttpRequest();
	var url="/sharePlatform/means/delete?meansID="+id;
	
	xhr.open("post",url,true);		//开启请求
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			//readyState 请求状态
			//status 响应状态
			var resText=xhr.responseText;
			if(resText=="true"){
				alert("删除成功");
			 	var div = document.getElementById("tr_"+id);
			 	div.remove();
			}else{
				alert("删除失败");
			}
		}
	}
	
}
	
</script>
	
</html>