package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.commentService;
import service.impl.commentServiceImpl;
@WebServlet("/comment/delete")
public class CommentDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String commentIdStr=req.getParameter("commentID");
		int commentID=Integer.parseInt(commentIdStr);
		commentService cs=new commentServiceImpl();
		if(cs.delete(commentID)) {
			req.getRequestDispatcher("/article/show").forward(req, resp);
		}else{
			
		}
	}
}
