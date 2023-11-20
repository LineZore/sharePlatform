<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布文章</title>
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
            border-radius: 5px;
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
        <form action="<%=path%>/article/publish" method="post" enctype="multipart/form-data" id="form1">
            <label for="articleTitle">标题:</label>
            <input type="text" id="articleTitle" name="articleTitle">
            <label for="articleContent">简介:</label>
            <textarea id="articleContent" name="articleContent" rows="10"></textarea>
            <label for="articlePrice">价格:</label>
            <input type="text" id="articlePrice" name="articlePrice">
            <label for="articleFile">上传文件:</label>
            <div id="drop-zone">
                <svg class="folder-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="none" stroke="#000000" stroke-width="2" d="M2,10 L2,6 L2,2 L10,2 L13,6 L22,6 L22,10 L2,10 Z M2,14 L22,14 L22,22 L2,22 L2,14 Z"></path></svg>
                <p class="drop-text">点击或拖拽即可上传文件</p>
                <input type="file" id="articleFile" name="file" multiple style="display: none;">
            </div>
            <label for="articleFile">已上传文件:</label>
            <div id="file-list"></div>
            <button type="button" id="clearFilesButton">清空已上传文件</button>
            <input type="submit" value="提交">
        </form>
    </div>
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
	   
	   const form = document.getElementById('form1');
	   const titleInput = document.getElementById('articleTitle');
	   const contentInput = document.getElementById('articleContent');
	   const priceInput = document.getElementById('articlePrice');
	
	   form.addEventListener('submit', (e) => {
	       if (titleInput.value.trim() === '' || contentInput.value.trim() === '' || priceInput.value.trim() === '') {
	           e.preventDefault();
	           alert('标题、简介和价格不能为空');
	           return false;
	       }
	
	       const pricePattern = /^\d+(\.\d{1})?$/;
	       const price = priceInput.value;
	
	       if (!pricePattern.test(price) || parseFloat(price) < 0) {
	           e.preventDefault();
	           alert('价格必须为数字，最多一位小数，不能为负数');
	           
	       }
	   });
</script>
</body>
</html>
