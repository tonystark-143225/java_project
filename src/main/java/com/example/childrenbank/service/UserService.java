package com.example.childrenbank.service;

import com.example.childrenbank.model.Saving;
import com.example.childrenbank.model.User;
import com.example.childrenbank.repository.InMemoryUserRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class UserService {
    private final InMemoryUserRepository repo = new InMemoryUserRepository();
    private long savingId = 2L;

    public Optional<User> authenticate(String username, String password) {
        return repo.findByUsername(username).filter(u -> u.getPassword().equals(password));
    }

    public List<User> listAll() { return repo.findAll(); }

    public Optional<User> findById(Long id) { return repo.findById(id); }

    public User createUser(String username, String password, String role) {
        User u = new User(null, username, password, role);
        return repo.save(u);
    }

    public void deleteUser(Long id) { repo.deleteById(id); }

    public Saving addSaving(Long userId, String desc, double amount) {
        Saving s = new Saving(++savingId, desc, amount, LocalDate.now());
        repo.findById(userId).ifPresent(u -> u.addSaving(s));
        return s;
    }
}
