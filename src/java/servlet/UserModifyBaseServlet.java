package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/modifyBase")
public class UserModifyBaseServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String modifyName=req.getParameter("modifyName");
		String modifyEmail=req.getParameter("modifyEmail");
		String userName=req.getSession().getAttribute("userName").toString();
		userService us=new userServiceImpl();
		if(us.modifyBase(userName, modifyName, modifyEmail)) {
			req.getSession().setAttribute("userName", modifyName);
			req.getSession().setAttribute("userEmail", modifyEmail);
			
			req.getRequestDispatcher("/page/user/loginSuccess.jsp").forward(req, resp);
		}else {
			
		}
		
	}
}
