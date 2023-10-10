package servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.EmailUtil;
@WebServlet("/user/send")
public class UserSendEmailServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail=req.getParameter("userEmail");
		String context="尊敬的用户您好，您正在注册本平台的账号，注册验证码为：";
		
		Random randObj = new Random();
		String vcode=Integer.toString(100000 + randObj.nextInt(900000));
		req.getSession().setAttribute("vcode", vcode);
		EmailUtil eu=new EmailUtil();
		eu.sendVerificationEmail(userEmail, context+vcode);
		
		resp.getWriter().print(true);
	}
}
