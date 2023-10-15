package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.article;
import service.articleService;
import service.exchangeService;
import service.impl.articleServiceImpl;
import service.impl.exchangeServiceImpl;
@WebServlet("/article/show")
public class ArticleShowServlet extends HttpServlet{

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
		article art= as.findContent(articleID);
		req.setAttribute("article", art);
		
		String userName=req.getSession().getAttribute("userName").toString();
		exchangeService es=new exchangeServiceImpl();
		if(es.query(userName, articleID)) {
			req.setAttribute("buyFlag", "true");
		}else {
			req.setAttribute("buyFlag", "false");
		}
		
		req.getRequestDispatcher("/means/get").forward(req, resp);
		
	}
}
