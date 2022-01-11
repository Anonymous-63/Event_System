package com.Event_System.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Event_System.Entity.User;


public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String query = "insert into user(uname, tel, email, password, name, gender) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, user.getUname());
			pst.setString(2, user.getTel());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.setString(5, user.getName());
			pst.setString(6, user.getGender());

			pst.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User loginUser(String email, String password) {
		User user = null;

		try {
			String query = "select * from user where email= ? and password= ?";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUname(rs.getString("uname"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setDateTime(rs.getTimestamp("dateTime"));
				user.setProfile(rs.getString("profile"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
	public boolean updateProfile(User user) {
		boolean f= false;
		
		try {
			String query = "Update user set uname=?, tel=?, email=?, password=?, profile=?, name=? where id = ? ";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1, user.getUname());
			pst.setString(2, user.getTel());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.setString(5, user.getProfile());
			pst.setString(6, user.getName());
			pst.setInt(7, user.getId());
			
			pst.executeUpdate();
			f = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
