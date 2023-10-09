package service;

public interface userService {
	public boolean login(String userName,String userPassword);
	
	public boolean register(String userName,String userPassword,String userEmail);
	
	public boolean modify(String userName,String modifyName,String modifyPassword,String modiftEmail);
	
	public boolean delete(String userName);
	
	public String find(String userName,String userEmail);
}
