package kr.co.kic.dev1.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.co.kic.dev1.dto.EmpDto;
import kr.co.kic.dev1.util.ConnLocator;

public class EmpDao {
	private static EmpDao single;
	private EmpDao() {}
	public static EmpDao getInstance() {
		if(single == null) {
			single = new EmpDao();
		}
		return single;
	}
	
	public boolean insert(EmpDto n) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO emp(empno, ename,job, mgr, hiredate, sal, comm, deptno) 	");
			sql.append("VALUES(?,?,?,?,now(),?,?,?)											");
			
			pstmt = con.prepareStatement(sql.toString());
			//諛붿씤�뵫 蹂��닔 �꽭�똿
			pstmt.setInt(index++, n.getNo());
			pstmt.setString(index++, n.getName());
			pstmt.setString(index++, n.getJob());
			pstmt.setInt(index++, n.getMgr());
			pstmt.setFloat(index++, n.getSal());
			pstmt.setFloat(index++,n.getComm());
			pstmt.setInt(index++, n.getDeptNo());
			
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
	public boolean update(EmpDto n) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE emp 						");
			sql.append("SET ename =? ,job =? , mgr =? , hiredate = NOW() , sal =? , comm =? , deptno =?	");
			sql.append("WHERE empno = ? 					");
			
			pstmt = con.prepareStatement(sql.toString());
			//諛붿씤�뵫 蹂��닔 �꽭�똿
			
			pstmt.setString(index++, n.getName());
			pstmt.setString(index++, n.getJob());
			pstmt.setInt(index++, n.getMgr());
			pstmt.setFloat(index++, n.getSal());
			pstmt.setFloat(index++,n.getComm());
			pstmt.setInt(index++, n.getDeptNo());
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
			sql.append("DELETE FROM emp 	");
			sql.append("WHERE empno = ?		");
			
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
	
	public EmpDto select(int no) {
		EmpDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select empno, ename,job, mgr, date_format(hiredate,'%Y/%m/%d') , sal, comm, deptno  ");
			sql.append("FROM emp ");
			sql.append("WHERE empno = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				int empno = rs.getInt(index++);
				String name = rs.getString(index++);
				String job = rs.getString(index++);
				int mgr = rs.getInt(index++);
				String hiredate = rs.getString(index++);
				float sal = rs.getFloat(index++);
				float comm = rs.getFloat(index++);
				int deptno = rs.getInt(index++);
				obj = new EmpDto(empno, name, job, mgr, hiredate, sal, comm, deptno);
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
	
	public ArrayList<EmpDto> select(int start, int length){
		ArrayList<EmpDto> list = new ArrayList<EmpDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select empno, ename,job, mgr, date_format(hiredate,'%Y/%m/%d'), deptno   ");
			sql.append("FROM emp ");
			sql.append("ORDER BY empno DESC ");
			sql.append("LIMIT ?,?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, length);
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				int empno = rs.getInt(index++);
				String name = rs.getString(index++);
				String job = rs.getString(index++);
				int mgr = rs.getInt(index++);
				String hiredate = rs.getString(index++);
				int deptno = rs.getInt(index++);
				
				list.add(new EmpDto(empno, name, job, mgr, hiredate,deptno));
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
			sql.append("SELECT COUNT(*) FROM emp");
			
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
