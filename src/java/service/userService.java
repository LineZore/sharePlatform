package service;

import entity.user;

public interface userService {
	public user login(String userName,String userPassword);
	
	public boolean register(String userName,String userPassword,String userEmail);
	
	public boolean modifyBase(String userName,String modifyName,String modifyEmail);
	
	public boolean modifyPassword(String userName,String userPassword,String modifyPassword);

	public boolean delete(String userName);
	
	public String find(String userName,String userEmail);
	
	public int checkByName(String userName);

	public int checkByEmail(String userEmail) ;
}
