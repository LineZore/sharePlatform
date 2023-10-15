package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.exchangeDao;
import entity.user;
import util.BaseDao;

public class exchangeDaoImpl extends BaseDao implements exchangeDao{

	@Override
	public boolean add(String userName, int articleID) {
		String sql="insert into exchange(userName,articleID) values(?,?);";
		int result=this.modifyData(sql, new Object [] {userName,articleID});
		if(result==1)
			return true;
		else return false;
	}

	@Override
	public boolean query(String userName, int articleID) {
		String sql="select * from exchange where userName=? and articleID=?";
		ResultSet rs=this.getData(sql, new Object [] {userName,articleID});
		boolean flag=false;
		try {
			while(rs.next()) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Integer> find(String userName) {
		String sql="select * from exchange where userName=? ";
		ResultSet rs=this.getData(sql, new Object [] {userName});
		
		List<Integer> result=new ArrayList<Integer>();
		try {
			while(rs.next()) {
				int i=rs.getInt(4);
				result.add(i);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
