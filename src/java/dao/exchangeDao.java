package dao;

import java.util.List;

public interface exchangeDao {
	public boolean add(String userName,int articleID) ;
	//��Ӷһ�
	public boolean query(String userName,int articleID);
	//��ѯ�Ƿ���
	public List<Integer>  find(String userName);
	//��ѯ���й��������id
}
