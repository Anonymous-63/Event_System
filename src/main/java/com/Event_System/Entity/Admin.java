package com.Event_System.Entity;

import java.sql.Timestamp;

public class Admin {

	private int aid;
	private String aName;
	private String aTel;
	private String aEmail;
	private String aPassword;
	private Timestamp aDateUpdate;
	private String aProfile;
	
	public Admin(int aid, String aName, String aTel, String aEmail, String aPassword, Timestamp aDateUpdate,
			String aProfile) {
		super();
		this.aid = aid;
		this.aName = aName;
		this.aTel = aTel;
		this.aEmail = aEmail;
		this.aPassword = aPassword;
		this.aDateUpdate = aDateUpdate;
		this.aProfile = aProfile;
	}

	public Admin(String aName, String aTel, String aEmail, String aPassword, Timestamp aDateUpdate, String aProfile) {
		super();
		this.aName = aName;
		this.aTel = aTel;
		this.aEmail = aEmail;
		this.aPassword = aPassword;
		this.aDateUpdate = aDateUpdate;
		this.aProfile = aProfile;
	}

	public Admin() {
		super();
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaTel() {
		return aTel;
	}

	public void setaTel(String aTel) {
		this.aTel = aTel;
	}

	public String getaEmail() {
		return aEmail;
	}

	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}

	public String getaPassword() {
		return aPassword;
	}

	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}

	public String getaProfile() {
		return aProfile;
	}

	public void setaProfile(String aProfile) {
		this.aProfile = aProfile;
	}

	public Timestamp getaDateUpdate() {
		return aDateUpdate;
	}

	public void setaDateUpdate(Timestamp aDateUpdate) {
		this.aDateUpdate = aDateUpdate;
	}
	
	
	
}
