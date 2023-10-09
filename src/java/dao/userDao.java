package dao;

public interface userDao {
	//负责所有的user表的增删改查操作
	
	public boolean login(String userName,String userPassword);
	//登录
	
	public boolean register(String userName,String userPassword,String userEmail);
	//注册
	
	public boolean modify(String userName,String modifyName,String modifyPassword,String modiftEmail);
	//修改（账号/密码/邮箱）
	
	public boolean delete(String userName);
	//注销
	
	public String find(String userName,String userEmail);
	//找回密码（利用用户名和邮箱）
}
