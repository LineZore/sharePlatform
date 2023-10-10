package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.userService;
import service.impl.userServiceImpl;

@WebServlet("/user/checkEmail")
public class UserCheckByEmailServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail=req.getParameter("userEmail");
		userService us=new userServiceImpl();
		String originEmail=req.getSession().getAttribute("userEmail").toString();
		if(originEmail==null) {
			if(us.checkByEmail(userEmail)==0) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}else {
			if((us.checkByEmail(userEmail)==0)||userEmail.equals(originEmail)) {
				resp.getWriter().print(true);
			}else {
				resp.getWriter().print(false);
			}
		}
		resp.getWriter().flush();

	}
}
