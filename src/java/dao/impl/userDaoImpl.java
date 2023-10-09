package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import dao.userDao;
import util.BaseDao;

public class userDaoImpl extends BaseDao implements userDao{
	//具体实现
	@Override
	public boolean login(String userName, String userPassword) {
		String sql="select * from user where userName=? and userPassword=?";
		ResultSet rs=this.getData(sql, new Object [] {userName,userPassword});
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
	public boolean register(String userName, String userPassword, String userEmail) {
		String sql="insert into user(userName,userPassword,userEmail) values(?,?,?);";
		int result=this.modifyData(sql, new Object [] {userName,userPassword,userEmail});
		if(result==1)
			return true;
		else return false;
	}

	@Override
	public boolean modify(String userName, String modifyName, String modifyPassword, String modiftEmail) {
		String sql="update user set userName=?,userPassword=?,userEmail=? where userName=?";
		int result=this.modifyData(sql, new Object [] {modifyName,modifyPassword,modiftEmail,userName});
		if(result==1)
			return true;
		else return false;
	}

	@Override
	public boolean delete(String userName) {
		String sql="delete from user where userName=?";
		int result=this.modifyData(sql, new Object [] {userName});
		if(result==0)
			return false;
		else return true;
	}

	@Override
	public String find(String userName, String userEmail) {
		String sql="select * from user where userName=? and userEmail=?";
		ResultSet rs=this.getData(sql, new Object [] {userName,userEmail});
		String result=null;
		boolean flag=false;
		try {
			while(rs.next()) {
				result=rs.getString(3);
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag)
			return result;
		else return null;
	}

}
