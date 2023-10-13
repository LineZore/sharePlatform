package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import service.meansService;
import service.impl.meansServiceImpl;



@WebServlet("/means/upload")
public class MeansUploadServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String articleIDStr=req.getParameter("articleID");
		int articleID=Integer.parseInt(articleIDStr);
		try {
		    // 创建一个 FileItem 的工厂类
		    FileItemFactory factory = new DiskFileItemFactory();
		    // 创建一个文件上传处理器（装饰设计模式）
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    // 解析请求
		    List<FileItem> items = upload.parseRequest(req);
		    
		    for (FileItem fileItem:items) {
		        if (fileItem.isFormField()) {
		        } else {
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
    		req.getRequestDispatcher("/article/show?articleID="+articleID+"&showType=modify").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
}
