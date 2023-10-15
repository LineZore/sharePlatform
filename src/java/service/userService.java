package service;

import entity.user;

public interface userService {
	public user login(String userName,String userPassword);
	
	public boolean register(String userName,String userPassword,String userEmail);
	
	public boolean modifyBase(String userName,String modifyName);
	
	public boolean modifyEmail(String userName,String modifyEmail);
	
	public boolean modifyPassword(String userName,String userPassword,String modifyPassword);

	public boolean delete(String userName);
	
	public user find(String userEmail);
	
	public int checkByName(String userName);

	public int checkByEmail(String userEmail) ;
	public float findIntegral(String userName);
	//²éÑ¯»ý·Ö
	
	public boolean modifyIntegral(String userName,float changeIntegral);
}
