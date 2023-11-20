package app;

import java.io.IOException;

import javax.print.DocFlavor.STRING;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.article;
import service.articleService;
import service.impl.articleServiceImpl;
@WebServlet("/app/article/modify")
public class ArticleModifyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		System.out.print("1");
		System.out.print(articleIDStr);
		int articleID=Integer.parseInt(articleIDStr);
		String articleTitle=req.getParameter("articleTitle");
		String articleContent=req.getParameter("articleContent");
		String articlePriceStr=req.getParameter("articlePrice");
		float articlePrice=0;
		if(articlePriceStr!=null&&articlePriceStr!="") {
			articlePrice=Float.parseFloat(articlePriceStr);
		}
		articleService as=new articleServiceImpl();
		if(as.modify(articleID, articleTitle, articleContent, articlePrice)) {
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
		
	}
}
