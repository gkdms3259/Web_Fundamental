package kr.co.kic.dev1.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.kic.dev1.dto.DeptDto;
import kr.co.kic.dev1.dto.EmpDto;
import kr.co.kic.dev1.util.ConnLocator;

public class DeptDao {
	private static DeptDao single;
	private DeptDao() {}
	public static DeptDao getInstance() {
		if(single == null) {
			single = new DeptDao();
		}
		return single;
	}
	
	public boolean insert(DeptDto n) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO dept(deptno, dname, loc) 	");
			sql.append("VALUES(?,?,?)											");
			
			pstmt = con.prepareStatement(sql.toString());
			//諛붿씤�뵫 蹂��닔 �꽭�똿
			pstmt.setInt(index++, n.getNo());
			pstmt.setString(index++, n.getName());
			pstmt.setString(index++, n.getLoc());
			
			pstmt.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}		
		return isSuccess;
	}
	public boolean update(DeptDto n) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE dept 						");
			sql.append("SET dname =? ,loc =?  ");
			sql.append("WHERE deptno = ? 					");
			
			pstmt = con.prepareStatement(sql.toString());
			//諛붿씤�뵫 蹂��닔 �꽭�똿
			
			pstmt.setString(index++, n.getName());
			pstmt.setString(index++, n.getLoc());
			pstmt.setInt(index++, n.getNo());
			
			pstmt.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}		
		return isSuccess;
	}
	public boolean delete(int num) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM dept 	");
			sql.append("WHERE deptno = ?		");
			
			pstmt = con.prepareStatement(sql.toString());
			//諛붿씤�뵫 蹂��닔 �꽭�똿
			pstmt.setInt(index++,num);
			
			pstmt.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}		
		return isSuccess;
	}
	
	public DeptDto select(int no) {
		DeptDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select deptno, dname,loc  ");
			sql.append("FROM dept ");
			sql.append("WHERE deptno = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				int deptno = rs.getInt(index++);
				String name = rs.getString(index++);
				String loc = rs.getString(index++);
				obj = new DeptDto(deptno, name, loc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return obj;
	}
	
	public ArrayList<DeptDto> select(int start, int length){
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select deptno, dname,loc  ");
			sql.append("FROM dept ");
			sql.append("ORDER BY deptno ASC ");
			sql.append("LIMIT ?,?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, length);
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				int deptno = rs.getInt(index++);
				String name = rs.getString(index++);
				String loc = rs.getString(index++);
				list.add(new DeptDto(deptno, name, loc));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
	public int getRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) FROM dept");
			
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				count = rs.getInt(index);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				// TODO: handle exception
			}
		}
		return count;
	}
	
}
