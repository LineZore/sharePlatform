package app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.articleService;
import service.impl.articleServiceImpl;
@WebServlet("/app/article/delete")
public class ArticleDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		articleService as=new articleServiceImpl();
		String userType=req.getSession().getAttribute("userType").toString();
		String userName=req.getSession().getAttribute("userName").toString();
		if(userType.equals("admin")||as.checkDelete(articleID, userName)) {
			
			
			if(as.delete(articleID)) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}
		else {
			resp.getWriter().print("ÎÞÈ¨ÏÞ");
		}
	}
}
