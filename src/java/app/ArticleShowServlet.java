package app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import entity.article;
import service.articleService;
import service.exchangeService;
import service.impl.articleServiceImpl;
import service.impl.exchangeServiceImpl;
@WebServlet("/app/article/show")
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
		
		String userName=req.getSession().getAttribute("userName").toString();
		
		exchangeService es=new exchangeServiceImpl();
		if(userName.equals(art.getUserName())) {
			resp.getWriter().print("3"+art.getArticleContent());		//是自己写的返回3
		}else if(es.query(userName, articleID)){
			resp.getWriter().print("2"+art.getArticleContent());		//已购买返回2
		}else {
			resp.getWriter().print("1"+art.getArticleContent());		//都不是返回1
		}
	}
}
