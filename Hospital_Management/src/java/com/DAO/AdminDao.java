package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Admin;

public class AdminDao {
    private Connection conn;

    public AdminDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean registerAdmin(Admin a) {
        boolean f = false;
        try {
            String sql = "INSERT INTO admin(name, email, password) VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, a.getEmail());
            ps.setString(2, a.getPassword());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Admin login(String email, String psw) {
        Admin a = null;
        try {
            String sql = "SELECT * FROM admin WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, psw);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Admin();
                a.setId(rs.getInt("id"));

                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

    public boolean checkOldPassword(int userid, String oldPassword) {
        boolean f = false;
        try {
            String sql = "SELECT * FROM admin WHERE id=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, oldPassword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean changePassword(int userid, String newPassword) {
        boolean f = false;
        try {
            String sql = "UPDATE admin SET password=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Additional methods analogous to UserDao can be added here
}
