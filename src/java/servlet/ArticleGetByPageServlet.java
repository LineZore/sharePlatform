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
import util.PageHelper;
@WebServlet("/article/page")
public class ArticleGetByPageServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNoStr=req.getParameter("pageNo");
		if(pageNoStr==null) {
			pageNoStr="1";
		}
		articleService as=new articleServiceImpl();
		PageHelper ph=new PageHelper();
		ph.setPageNo(Integer.parseInt(pageNoStr));
		ph.setPageSize(10);//每页10个数据
		ph.setDataCount(as.getCount());
		int pageCount=ph.getPageCount();
		ph.setPageCount(pageCount);
		
		List<article> list=as.getByPage(ph.getPageNo(), ph.getPageSize());
		req.setAttribute("list", list);
		req.setAttribute("ph", ph);
		req.getRequestDispatcher("/page/user/loginSuccess.jsp").forward(req, resp);
	}
	
}
