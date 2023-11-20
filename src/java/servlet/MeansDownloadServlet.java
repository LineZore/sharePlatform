package servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.articleService;
import service.exchangeService;
import service.impl.articleServiceImpl;
import service.impl.exchangeServiceImpl;
@WebServlet("/means/download")
public class MeansDownloadServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName=req.getSession().getAttribute("userName").toString();
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		exchangeService es=new exchangeServiceImpl();
		articleService as=new articleServiceImpl();
		
		if(es.query(userName, articleID)||as.findName(articleID).equals(userName)||userName.equals("admin")) {
			String meansID=req.getParameter("meansID");
			String meansName=req.getParameter("meansName");
			String path="D:\\eclipse\\workspace\\sharePlatform\\file\\";
			File f = new File(path, meansID);
			if(f.exists()&&f.isFile()) {
				resp.setHeader("content-disposition", "attachment;filename=" +URLEncoder.encode(meansName, "UTF-8"));
				ServletOutputStream out = resp.getOutputStream();
		        // 将文件复制到输出流中，响应给浏览器
		        Files.copy(Paths.get(f.getAbsolutePath()), out);
			}
		}else {
			resp.getWriter().print(false);
		}
		
        
	}
	
}
