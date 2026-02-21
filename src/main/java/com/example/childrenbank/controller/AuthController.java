package com.example.childrenbank.controller;

import com.example.childrenbank.model.User;
import com.example.childrenbank.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    private final UserService userService = new UserService();

    @GetMapping({"/", "/index"})
    public String index(HttpSession session) {
        Object uid = session.getAttribute("userId");
        if (uid != null) return "redirect:/user/" + uid;
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage() { return "login"; }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username, @RequestParam String password, HttpServletRequest req, Model model) {
        var opt = userService.authenticate(username, password);
        if (opt.isPresent()) {
            User u = opt.get();
            req.getSession().setAttribute("userId", u.getId());
            req.getSession().setAttribute("role", u.getRole());
            if ("ADMIN".equals(u.getRole())) return "redirect:/admin";
            return "redirect:/user/" + u.getId();
        }
        model.addAttribute("error", "Invalid credentials");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        req.getSession().invalidate();
        return "redirect:/login";
    }
}
