package service;

import java.util.List;

import entity.means;

public interface meansService {
	public boolean addMeans(int articleID,String meansName);
	//�������
	public int findMeans(int articleID,String meansName);
	//��������ID
	public boolean addMeansURL(int meansID,String meansURL);
	public List<means> getAll(int articleID);
	public boolean delete(int meansID);
}
