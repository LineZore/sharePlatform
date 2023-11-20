<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.PageHelper" %>
<% String path = request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }
        .container {
            width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .header {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            margin-top: 20px;
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

        .page-buttons {
            margin-top: 20px;
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
        .action-buttons {
            margin-top: 10px;
            display: flex;
            justify-content: center;
        }
        .right-buttons {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .button.open {
            background-color: #333;
        }
        .centered-button {
    		text-align: center;
		}
        
    </style>
</head>
<body>
	<button class="button" onclick="window.location.href='<%=path%>/user/exit';" id="exit-button" style="position: absolute; top: 10px; left: 10px; background-color: #333; color: white; border: none; border-radius: 5px; cursor: pointer; padding: 10px 20px;">登出</button>
    <div class="container">
        <div class="right-buttons">
        	<button class="button" onclick="window.location.href='/sharePlatform/page/user/modify.jsp';">编辑资料</button>
        </div>
        <div class="header">登录成功 - 欢迎您，<%= session.getAttribute("userName").toString() %></div>
        <div class="header">剩余积分： <%out.print(session.getAttribute("userIntegral").toString()); %></div>
        <div class="action-buttons">
            <button class="button" onclick="window.location.href='/sharePlatform/page/article/publish.jsp';">发布文章</button>
            <button class="button" onclick="window.location.href='/sharePlatform/article/getUser';">我的文章</button>
            <c:if test="${userType eq 'user'}">
            	<button class="button" onclick="window.location.href='/sharePlatform/exchange/getUser';">已购买的文章</button>
            </c:if>
        	<c:if test="${userType eq 'admin'}">
				<button class="button" onclick="window.location.href='/sharePlatform/admin/getCheck';" >待审核的文章</button>
			</c:if>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>标题</th>
                    <th>作者</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="item">
                    <tr>
                        <td style="max-width: 400px;">${item.articleTitle}</td>
                        <td style="width: 140px;">${item.userName}</td>
                        <td style="width: 140px;">${item.articlePrice}</td>
                        <td class="centered-button" style="width: 80px;">
    						<button class="button open" onclick="window.location.href='/sharePlatform/article/show?articleID=${item.articleID}';">查看</button>
						</td>                    
					</tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="page-buttons">
            <c:if test="${not empty ph}">
                <c:forEach begin="1" end="${ph.pageCount}" var="page">
                    <button class="page-button" 
                            style="${ph.pageNo == page ? 'background-color: #333; color: #fff;' : ''}"
                            onclick="window.location.href='<%=path%>/article/page?pageNo=${page}';">${page}</button>
                </c:forEach>
            </c:if>
        </div>
    </div>
</body>
</html>
