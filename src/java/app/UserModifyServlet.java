package app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/app/user/modify")
public class UserModifyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String modifyType=req.getParameter("modifyType");
		if(modifyType.equals("base")) {
			String modifyName=req.getParameter("modifyName");
			userService us=new userServiceImpl();
			if(us.checkByName(modifyName)!=0) {
				resp.getWriter().print("用户名已存在");
			}
			else {
				String userName=req.getSession().getAttribute("userName").toString();
				if(us.modifyBase(userName, modifyName)) {
					req.getSession().setAttribute("userName", modifyName);
					resp.getWriter().print(true);
				}else {
					resp.getWriter().print(false);
		
				}
			}
			
		}else if(modifyType.equals("password")) {
			String modifyPassword=req.getParameter("modifyPassword");
			String userPassword=req.getParameter("userPassword");
			String userName=req.getSession().getAttribute("userName").toString();
			userService us=new userServiceImpl();
			
			if(us.modifyPassword(userName, userPassword, modifyPassword)) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}else if(modifyType.equals("email")) {
			String modifyEmail=req.getParameter("modifyEmail");
			String userName=req.getSession().getAttribute("userName").toString();
			String vcode=req.getParameter("vcode");
			
			
			if(modifyEmail.equals(req.getSession().getAttribute("userEmail").toString())) {
				if(req.getSession().getAttribute("vcode").toString().equals(vcode)) {
					userService us=new userServiceImpl();
					if(us.modifyEmail(userName, modifyEmail)) {
						req.getSession().setAttribute("userEmail", modifyEmail);
						
						resp.getWriter().print(true);
					}else {
						resp.getWriter().print(false);
					}
				}else {
					resp.getWriter().print("验证码错误");
				}
			}else {
				resp.getWriter().print("邮箱不一致");
			}
			
		}else {
			resp.getWriter().print("typeError");
		}
			
		
	}
}
