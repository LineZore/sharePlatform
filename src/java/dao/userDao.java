package dao;

public interface userDao {
	//�������е�user�����ɾ�Ĳ����
	
	public boolean login(String userName,String userPassword);
	//��¼
	
	public boolean register(String userName,String userPassword,String userEmail);
	//ע��
	
	public boolean modify(String userName,String modifyName,String modifyPassword,String modiftEmail);
	//�޸ģ��˺�/����/���䣩
	
	public boolean delete(String userName);
	//ע��
	
	public String find(String userName,String userEmail);
	//�һ����루�����û��������䣩
}
