package dao;

import java.util.List;

import entity.means;

public interface meansDao {
	public boolean addMeans(int articleID,String meansName);
	//�������
	public int findMeans(int articleID,String meansName);
	//��������ID
	public boolean addMeansURL(int meansID,String meansURL);
	//�������URL
	public List<means> getAll(int articleID);
	//��ѯ��������
	public boolean delete(int meansID);
	//ɾ������
}
