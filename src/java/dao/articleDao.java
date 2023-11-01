package dao;

import java.util.List;

import entity.article;

public interface articleDao {
	public boolean publish(String userName,String articleTitle,String articleContent,float articlePrice) ;
	//��������
	public int find(String articleTitle);
	//��ѯ����ID
	public List<article> getByPage(int pageNo,int pageSize);
	//��ҳ��������
	public int getCount();
	//��ȡ��������
	public article findContent(int articleID);
	//������������
	public List<article> getByUser(String userName);
	//���û�����������
	public boolean modify(int articleID,String articleTitle,String articleContent,float articlePrice);
	//�޸��ı�
	public boolean delete(int articleID);
	//ɾ��
	public float findPrice(int articleID);
	
	public List<article> getByArray(List<Integer> articleIDList);
	
	public List<article> getByCheck();
	//��ѯ���д���˵�����
	public boolean check(String flag,int articleID);
	//���ͨ��
}
