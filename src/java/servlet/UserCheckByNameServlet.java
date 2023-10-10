package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/checkName")
public class UserCheckByNameServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getParameter("userName");
		userService us=new userServiceImpl();
		Object originName=req.getSession().getAttribute("userName");
		if(originName==null) {
			if(us.checkByName(userName)==0) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}else {
			if((us.checkByName(userName)==0)||userName.equals(originName.toString())) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}
		
		resp.getWriter().flush();
	}
	
}
