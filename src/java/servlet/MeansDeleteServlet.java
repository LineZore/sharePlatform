package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.meansService;
import service.impl.meansServiceImpl;
@WebServlet("/means/delete")
public class MeansDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String meansIDStr=req.getParameter("meansID");
		int meansID=Integer.parseInt(meansIDStr);
		meansService ms=new meansServiceImpl();
		if(ms.delete(meansID)) {
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
}
