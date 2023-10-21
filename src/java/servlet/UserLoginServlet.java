package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.user;
import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet{

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
		user u=us.login(userName, userPassword);
		if(u.getUserName()!=null) {
			req.getSession().setAttribute("user", u);
			req.getSession().setAttribute("userName", u.getUserName());
			req.getSession().setAttribute("userEmail", u.getUserEmail());
			req.getSession().setAttribute("userIntegral", u.getUserIntegral());
			req.getSession().setAttribute("userType", u.getUserType());
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
}
