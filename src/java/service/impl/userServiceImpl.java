package service.impl;

import dao.userDao;
import dao.impl.userDaoImpl;
import service.userService;

public class userServiceImpl implements userService{

	private userDao ud=new userDaoImpl();
	@Override
	public boolean login(String userName, String userPassword) {
		return ud.login(userName, userPassword);
	}
	
	@Override
	public boolean register(String userName, String userPassword, String userEmail) {
		return ud.register(userName, userPassword, userEmail);
	}

	@Override
	public boolean modify(String userName, String modifyName, String modifyPassword, String modiftEmail) {
		return ud.modify(userName, modifyName, modifyPassword, modiftEmail);
	}

	@Override
	public boolean delete(String userName) {
		return ud.delete(userName);
	}

	@Override
	public String find(String userName, String userEmail) {
		return ud.find(userName, userEmail);
	}
}
