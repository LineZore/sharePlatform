package servlet;

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

@WebServlet("/article/publish")
public class ArticlePublishServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			int articleID=0;
			String userName=req.getSession().getAttribute("userName").toString();
        	String articleTitle="";
        	String articleContent="";
        	String ap="";
        	float articlePrice=0;
        	int flag=1;
			try {
			    // 创建一个 FileItem 的工厂类
			    FileItemFactory factory = new DiskFileItemFactory();
			    // 创建一个文件上传处理器（装饰设计模式）
			    ServletFileUpload upload = new ServletFileUpload(factory);
			    // 解析请求
			    List<FileItem> items = upload.parseRequest(req);
			    
			    for (FileItem fileItem:items) {
			        if (fileItem.isFormField()) {
			        	String value = fileItem.getString("UTF-8");
			        	if(fileItem.getFieldName().equals("articleTitle")) {
			        		articleTitle=value;
			        	}else if(fileItem.getFieldName().equals("articleContent")) {
			        		articleContent=value;
			        	}else if(fileItem.getFieldName().equals("articlePrice")) {
			        		ap=value;
			        		articlePrice=Float.parseFloat(ap);
			        	}
			        	
			        } else {
			        	if(flag==1) {
			        		articleService as=new articleServiceImpl();
				    		if(as.publish(userName,articleTitle, articleContent, articlePrice)) {
				    			articleID=as.find(articleTitle);
				    		}
				    		flag=0;
			        	}
			        	String fileUpName=fileItem.getName();
			        	if(fileUpName!=null&&fileUpName!="") {
				        	meansService ms=new meansServiceImpl();
				        	if(ms.addMeans(articleID, fileUpName)) {
					        	int meansID=ms.findMeans(articleID, fileUpName);
					        	ms.addMeansURL(meansID, "D:\\eclipse\\workspace\\sharePlatform\\file\\"+meansID);
					        	
					            fileItem.write(new File("D:\\eclipse\\workspace\\sharePlatform\\file", Integer.toString(meansID)));
					            
				        	}
				        	else {
				        	}
			        	}
			        }
			    }
		        req.getRequestDispatcher("/article/page").forward(req, resp);		

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

			
	}
}
