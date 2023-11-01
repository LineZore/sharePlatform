package app;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import com.alibaba.fastjson.JSONObject;

import entity.means;
import service.meansService;
import service.impl.meansServiceImpl;
@WebServlet("/app/means/get")
public class MeansGetAllServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		
		meansService ms=new meansServiceImpl();
		List<means> list= ms.getAll(articleID);
		String jsonStr = JSONObject.toJSONString(list);
		resp.getWriter().print(jsonStr);
	}
}
