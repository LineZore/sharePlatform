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
import service.userService;
import service.impl.articleServiceImpl;
import service.impl.exchangeServiceImpl;
import service.impl.userServiceImpl;
@WebServlet("/exchange/buy")
public class ExchangeBuyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userName=req.getSession().getAttribute("userName").toString();
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		
		
		articleService as=new articleServiceImpl();
		article art=as.findContent(articleID);
		
		userService us=new userServiceImpl();
		float userIntegral=us.findIntegral(userName);
		float orderIntegral=us.findIntegral(art.getUserName());
		
		if(userIntegral>=userIntegral) {
			us.modifyIntegral(userName, userIntegral-art.getArticlePrice());
			req.getSession().setAttribute("userInteger", userIntegral-art.getArticlePrice());
			us.modifyIntegral(art.getUserName(), orderIntegral+art.getArticlePrice());
			
			exchangeService es=new exchangeServiceImpl();
			if(es.add(userName, articleID)) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}
		else {
			resp.getWriter().print("Óà¶î²»×ã");
		}
	}
}
