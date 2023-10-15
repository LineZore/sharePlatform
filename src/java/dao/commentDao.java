package dao;

import java.util.List;

import entity.comment;

public interface commentDao   {
	
	public boolean publish(String userName,int articleID,String commentContent);
	//发布评论
	
	public List<comment> getByPage(int articleID,int pageNo,int pageSize);
	//查询文章的所有评论
	
	public int getCount(int articleID);
	//获取评论总数
	
	public boolean delete(int commentID);
	//删除评论
}
