package com.example.childrenbank.model;

import java.util.ArrayList;
import java.util.List;

public class User {
    private Long id;
    private String username;
    private String password;
    private String role; // ADMIN or USER
    private List<Saving> savings = new ArrayList<>();

    public User() {}

    public User(Long id, String username, String password, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public List<Saving> getSavings() { return savings; }
    public void setSavings(List<Saving> savings) { this.savings = savings; }

    public void addSaving(Saving s) { this.savings.add(s); }
}
