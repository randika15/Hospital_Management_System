package com.entity;

public class Doctor {

	private int id;
	private String fullName;
	private String dob;
	private String qualification;
	private int specialist;        // <-- now an int
	private String email;
	private String mobNo;
	private String password;

	public Doctor() { }

	// 1) Constructor for INSERT (no id yet)
	public Doctor(String fullName,
				  String dob,
				  String qualifications,
				  int specialist_id,
				  String email,
				  String mobile_no,
				  String password) {
		this.fullName      = fullName;
		this.dob           = dob;
		this.qualification= qualifications;
		this.specialist = specialist_id;    // <-- assign correctly
		this.email         = email;
		this.mobNo     = mobile_no;
		this.password      = password;
	}

	// 2) Constructor for SELECT (with id)
	public Doctor(int id,
				  String fullName,
				  String dob,
				  String qualifications,
				  int specialist_id,
				  String email,
				  String mobile_no,
				  String password) {
		this.id            = id;
		this.fullName      = fullName;
		this.dob           = dob;
		this.qualification= qualifications;
		this.specialist = specialist_id;
		this.email         = email;
		this.mobNo     = mobile_no;
		this.password      = password;
	}

	// --- getters & setters ---

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}





	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public int getSpecialist() {
		return specialist;
	}
	public void setSpecialist(int specialist) {
		this.specialist = specialist;
	}

	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
}


