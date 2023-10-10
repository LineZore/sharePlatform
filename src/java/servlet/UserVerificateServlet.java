package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.EmailUtil;
@WebServlet("/user/verificate")
public class UserVerificateServlet extends HttpServlet{

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
			req.getSession().setAttribute("vcodeFlag", "true");
			resp.getWriter().print(true);
		}else {
			resp.getWriter().print(false);
		}
	}
}
