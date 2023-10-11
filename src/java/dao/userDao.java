package dao;

import entity.user;

public interface userDao {
	//�������е�user�����ɾ�Ĳ����
	
	public user login(String userName,String userPassword);
	//��¼
	
	public boolean register(String userName,String userPassword,String userEmail);
	//ע��
	
	public boolean modifyBase(String userName,String modifyName);
	//�޸ģ��˺Ż�����Ϣ)
	
	public boolean modifyEmail(String userName,String modifyEmail);
	//�޸ģ����䣩
	
	public boolean modifyPassword(String userName,String userPassword,String modifyPassword);
	//�޸ģ����룩
	
	public boolean delete(String userName);
	//ע��
	
	public String find(String userName,String userEmail);
	//�һ����루�����û��������䣩
	
	public int checkByName(String userName);
	//����û����Ƿ����,�����ڷ���0,���ڷ���userId
	
	public int checkByEmail(String userEmail) ;
	//��������Ƿ����,�����ڷ���0,���ڷ���userId
	
}
