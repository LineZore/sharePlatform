package app;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import service.articleService;
import service.meansService;
import service.impl.articleServiceImpl;
import service.impl.meansServiceImpl;

@WebServlet("/app/article/publish")
public class ArticlePublishServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			String userName=req.getSession().getAttribute("userName").toString();
        	String articleTitle=req.getParameter("articleTitle");
        	String articleContent=req.getParameter("articleContent");
        	String ap=req.getParameter("articlePrice");
        	float articlePrice=Float.parseFloat(ap);
        	if(articlePrice<0) {
        		resp.getWriter().print(false);
        	}
        	
    		articleService as=new articleServiceImpl();
    		if(as.publish(userName,articleTitle, articleContent, articlePrice)) {
    		
    			resp.getWriter().print(true);
    		}else {
    			resp.getWriter().print(false);
    		}
			
	}
}
