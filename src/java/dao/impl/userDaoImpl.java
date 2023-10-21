package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.Session;

import dao.userDao;
import entity.user;
import util.BaseDao;

public class userDaoImpl extends BaseDao implements userDao{
	//具体实现
	@Override
	public user login(String userName, String userPassword) {
		String sql="select * from user where userName=? and userPassword=?";
		ResultSet rs=this.getData(sql, new Object [] {userName,userPassword});
		user u=new user();
		try {
			while(rs.next()) {
				u.setUserID(rs.getInt(1));
				u.setUserName(rs.getString(2));
				u.setUserPassword(rs.getString(3));
				u.setUserType(rs.getString(4));
				u.setUserEmail(rs.getString(5));
				u.setUserIntegral(rs.getFloat(6));
				u.setIsValue(rs.getInt(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public boolean register(String userName, String userPassword, String userEmail) {
		if(this.checkByName(userName)==0&&this.checkByEmail(userEmail)==0) {
			String sql="insert into user(userName,userPassword,userEmail,userType,userIntegral) values(?,?,?,'user','0');";
			int result=this.modifyData(sql, new Object [] {userName,userPassword,userEmail});
			if(result==1)
				return true;
			else return false;
		}
		else return false;
	}

	@Override
	public boolean modifyBase(String userName,String modifyName) {
		int userId=this.checkByName(userName);
		
		if((this.checkByName(modifyName)==0||this.checkByName(modifyName)==userId)) {
			
			String sql="update user set userName=? where userName=?";
			int result=this.modifyData(sql, new Object [] {modifyName,userName});
			if(result==1)
				return true;
			else return false;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean modifyEmail(String userName,String modifyEmail) {
		int userId=this.checkByName(userName);
		
		if((this.checkByEmail(modifyEmail)==0||this.checkByEmail(modifyEmail)==userId)) {
			
			String sql="update user set userEmail=? where userName=?";
			int result=this.modifyData(sql, new Object [] {modifyEmail,userName});
			if(result==1)
				return true;
			else return false;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean modifyPassword(String userName,String userPassword,String modifyPassword) {
		String sql="update user set userPassword=? where userName=? and userPassword=?";
		int result=this.modifyData(sql, new Object [] {modifyPassword,userName,userPassword});
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
	public user find(String userEmail) {
		String sql="select * from user where  userEmail=?";
		ResultSet rs=this.getData(sql, new Object [] {userEmail});
		user u=new user();
		boolean flag=false;
		try {
			while(rs.next()) {
				u.setUserName(rs.getString(2));
				u.setUserPassword(rs.getString(3));
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag)
			return u;
		else return null;
	}

	@Override
	public int checkByName(String userName) {
		String sql="select * from user where userName=?";
		ResultSet rs=this.getData(sql, new Object [] {userName});
		int result=0;
		try {
			while(rs.next()) {
				result=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int checkByEmail(String userEmail) {
		String sql="select * from user where userEmail=?";
		ResultSet rs=this.getData(sql, new Object [] {userEmail});
		int result=0;
		try {
			while(rs.next()) {
				result=rs.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public float findIntegral(String userName) {
		String sql="select * from user where userName=? ";
		ResultSet rs=this.getData(sql, new Object [] {userName});
		float result=0;
		try {
			while(rs.next()) {
				result=rs.getFloat(6);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean modifyIntegral(String userName, float changeIntegral) {
		String sql="update user set userIntegral=? where userName=?";
		int result=this.modifyData(sql, new Object [] {changeIntegral,userName});
		if(result==1)
			return true;
		else return false;
	}

}
