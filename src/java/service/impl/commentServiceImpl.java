package service.impl;

import java.util.List;

import dao.commentDao;
import dao.impl.commentDaoImpl;
import entity.comment;
import service.commentService;

public class commentServiceImpl implements commentService{

	commentDao cd=new commentDaoImpl();
	
	@Override
	public boolean publish(String userName, int articleID, String commentContent) {
		return cd.publish(userName, articleID, commentContent);
	}

	@Override
	public List<comment> getByPage(int articleID, int pageNo, int pageSize) {
		return cd.getByPage(articleID, pageNo, pageSize);
	}

	@Override
	public int getCount(int articleID) {
		return cd.getCount(articleID);
	}
	@Override
	public boolean delete(int commentID) {
		return cd.delete(commentID);
	}

	

}
