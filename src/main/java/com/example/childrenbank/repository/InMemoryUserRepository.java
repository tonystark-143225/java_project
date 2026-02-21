package com.example.childrenbank.repository;

import com.example.childrenbank.model.Saving;
import com.example.childrenbank.model.User;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

public class InMemoryUserRepository {
    private final Map<Long, User> users = new LinkedHashMap<>();
    private final AtomicLong idGen = new AtomicLong(1);

    public InMemoryUserRepository() {
        // preload admin and sample users
        save(new User(null, "admin", "admin", "ADMIN"));
        User u1 = new User(null, "alice", "pass", "USER");
        u1.addSaving(new Saving(1L, "Initial piggy", 12.5, LocalDate.now().minusDays(10)));
        save(u1);
        User u2 = new User(null, "bob", "pass", "USER");
        save(u2);
    }

    public List<User> findAll() { return new ArrayList<>(users.values()); }
    public Optional<User> findById(Long id) { return Optional.ofNullable(users.get(id)); }
    public Optional<User> findByUsername(String username) {
        return users.values().stream().filter(u -> u.getUsername().equals(username)).findFirst();
    }

    public User save(User u) {
        if (u.getId() == null) u.setId(idGen.getAndIncrement());
        users.put(u.getId(), u);
        return u;
    }

    public void deleteById(Long id) { users.remove(id); }
}
