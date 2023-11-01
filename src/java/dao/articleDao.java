package dao;

import java.util.List;

import entity.article;

public interface articleDao {
	public boolean publish(String userName,String articleTitle,String articleContent,float articlePrice) ;
	//发布文章
	public int find(String articleTitle);
	//查询文章ID
	public List<article> getByPage(int pageNo,int pageSize);
	//按页返回文章
	public int getCount();
	//获取文章数量
	public article findContent(int articleID);
	//查找文章内容
	public List<article> getByUser(String userName);
	//按用户名查找文章
	public boolean modify(int articleID,String articleTitle,String articleContent,float articlePrice);
	//修改文本
	public boolean delete(int articleID);
	//删除
	public float findPrice(int articleID);
	
	public List<article> getByArray(List<Integer> articleIDList);
	
	public List<article> getByCheck();
	//查询所有待审核的文章
	public boolean check(String flag,int articleID);
	//审核通过
}
