package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import entity.article;
import entity.comment;
import service.articleService;
import service.commentService;
import service.impl.articleServiceImpl;
import service.impl.commentServiceImpl;
import util.PageHelper;
@WebServlet("/app/comment/get")
public class CommentGetServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		
		commentService cs=new commentServiceImpl();
		
		List<comment> list=cs.getByPage(articleID,1, cs.getCount(articleID));
		String jsonStr = JSONObject.toJSONString(list);
		resp.getWriter().print(jsonStr);
	}
}
