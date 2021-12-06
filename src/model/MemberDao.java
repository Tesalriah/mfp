package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import util.DBManager;

public class MemberDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int login(String userid, String pwd ) {
		String sql="select pwd from userList where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(pwd))
					return 1;
				else
					return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return -2;
	}
	
	public int join(MemberDto dto) {
		String sql="insert into userList values(?,?,?,?,?,sysdate,?)";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,dto.getUserid());
			pstmt.setString(2,dto.getPwd());
			pstmt.setString(3,dto.getUsername());
			pstmt.setString(4,dto.getGender());
			pstmt.setString(5,dto.getEmail());
			pstmt.setString(6,dto.getAddress());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
		return -1;
	}
	
	public int idCheck(String userid) {
		String sql="select userid from userList where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}else {
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return -2;
	}
	
	public Vector<MemberDto> getAllUser(){
		Vector<MemberDto> vec=new Vector<MemberDto>();
		
		String sql="select * from userList";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setUserid(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setUsername(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setjDate(rs.getString(6));
				dto.setAddress(rs.getString(7));
				
				vec.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return vec;
	}
	
	public MemberDto getOneUser(String userid) {
		MemberDto dto=new MemberDto();
		String sql="select * from userList where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setUserid(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setUsername(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setjDate(rs.getString(6));
				dto.setAddress(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return dto;
	}
	
	public int updateUser(String userid,String pwd, String email, String address) {
		String sql="update userList set pwd=?, email=?, address=? where userid=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,pwd);
			pstmt.setString(2,email);
			pstmt.setString(3,address);
			pstmt.setString(4,userid);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return -1;
	}
	
	public int deleteUser(String userid,String pwd) {
		String sql="delete from userList where userid=? and pwd=?";
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,pwd);
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return -1;
	}
}
