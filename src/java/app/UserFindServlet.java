package app;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.user;
import service.userService;
import service.impl.userServiceImpl;
import util.EmailUtil;

@WebServlet("/app/user/find")
public class UserFindServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vcode=req.getParameter("vcode");
		String svcode=req.getSession().getAttribute("vcode").toString();
		
		if(vcode.equals(svcode)) {
			String userEmail=req.getParameter("userEmail");
			userService us=new userServiceImpl();
			user u=us.find(userEmail);
			String userName=u.getUserName();
			String userPassword=u.getUserPassword();
			if(userPassword==null)
			{
				resp.getWriter().print(false);
			}else {
				String context="尊敬的用户您好，您正在找回本平台账号"+userName+"的密码，您的密码为：";
				
				EmailUtil eu=new EmailUtil();
				eu.sendVerificationEmail(userEmail, context+userPassword);
				resp.getWriter().print(true);
			}
			
		}else {
			resp.getWriter().print("验证码错误");
		}
		
		
	}
}
