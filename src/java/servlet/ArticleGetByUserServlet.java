package servlet;

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
@WebServlet("/article/getUser")
public class ArticleGetByUserServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getSession().getAttribute("userName").toString();
		articleService as=new articleServiceImpl();
		List<article> list=as.getByUser(userName);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/page/article/showMine.jsp").forward(req, resp);
	}
}
