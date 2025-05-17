package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		this.conn = conn;
	}

	public boolean registerDoctor(Doctor d) {
		String sql = "INSERT INTO doctor (fullname, dob, qualifications, specialist_id, email, mobile_no, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, d.getFullName());
			// Convert String dob ("yyyy-MM-dd") to java.sql.Date
			ps.setDate(2, Date.valueOf(d.getDob()));
			ps.setString(3, d.getQualification());
			ps.setInt(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			return ps.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Error inserting doctor", e);
		}
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<>();
		String sql = "SELECT * FROM doctor ORDER BY doctor_id DESC";
		try (PreparedStatement ps = conn.prepareStatement(sql);
			 ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Doctor d = new Doctor(
						rs.getInt("doctor_id"),
						rs.getString("fullname"),
						rs.getString("dob"),
						rs.getString("qualifications"),
						rs.getInt("specialist_id"),
						rs.getString("email"),
						rs.getString("mobile_no"),
						rs.getString("password")
				);
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Doctor getDoctorById(int id) {
		Doctor d = null;
		String sql = "SELECT * FROM doctor WHERE doctor_id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					d = new Doctor(
							rs.getInt("doctor_id"),
							rs.getString("fullname"),
							rs.getString("dob"),
							rs.getString("qualifications"),
							rs.getInt("specialist_id"),
							rs.getString("email"),
							rs.getString("mobile_no"),
							rs.getString("password")
					);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	public boolean updateDoctor(Doctor d) {
		String sql = "UPDATE doctor SET fullname = ?, dob = ?, qualifications = ?, specialist_id = ?, email = ?, mobile_no = ?, password = ? WHERE doctor_id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, d.getFullName());
			ps.setDate(2, Date.valueOf(d.getDob()));
			ps.setString(3, d.getQualification());
			ps.setInt(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());
			return ps.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteDoctor(int id) {
		String sql = "DELETE FROM doctor WHERE doctor_id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			return ps.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Doctor login(String email, String psw) {
		Doctor d = null;
		String sql = "SELECT * FROM doctor WHERE email = ? AND password = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ps.setString(2, psw);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					d = new Doctor(
							rs.getInt("doctor_id"),
							rs.getString("fullname"),
							rs.getString("dob"),
							rs.getString("qualifications"),
							rs.getInt("specialist_id"),
							rs.getString("email"),
							rs.getString("mobile_no"),
							rs.getString("password")
					);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	public int countDoctor() {
		int i = 0;
		try {
			String sql = "select * from doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {

		}

		return i;
	}

	public int countAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {

		}

		return i;
	}

	public int countAppointmentByDocotrId(int did) {
		int i = 0;
		try {
			String sql = "select * from appointment where doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {

		}

		return i;
	}

	public int countUSer() {
		int i = 0;
		try {
			String sql = "select * from users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {

		}

		return i;
	}

	public int countSpecialist() {
		int i = 0;
		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {

		}

		return i;
	}

	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from doctor where doctor_id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update doctor set password=? where doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}

	public boolean editDoctorProfile(Doctor d) {
		String sql = "UPDATE doctor SET fullname = ?, dob = ?, qualifications = ?, specialist_id = ?, email = ?, mobile_no = ? WHERE doctor_id = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, d.getFullName());
			ps.setDate(2, Date.valueOf(d.getDob()));
			ps.setString(3, d.getQualification());
			ps.setInt(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setInt(7, d.getId());
			return ps.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}