package service;

import java.util.List;

public interface exchangeService {
	public boolean add(String userName,int articleID) ;
	public boolean query(String userName,int articleID);
	//��ѯ�Ƿ���
	public List<Integer>  find(String userName);
	//��ѯ���й��������id
}
