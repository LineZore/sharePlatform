package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class BaseDao {
	public int modifyData(String sql, Object []obj) {//ÔöÉ¾¸Ä
		Connection conn=ConnUtil.getConn();
		int result=0;
		try {
			
			PreparedStatement ps=conn.prepareStatement(sql);
			for(int i=0;i<obj.length;i++)
			{
				ps.setObject(i+1, obj[i]);
			}
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ResultSet getData(String sql,Object[] obj) {//²é
		Connection conn=ConnUtil.getConn();
		ResultSet rs=null;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			for(int i=0;i<obj.length;i++)
			{
				ps.setObject(i+1, obj[i]);
			}
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
}
