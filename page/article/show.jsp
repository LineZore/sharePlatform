<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.PageHelper" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>文章详情</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px;
        }
        .container {
            width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color: #007BFF;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .page-buttons {
            margin-top: 20px;
            text-align: center;
        }
        .page-button {
            padding: 6px 12px;
            margin: 3px;
            border: 1px solid #333;
            background-color: transparent;
            cursor: pointer;
        }
        }
        .page-button:hover {
            background-color: #333;
            color: #fff;
        }
        table {
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
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
        textarea#commentContent {
        	margin-top: 0;
	        width: 70%;
	        max-width: 70%; 
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
    </style>
</head>
<body>
	<button class="button" onclick="window.location.href='/sharePlatform/article/page';" id="exit-button">返回</button>
    <div class="container">
	    <h2 style="text-align: left; margin-top:0">标题: ${article.articleTitle}</h2>
	    <p style="text-align: left;">作者: ${article.userName}</p>
	    <p style="text-align: left;">简介: ${article.articleContent}</p>
	    <p style="text-align: left;">价格: ${article.articlePrice}</p>
        
	<c:if test="${article.userName ne userName}">
		<c:if test="${userType eq 'user' }">
			<c:if test="${buyFlag eq 'false'}">
				<button  onclick="buy()" id="buy" class="button">购买</button>
			</c:if>
			<c:if test="${buyFlag eq 'true'}">
				<button  disabled="disabled" id="buy" class="button">已购买</button>
			</c:if>
		</c:if>
	</c:if>
	
        <c:if test="${userType eq 'admin' }">
	        <c:if test="${article.checkStatus eq 0}">
				<button  class="button" style="background-color: #4CAF50" onclick="window.location.href='/sharePlatform/admin/check?articleID=${article.articleID}&flag=1';"  >审核通过</button>
				<button  class="button" style="background-color: #f44336" onclick="window.location.href='/sharePlatform/admin/check?articleID=${article.articleID}&flag=2';" >审核不通过</button>
			</c:if>
		</c:if>
        
		<c:if test="${not empty list}">
		    <div style="margin-top: 10px">
		        <table style="width: 60%; margin: 0 auto;">
		            <thead>
		                <tr>
		                    <th>附件名</th>
		                    <th>操作</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach items="${list}" var="m">
		                    <tr>
		                        <td>${m.meansName}</td>
		                        <td style="text-align: center; width: 50px">
		                            <input type="button" onclick="window.location.href='/sharePlatform/means/download?meansID=${m.meansID}&meansName=${m.meansName}';" class="button" value="下载" style="background-color: #333;">
		                        </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		    </div>
		</c:if>
		
        <h3 style="text-align: left;">发表评论：</h3>
        <form action="<%=path%>/comment/publish" method="post">
		    <div>
		        <input type="hidden" value="${article.articleID}" id="articleID" name="articleID">
		        <textarea id="commentContent" name="commentContent" rows="4" placeholder="在这里输入评论内容"></textarea>
		    </div>
		    <div>
		        <input type="submit" class="button" value="发表">
		    </div>
        </form>
        
        <h3 style="text-align: left;">评论：</h3>
        <c:if test="${ph.dataCount != 0}">
			<table style="width: 100%;">
			    <thead>
			        <tr>
			            <th>用户名</th>
			            <th>评论内容</th>
			            <th>发布时间</th>
			            <th>操作</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${commentlist}" var="commentlist">
			            <tr>
			                <td style="width: 80px">${commentlist.userName}</td>
			                <td>${commentlist.commentContent}</td>
			                <td style="width: 85px">${commentlist.publishTime}</td>
			                <td style="text-align: center; width: 80px">
								<c:if test="${commentlist.userName == userName || userType eq 'admin'}">
								    <input type="button" onclick="window.location.href='/sharePlatform/comment/delete?commentID=${commentlist.commentID}&articleID=${article.articleID}';" class="button" value="删除" style="background-color: #f44336;">
								</c:if>
			                </td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>
		</c:if>
		<c:if test="${ph.dataCount == 0}">
			<p style="text-align: center;">暂无评论</p>
		</c:if>

        <div class="page-buttons">
            <c:if test="${not empty ph}">
                <c:forEach begin="1" end="${ph.pageCount}" var="page">
                    <button class="page-button" 
                            style="${ph.pageNo == page ? 'background-color: #333; color: #fff;' : ''}"
                            onclick="window.location.href='<%=path%>/article/show?articleID=${article.articleID}&pageNo=${page}'">${page}</button>
                </c:forEach>
            </c:if>
        </div>
    </div>
</body>

<script type="text/javascript">
    function buy() {
        var articleID = document.getElementById("articleID").value;

        var xhr = new XMLHttpRequest();
        var url = "/sharePlatform/exchange/buy?articleID=" + articleID;

        xhr.open("post", url, true);
        xhr.send();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var resText = xhr.responseText;
                if (resText == "true") {
                    document.getElementById("buy").innerText = "已购买";
                    document.getElementById("buy").disabled = true;
                } else {
                    // Handle other cases as needed
                }
            }
        };
    }
</script>
</html>
