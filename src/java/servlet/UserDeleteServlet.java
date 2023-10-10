package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/delete")
public class UserDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getSession().getAttribute("userName").toString();
		userService us=new userServiceImpl();
		if(us.delete(userName)) {
			req.getSession().setAttribute("userName", null);
			req.getSession().setAttribute("userEmail", null);
			resp.sendRedirect("/sharePlatform/page/user/userIndex.jsp");
		}else {
			
		}
	}
	
}
