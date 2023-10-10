package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/find")
public class UserFindServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getParameter("userName");
		String userEmail=req.getParameter("userEmail");
		userService us=new userServiceImpl();
		String userPassword=us.find(userName, userEmail);
		if(userPassword==null)
		{
			req.getRequestDispatcher("/page/user/find.jsp").forward(req, resp);
		}else {
			req.setAttribute("userPassword", userPassword);
			req.getRequestDispatcher("/page/user/findResult.jsp").forward(req, resp);
		}
	}
}
