package dao;

import java.util.List;

import entity.comment;

public interface commentDao   {
	
	public boolean publish(String userName,int articleID,String commentContent);
	//��������
	
	public List<comment> getByPage(int articleID,int pageNo,int pageSize);
	//��ѯ���µ���������
	
	public int getCount(int articleID);
	//��ȡ��������
	
	public boolean delete(int commentID);
	//ɾ������
}
