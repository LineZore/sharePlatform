package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/modify")
public class ModifyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String modifyName=req.getParameter("modifyName");
		String modifyPassword=req.getParameter("modifyPassword");
		String modifyEmail=req.getParameter("modifyEmail");
		String userName=req.getSession().getAttribute("userName").toString();
		userService us=new userServiceImpl();
		if(us.modify(userName, modifyName, modifyPassword, modifyEmail)) {
			req.getRequestDispatcher("/page/user/loginSuccess.jsp").forward(req, resp);
		}else {
			
		}
		
	}
}
