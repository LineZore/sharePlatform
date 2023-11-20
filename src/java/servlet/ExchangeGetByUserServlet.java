package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.article;
import service.articleService;
import service.exchangeService;
import service.impl.articleServiceImpl;
import service.impl.exchangeServiceImpl;
@WebServlet("/exchange/getUser")
public class ExchangeGetByUserServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getSession().getAttribute("userName").toString();
		exchangeService es=new exchangeServiceImpl();
		List<Integer> intList= es.find(userName);
		List<article> list=null;
		if(intList.isEmpty()) {
			
		}else {
			articleService as=new articleServiceImpl();
			list=as.getByArray(intList);
			
		}
		req.setAttribute("list", list);
		req.getRequestDispatcher("/page/exchange/showMine.jsp").forward(req, resp);

	}
}
