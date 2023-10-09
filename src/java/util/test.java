package util;

import java.sql.ResultSet;
import java.sql.SQLException;

public class test {
	public static void main(String []args) {
//		String sql="delete from user where userID=?";
//		Object [] obj= {2};
//		BaseDao bd=new BaseDao();
//		int result=bd.modifyData(sql, obj);
//		if(result>0) {
//			System.out.print("yes")	;
//		}
			
		BaseDao bd=new BaseDao();
		String sql="select * from user where userName=? and userPassword=?";
		Object[] obj= {"admin","admin"};
		ResultSet rs= bd.getData(sql, obj);
		try {
			while(rs.next()) {
				System.out.print(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}
