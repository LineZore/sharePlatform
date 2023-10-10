package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;
@WebServlet("/user/modifyPassword")
public class UserModifyPasswordServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String modifyPassword=req.getParameter("modifyPassword");
		String userPassword=req.getParameter("userPassword");
		String userName=req.getSession().getAttribute("userName").toString();
		userService us=new userServiceImpl();
		if(us.modifyPassword(userName, userPassword, modifyPassword)) {
			req.getRequestDispatcher("/page/user/loginSuccess.jsp").forward(req, resp);
		}else {
			
		}
	}
}
