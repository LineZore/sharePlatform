package dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.commentDao;
import entity.article;
import entity.comment;
import util.BaseDao;

public class commentDaoImpl extends BaseDao implements commentDao{

	@Override
	public boolean publish(String userName, int articleID, String commentContent) {
		String sql="insert into comment(userName,articleID,commentContent) values(?,?,?);";
		int result=this.modifyData(sql, new Object [] {userName,articleID,commentContent});
		if(result==1)
			return true;
		else return false;
	}

	
	@Override
	public List<comment> getByPage(int articleID,int pageNo,int pageSize) {
		String sql="select * from comment where articleID=? limit ?,?";
		ResultSet rs=this.getData(sql, new Object [] {articleID,(pageNo-1)*pageSize,pageSize});
		List<comment> list=new ArrayList<comment>();
		try {
			while(rs.next()) {
				comment c=new comment();
				c.setCommentID(rs.getInt(1));
				c.setUserID(rs.getInt(2));
				c.setArticleID(rs.getInt(3));
				c.setCommentStatus(rs.getString(4));
				c.setPublishTime(rs.getDate(5));
				c.setCommentContent(rs.getString(6));
				c.setUserName(rs.getString(7));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getCount(int articleID) {
		String sql="select count(1) from comment where articleID=? ";
		ResultSet rs=this.getData(sql, new Object [] {articleID});
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
	public boolean delete(int commentID) {
		String sql="delete from comment where commentID=?";
		int result=this.modifyData(sql, new Object [] {commentID});
		if(result==0)
			return false;
		else return true;
	}

	

}
