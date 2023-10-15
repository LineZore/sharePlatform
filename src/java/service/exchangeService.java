package service;

import java.util.List;

public interface exchangeService {
	public boolean add(String userName,int articleID) ;
	public boolean query(String userName,int articleID);
	//查询是否购买
	public List<Integer>  find(String userName);
	//查询所有购买的文章id
}
