package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.article;
import service.articleService;
import service.impl.articleServiceImpl;
@WebServlet("/app/admin/check")
public class AdminCheckServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		String flag=req.getParameter("flag");
		int articleID=Integer.parseInt(articleIDStr);
		articleService as=new articleServiceImpl();
		if(as.check(flag, articleID)) {
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
	
}
