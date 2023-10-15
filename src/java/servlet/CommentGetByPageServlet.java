package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.article;
import entity.comment;
import service.articleService;
import service.commentService;
import service.impl.articleServiceImpl;
import service.impl.commentServiceImpl;
import util.PageHelper;
@WebServlet("/comment/getPage")
public class CommentGetByPageServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNoStr=req.getParameter("pageNo");
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		
		if(pageNoStr==null) {
			pageNoStr="1";
		}
		
		commentService cs=new commentServiceImpl();
		
		PageHelper ph=new PageHelper();
		ph.setPageNo(Integer.parseInt(pageNoStr));
		ph.setPageSize(10);//每页10个数据
		ph.setDataCount(cs.getCount(articleID));
		int pageCount=ph.getPageCount();
		ph.setPageCount(pageCount);
		
		List<comment> list=cs.getByPage(articleID,ph.getPageNo(), ph.getPageSize());
		req.setAttribute("commentlist", list);
		req.setAttribute("ph", ph);
		
		req.getRequestDispatcher("/page/article/show.jsp").forward(req, resp);
	}
}
