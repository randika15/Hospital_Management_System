package com.nsbm.dao;

import java.sql.*;
import java.util.*;
import com.nsbm.model.Participant;

public class ParticipantDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/eventdb";
    private String jdbcUsername = "root"; 
    private String jdbcPassword = "";

    private static final String INSERT_SQL = "INSERT INTO participants (name, email, event) VALUES (?, ?, ?)";
    private static final String SELECT_ALL_SQL = "SELECT * FROM participants";

    public void insertParticipant(Participant participant) {
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = conn.prepareStatement(INSERT_SQL);
            ps.setString(1, participant.getName());
            ps.setString(2, participant.getEmail());
            ps.setString(3, participant.getEvent());
            ps.executeUpdate();

            ps.close();
            conn.close();
            System.out.println("Participant inserted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Participant> listParticipants() {
        List<Participant> participants = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_SQL);

            while (rs.next()) {
                Participant p = new Participant();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setEvent(rs.getString("event"));
                participants.add(p);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return participants;
    }
}
