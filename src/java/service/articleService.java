package service;

import java.util.List;

import entity.article;

public interface articleService {
	public boolean publish(String userName,String articleTitle,String articleContent,float articlePrice) ;
	//发布文章
	public int find(String articleTitle);
	//查询文章ID
	public List<article> getByPage(int pageNo,int pageSize);
	
	public int getCount();
	
	public article findContent(int articleID);
	
	public List<article> getByUser(String userName);
	public boolean modify(int articleID,String articleTitle,String articleContent,float articlePrice);
	public boolean delete(int articleID);
	public float findPrice(int articleID);
	public List<article> getByArray(List<Integer> articleIDList);
}
