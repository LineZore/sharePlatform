package service;

import java.util.List;

import entity.comment;

public interface commentService {

	public boolean publish(String userName,int articleID,String commentContent);
	//��������
	
	public List<comment> getByPage(int articleID,int pageNo,int pageSize);
	//��ѯ���µ���������
	public int getCount(int articleID);
	public boolean delete(int commentID);
	public boolean checkDelete(int commentID,String userName);
}
