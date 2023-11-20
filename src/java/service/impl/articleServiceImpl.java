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

	@Override
	public float findPrice(int articleID) {
		return ad.findPrice(articleID);
	}

	@Override
	public List<article> getByArray(List<Integer> articleIDList) {
		return ad.getByArray(articleIDList);
	}

	@Override
	public List<article> getByCheck() {
		return ad.getByCheck();
	}

	@Override
	public boolean check(String flag, int articleID) {
		return ad.check(flag, articleID);
	}

	@Override
	public boolean checkDelete(int articleID, String userName) {
		return ad.checkDelete(articleID, userName);
	}

	@Override
	public String findName(int articleID) {
		return ad.findName(articleID);
	}


	
}
