package dao;

import java.util.List;

import entity.means;

public interface meansDao {
	public boolean addMeans(int articleID,String meansName);
	//添加资料
	public int findMeans(int articleID,String meansName);
	//查找资料ID
	public boolean addMeansURL(int meansID,String meansURL);
	//添加资料URL
	public List<means> getAll(int articleID);
	//查询所有资料
	public boolean delete(int meansID);
	//删除资料
}
