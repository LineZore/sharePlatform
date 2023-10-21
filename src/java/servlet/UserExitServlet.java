package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/exit")
public class UserExitServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().setAttribute("userName", null);
		req.getSession().setAttribute("userEmail", null);
		req.getSession().setAttribute("userIntegral", null);
		req.getSession().setAttribute("userType", null);
		resp.sendRedirect("/sharePlatform/page/user/userIndex.jsp");
	}
	
}
