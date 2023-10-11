package dao;

import entity.user;

public interface userDao {
	//负责所有的user表的增删改查操作
	
	public user login(String userName,String userPassword);
	//登录
	
	public boolean register(String userName,String userPassword,String userEmail);
	//注册
	
	public boolean modifyBase(String userName,String modifyName);
	//修改（账号基本信息)
	
	public boolean modifyEmail(String userName,String modifyEmail);
	//修改（邮箱）
	
	public boolean modifyPassword(String userName,String userPassword,String modifyPassword);
	//修改（密码）
	
	public boolean delete(String userName);
	//注销
	
	public String find(String userName,String userEmail);
	//找回密码（利用用户名和邮箱）
	
	public int checkByName(String userName);
	//检查用户名是否存在,不存在返回0,存在返回userId
	
	public int checkByEmail(String userEmail) ;
	//检查邮箱是否存在,不存在返回0,存在返回userId
	
}
