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
import service.articleService;
import service.impl.articleServiceImpl;
@WebServlet("/app/admin/getCheck")
public class AdminGetCheckServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		articleService as=new articleServiceImpl();
		List<article> list=as.getByCheck();
		String jsonStr = JSONObject.toJSONString(list);
		resp.getWriter().print(jsonStr);
	}
	
}
