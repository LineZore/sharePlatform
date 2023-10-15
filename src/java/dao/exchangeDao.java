package dao;

import java.util.List;

public interface exchangeDao {
	public boolean add(String userName,int articleID) ;
	//添加兑换
	public boolean query(String userName,int articleID);
	//查询是否购买
	public List<Integer>  find(String userName);
	//查询所有购买的文章id
}
