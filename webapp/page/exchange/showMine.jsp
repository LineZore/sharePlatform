<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>已购买的文章</title>
    <style>
        h1 {
            font-size: 28px;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            padding-bottom: 50px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        #exit-button {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 10px 20px;
            width: auto;
        }

        table {
            width: 95%;
            margin: 20px auto;
            background-color: white;
            border: 1px solid #ddd;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
            white-space: nowrap;
		    overflow: hidden;
		    overflow-x: auto;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button {
            display: inline-block;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 10px 15px;
            width: 30px;
            text-align: center;
        }

        .button:hover {
            background-color: #555;
        }

        .button.open {
            background-color: #4CAF50;
        }

        .button.edit {
            background-color: #2196F3;
        }

        .button.delete {
            background-color: #f44336;
        }
        
        .centered-button {
    		text-align: center;
		}
    </style>
</head>
<body>
    <button class="button" onclick="window.location.href='/sharePlatform/article/page';" id="exit-button">退出</button>
    <div class="container">
        <h1>已购买的文章</h1>
	    <table>
	        <tr>
	            <th>文章标题</th>
	            <th>作者</th>
	            <th>价格</th>
	            <th>操作</th>
	        </tr>
	        <c:forEach items="${list}" var="list">
	            <tr id="tr_${list.articleID}">
	                <td style="max-width: 400px;">${list.articleTitle}</td>
	                <td>${list.userName}</td>
	                <td>${list.articlePrice}</td>
 					<td class="centered-button" style="width: 100px;">
	                    <input class="button open" onclick="window.location.href='/sharePlatform/article/show?articleID=${list.articleID}';" value="查看">
	                </td>
	            </tr>
	        </c:forEach>
	    </table>
	 </div>
</body>
</html>