package service.impl;

import java.util.List;

import dao.meansDao;
import dao.impl.meansDaoImpl;
import entity.means;
import service.meansService;

public class meansServiceImpl implements meansService{

	meansDao md=new meansDaoImpl();
	@Override
	public boolean addMeans(int articleID, String meansName) {
		return md.addMeans(articleID, meansName);
	}

	@Override
	public int findMeans(int articleID, String meansName) {
		return md.findMeans(articleID, meansName);
	}

	@Override
	public boolean addMeansURL(int meansID, String meansURL) {
		return md.addMeansURL(meansID, meansURL);
	}

	@Override
	public List<means> getAll(int articleID) {
		return md.getAll(articleID);
	}

	@Override
	public boolean delete(int meansID) {
		return md.delete(meansID);
	}
	
}
