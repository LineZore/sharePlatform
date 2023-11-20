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
		if(req.getSession().getAttribute("vregisterFlag").toString().equals("true")) {
			if(req.getSession().getAttribute("userEmail").toString().equals(userEmail)) {
				
				userService us=new userServiceImpl();
				if(us.register(userName, userPassword,userEmail)) {
					req.getSession().setAttribute("vregisterFlag",null);
					req.getSession().setAttribute("vcode",null);
					resp.getWriter().print(true);
	
				}else {
					resp.getWriter().print(false);
	
				}
			}else {
				resp.getWriter().print(false);
			}
			
		}else {
			resp.getWriter().print(false);
		}
		
	}
}
