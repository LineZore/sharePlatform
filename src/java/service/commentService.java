package service;

import java.util.List;

import entity.comment;

public interface commentService {

	public boolean publish(String userName,int articleID,String commentContent);
	//发布评论
	
	public List<comment> getByPage(int articleID,int pageNo,int pageSize);
	//查询文章的所有评论
	public int getCount(int articleID);
	public boolean delete(int commentID);
	public boolean checkDelete(int commentID,String userName);
}
