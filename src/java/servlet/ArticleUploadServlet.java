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



@WebServlet("/article/upload")
public class ArticleUploadServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            // FileItem �Ǳ��е�ÿһ��Ԫ�صķ�װ
            // ����һ�� FileItem �Ĺ�����
            FileItemFactory factory = new DiskFileItemFactory();
            // ����һ���ļ��ϴ���������װ�����ģʽ��
            ServletFileUpload upload = new ServletFileUpload(factory);
            // ��������
            List<FileItem> items = upload.parseRequest(req);
            for (FileItem fileItem :
                    items) {
                if (fileItem.isFormField()) {
                } else {
                	String fileUpName=fileItem.getName();
                    fileItem.write(new File("D:\\eclipse\\workspace\\sharePlatform\\file", fileUpName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
}
