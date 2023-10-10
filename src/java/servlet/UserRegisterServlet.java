package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/register")
public class UserRegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getParameter("userName");
		String userPassword=req.getParameter("userPassword");
		String userEmail=req.getParameter("userEmail");
		userService us=new userServiceImpl();
		if(us.register(userName, userPassword,userEmail)) {
			req.getRequestDispatcher("/page/user/registerSuccess.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/page/user/register.jsp").forward(req, resp);
		}
	}
}
