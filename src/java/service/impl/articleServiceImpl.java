package service.impl;

import java.util.List;

import dao.articleDao;
import dao.impl.articleDaoImpl;
import entity.article;
import service.articleService;

public class articleServiceImpl implements articleService{

	articleDao ad=new articleDaoImpl();
	@Override
	public boolean publish(String userName,String articleTitle, String articleContent, float articlePrice) {
		return ad.publish(userName,articleTitle, articleContent, articlePrice);
	}

	@Override
	public int find(String articleTitle) {
		return ad.find(articleTitle);
	}

	@Override
	public List<article> getByPage(int pageNo, int pageSize) {
		return ad.getByPage(pageNo, pageSize);
	}

	@Override
	public int getCount() {
		return ad.getCount();
	}


	@Override
	public article findContent(int articleID) {
		return ad.findContent(articleID);
	}

	@Override
	public List<article> getByUser(String userName) {
		return ad.getByUser(userName);
	}

	@Override
	public boolean modify(int articleID, String articleTitle, String articleContent, float articlePrice) {
		return ad.modify(articleID, articleTitle, articleContent, articlePrice);
	}

	@Override
	public boolean delete(int articleID) {
		return ad.delete(articleID);
	}


	
}
