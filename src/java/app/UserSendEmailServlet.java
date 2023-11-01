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
			context="�𾴵��û����ã�������ע�᱾ƽ̨���˺ţ���֤��Ϊ��";
			if(us.checkByEmail(userEmail)!=0) {
				resp.getWriter().print("�����Ѵ���");
				return ;
			}
		}else if(flag.equals("find")) {
			context="�𾴵��û����ã��������һر�ƽ̨���˺ţ���֤��Ϊ��";
			if(us.checkByEmail(userEmail)==0) {
				resp.getWriter().print("���䲻����");
				return ;
			}
		}else if(flag.equals("modify")) {
			context="�𾴵��û����ã��������޸ı�ƽ̨���˺ţ���֤��Ϊ��";
			if(us.checkByEmail(userEmail)!=0) {
				resp.getWriter().print("�����Ѵ���");
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
