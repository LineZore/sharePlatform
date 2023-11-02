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
			<div id="file-list" style="color: #000; background-color: #fff; border: 1px solid #ccc; padding: 10px; width: 95%; height: 35px; overflow-y: auto;">
			    <!-- 已上传文件列表 -->
			</div>
            <input type="submit" value="提交">
        </form>
    </div>
    <script>
        // 获取文件拖拽区域
        const dropZone = document.getElementById('drop-zone');
        
        // 获取文件输入字段
        const fileInput = document.getElementById('articleFile');
        
        // 获取已上传文件列表容器
        const fileListContainer = document.getElementById('file-list');
        
        // 在拖拽区域上添加拖拽事件监听器
        dropZone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.style.borderColor = '#007BFF'; // 当拖拽时改变边框颜色
        });
        
        dropZone.addEventListener('dragleave', () => {
            dropZone.style.borderColor = '#ddd'; // 拖拽离开时恢复默认边框颜色
        });
        
        fileInput.addEventListener('change', (e) => {
            const files = fileInput.files; // 获取已选择的文件

            // 遍历已选择的文件并显示在列表中
            for (const file of files) {
                const listItem = document.createElement('div');
                listItem.textContent = file.name;
                fileListContainer.appendChild(listItem);
            }

            // 这里可以将文件上传的其他逻辑，比如使用 XMLHttpRequest 或 Fetch API 将文件上传到服务器
        });
        
        // 在点击拖拽区域时触发文件输入字段的点击事件
        dropZone.addEventListener('click', () => {
            fileInput.click();
        });
        
        const form = document.getElementById('form1');
        const titleInput = document.getElementById('articleTitle');
        const contentInput = document.getElementById('articleContent');
        const priceInput = document.getElementById('articlePrice');

        form.addEventListener('submit', (e) => {
            // 标题和简介不能为空
            if (titleInput.value.trim() === '' || contentInput.value.trim() === '' || priceInput.value.trim() === '') {
                e.preventDefault(); // 阻止表单提交

                alert('标题、简介和价格不能为空');
            	return false;
            }

            // 价格验证规则：必须为数字，最多一位小数，不能为负数
            const pricePattern = /^\d+(\.\d{1})?$/;
            const price = priceInput.value;

            if (!pricePattern.test(price) || parseFloat(price) < 0) {
                e.preventDefault(); // 阻止表单提交

                alert('价格必须为数字，最多一位小数，不能为负数');
            }
        });
    </script>
</body>
</html>