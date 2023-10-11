package servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;
import util.EmailUtil;

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
			resp.getWriter().print(false);
		}else {
			String context="尊敬的用户您好，您正在找回本平台账号"+userName+"的密码，您的密码为：";
			
			EmailUtil eu=new EmailUtil();
			eu.sendVerificationEmail(userEmail, context+userPassword);
			resp.getWriter().print(true);
		}
	}
}
