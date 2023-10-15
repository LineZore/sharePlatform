package service.impl;

import java.util.List;

import dao.exchangeDao;
import dao.impl.exchangeDaoImpl;
import service.exchangeService;

public class exchangeServiceImpl implements exchangeService{

	exchangeDao ed=new exchangeDaoImpl();
	@Override
	public boolean add(String userName, int articleID) {
		return ed.add(userName, articleID);
	}
	@Override
	public boolean query(String userName, int articleID) {
		return ed.query(userName, articleID);
	}
	@Override
	public List<Integer> find(String userName) {
		return ed.find(userName);
	}

}
