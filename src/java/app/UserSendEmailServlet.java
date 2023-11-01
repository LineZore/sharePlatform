package app;

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
@WebServlet("/app/user/send")
public class UserSendEmailServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail=req.getParameter("userEmail");
		
		userService us=new userServiceImpl();
		
		String flag=req.getParameter("vType");
		String context="";
		
		if(flag.equals("register")) {
			context="尊敬的用户您好，您正在注册本平台的账号，验证码为：";
			if(us.checkByEmail(userEmail)!=0) {
				resp.getWriter().print("邮箱已存在");
				return ;
			}
		}else if(flag.equals("find")) {
			context="尊敬的用户您好，您正在找回本平台的账号，验证码为：";
			if(us.checkByEmail(userEmail)==0) {
				resp.getWriter().print("邮箱不存在");
				return ;
			}
		}else if(flag.equals("modify")) {
			context="尊敬的用户您好，您正在修改本平台的账号，验证码为：";
			if(us.checkByEmail(userEmail)!=0) {
				resp.getWriter().print("邮箱已存在");
				return ;
			}
		}else {
			resp.getWriter().print("vTypeError");
			return;
		}
		
		Random randObj = new Random();
		String vcode=Integer.toString(100000 + randObj.nextInt(900000));
		req.getSession().setAttribute("vcode", vcode);
		EmailUtil eu=new EmailUtil();
		if(eu.sendVerificationEmail(userEmail, context+vcode)) {
			req.getSession().setAttribute("userEmail", userEmail);
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
}
