package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.commentService;
import service.impl.commentServiceImpl;
@WebServlet("/comment/publish")
public class CommentPublishServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		String commentContent=req.getParameter("commentContent");
		String userName=req.getSession().getAttribute("userName").toString();
		
		commentService cs=new commentServiceImpl();
		if(cs.publish(userName, articleID, commentContent)) {
			req.getRequestDispatcher("/article/show").forward(req, resp);
		}else {
			
		}
		
	}
	
}
