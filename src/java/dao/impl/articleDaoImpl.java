package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import dao.articleDao;
import entity.article;
import util.BaseDao;

public class articleDaoImpl extends BaseDao implements articleDao{

	@Override
	public boolean publish(String userName,String articleTitle, String articleContent, float articlePrice) {
		if(this.find(articleTitle)==0) {
			Date d = new Date(); // 注意是util包下的Date
			java.sql.Date date = new java.sql.Date(d.getTime()); // 转化成字段的数据类型
			
			String sql="insert into article(userName,articleTitle,articleContent,articlePrice,publishTime,checkStatus) values(?,?,?,?,?,0);";
			
			int result=this.modifyData(sql, new Object [] {userName,articleTitle,articleContent,articlePrice,date});
			if(result==1)
				return true;
			else return false;
		}else {
			return false;
		}
	}

	@Override
	public int find(String articleTitle) {
		String sql="select * from article where articleTitle=? ";
		ResultSet rs=this.getData(sql, new Object [] {articleTitle});
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
	public List<article> getByPage(int pageNo, int pageSize) {
		String sql="select * from article where articleTitle is not null and checkStatus=1 limit ?,?";
		ResultSet rs=this.getData(sql, new Object [] {(pageNo-1)*pageSize,pageSize});
		List<article> list=new ArrayList<article>();
		
		try {
			while(rs.next()) {
				article art=new article();
				art.setArticleID(rs.getInt(1));
				art.setUserID(rs.getInt(2));
				art.setArticleTitle(rs.getString(3));
				//art.setArticleContent(rs.getString(4));
				art.setPublishTime(rs.getDate(5));
				art.setCheckStatus(rs.getString(6));
				art.setArticlePrice(rs.getFloat(7));
				art.setUserName(rs.getString(8));
				list.add(art);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getCount() {
		String sql="select count(1) from article";
		ResultSet rs=this.getData(sql, new Object [] {});
		int count=0;
		try {
			while(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public article findContent(int articleID) {
		String sql="select * from article where articleID=?";
		ResultSet rs=this.getData(sql, new Object [] {articleID});
		article art=new article();
		try {
			while(rs.next()) {
				
				art.setArticleID(rs.getInt(1));
				art.setUserID(rs.getInt(2));
				art.setArticleTitle(rs.getString(3));
				art.setArticleContent(rs.getString(4));
				art.setPublishTime(rs.getDate(5));
				art.setCheckStatus(rs.getString(6));
				art.setArticlePrice(rs.getFloat(7));
				art.setUserName(rs.getString(8));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return art;
	}

	@Override
	public List<article> getByUser(String userName) {
		String sql="select * from article where userName=?";
		ResultSet rs=this.getData(sql, new Object [] {userName});
		List<article> list=new ArrayList<article>();
		
		try {
			while(rs.next()) {
				article art=new article();
				art.setArticleID(rs.getInt(1));
				art.setUserID(rs.getInt(2));
				art.setArticleTitle(rs.getString(3));
				//art.setArticleContent(rs.getString(4));
				art.setPublishTime(rs.getDate(5));
				art.setCheckStatus(rs.getString(6));
				art.setArticlePrice(rs.getFloat(7));
				art.setUserName(rs.getString(8));
				list.add(art);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean modify(int articleID, String articleTitle, String articleContent, float articlePrice) {
		
		String sql="update article set articleTitle=?, articleContent=?, articlePrice=? where articleID=?";
		int result=this.modifyData(sql, new Object [] {articleTitle,articleContent,articlePrice,articleID});
		if(result==1)
			return true;
		else return false;
	}

	@Override
	public boolean delete(int articleID) {
		String sql="delete from article where articleID=?";
		int result=this.modifyData(sql, new Object [] {articleID});
		if(result==0)
			return false;
		else return true;
	}

	@Override
	public float findPrice(int articleID) {
		String sql="select * from article where articleID=?";
		ResultSet rs=this.getData(sql, new Object [] {articleID});
		float result=0;
		try {
			while(rs.next()) {
				result=rs.getFloat(7);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<article> getByArray(List<Integer> articleIDList) {
		Object[] o = new Object[articleIDList.size()];
		String sql="select * from article where articleID in (";
		for(int i=0;i<articleIDList.size();i++) {
			o[i]=Integer.toString(articleIDList.get(i));
			if(i==0) {
				sql+="?";
			}else {
				sql+=",?";
			}
		}
		sql+=")";
		
		
		ResultSet rs=this.getData(sql, o);
		List<article> list=new ArrayList<article>();
		try {
			while(rs.next()) {
				article art=new article();
				art.setArticleID(rs.getInt(1));
				art.setUserID(rs.getInt(2));
				art.setArticleTitle(rs.getString(3));
				//art.setArticleContent(rs.getString(4));
				art.setPublishTime(rs.getDate(5));
				art.setCheckStatus(rs.getString(6));
				art.setArticlePrice(rs.getFloat(7));
				art.setUserName(rs.getString(8));
				list.add(art);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<article> getByCheck() {
		String sql="select * from article where checkStatus=0";
		ResultSet rs=this.getData(sql, new Object [] {});
		List<article> list=new ArrayList<article>();
		
		try {
			while(rs.next()) {
				article art=new article();
				art.setArticleID(rs.getInt(1));
				art.setUserID(rs.getInt(2));
				art.setArticleTitle(rs.getString(3));
				//art.setArticleContent(rs.getString(4));
				art.setPublishTime(rs.getDate(5));
				art.setCheckStatus(rs.getString(6));
				art.setArticlePrice(rs.getFloat(7));
				art.setUserName(rs.getString(8));
				list.add(art);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean check(String flag,int articleID) {
		String sql="update article set checkStatus=? where articleID=?";
		int result=this.modifyData(sql, new Object [] {flag,articleID});
		if(result==1)
			return true;
		else return false;
	}

}
