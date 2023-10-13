package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.meansDao;
import entity.means;
import util.BaseDao;

public class meansDaoImpl extends BaseDao implements meansDao{

	@Override
	public boolean addMeans(int articleID, String meansName) {
		if(this.findMeans(articleID, meansName)==0) {
			String sql="insert into means(articleID,meansName) values(?,?);";
			int result=this.modifyData(sql, new Object [] {articleID,meansName});
			if(result==1)
				return true;
			else return false;
		}else {
			return false;
		}
	}

	@Override
	public int findMeans(int articleID, String meansName) {
		String sql="select * from means where articleID=? and meansName=?";
		ResultSet rs=this.getData(sql, new Object [] {articleID,meansName});
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
	public boolean addMeansURL(int meansID, String meansURL) {
		String sql="update means set meansURL=? where meansID=?";
		int result=this.modifyData(sql, new Object [] {meansURL,meansID});
		if(result==1)
			return true;
		else return false;
	}

	@Override
	public List<means> getAll(int articleID) {
		String sql="select * from means where articleID=?";
		ResultSet rs=this.getData(sql, new Object [] {articleID});
		List<means> list=new ArrayList<means>();
		try {
			while(rs.next()) {
				means m=new means();
				m.setMeansID(rs.getInt(1));
				m.setArticleID(rs.getInt(2));
				m.setMeansName(rs.getString(3));
				m.setMeansType(rs.getString(4));
				m.setMeansURL(rs.getString(5));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean delete(int meansID) {
		String sql="update means set articleID=0 where meansID=?";
		int result=this.modifyData(sql, new Object [] {meansID});
		if(result==1)
			return true;
		else return false;
	}

	
}
