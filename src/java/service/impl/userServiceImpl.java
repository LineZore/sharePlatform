package service.impl;

import dao.userDao;
import dao.impl.userDaoImpl;
import entity.user;
import service.userService;

public class userServiceImpl implements userService{

	private userDao ud=new userDaoImpl();
	@Override
	public user login(String userName, String userPassword) {
		return ud.login(userName, userPassword);
	}
	
	@Override
	public boolean register(String userName, String userPassword, String userEmail) {
		return ud.register(userName, userPassword, userEmail);
	}
	
	@Override
	public boolean modifyBase(String userName,String modifyName) {
		return ud.modifyBase(userName, modifyName);
	}
	
	@Override
	public boolean modifyEmail(String userName, String modifyEmail) {
		return ud.modifyEmail(userName, modifyEmail);
	}
	
	@Override
	public boolean modifyPassword(String userName,String userPassword,String modifyPassword) {
		return ud.modifyPassword(userName, userPassword, modifyPassword);
	}

	@Override
	public boolean delete(String userName) {
		return ud.delete(userName);
	}

	@Override
	public String find(String userName, String userEmail) {
		return ud.find(userName, userEmail);
	}

	@Override
	public int checkByName(String userName) {
		return ud.checkByName(userName);
	}

	@Override
	public int checkByEmail(String userEmail) {
		return ud.checkByEmail(userEmail);
	}


}
