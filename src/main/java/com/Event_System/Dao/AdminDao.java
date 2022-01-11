package com.Event_System.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Event_System.Entity.Admin;

public class AdminDao {
	
	private Connection con;

	public AdminDao(Connection con) {
		this.con = con;
	}

	public Admin loginAdmin(String aEmail, String aPassword) {
		Admin admin = null;

		try {
			String query = "select * from admin where aEmail= ? and aPassword= ?";
			PreparedStatement pst = this.con.prepareStatement(query);
			pst.setString(1, aEmail);
			pst.setString(2, aPassword);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				admin = new Admin();
				admin.setAid(rs.getInt("aid"));
				admin.setaName(rs.getString("aName"));
				admin.setaTel(rs.getString("aTel"));
				admin.setaEmail(rs.getString("aEmail"));
				admin.setaPassword(rs.getString("aPassword"));
				admin.setaProfile(rs.getString("aProfile"));
				admin.setaDateUpdate(rs.getTimestamp("aDateUpdate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return admin;
	}
}
