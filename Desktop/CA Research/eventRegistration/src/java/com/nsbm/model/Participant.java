package com.nsbm.model;

public class Participant {
    private int id;
    private String name;
    private String email;
    private String event;

    public Participant() {}
    
    public Participant(String name, String email, String event) {
        this.name = name;
        this.email = email;
        this.event = event;
    }

    public Participant(int id, String name, String email, String event) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }
}