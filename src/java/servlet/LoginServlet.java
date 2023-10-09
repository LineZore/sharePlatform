package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getParameter("userName");
		String userPassword=req.getParameter("userPassword");
		userService us=new userServiceImpl();
		if(us.login(userName, userPassword)) {
			req.getSession().setAttribute("userName", userName);
			req.getRequestDispatcher("page/user/loginSuccess.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("page/user/loginFail.jsp").forward(req, resp);
		}
	}
}
