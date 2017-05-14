/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.user;

import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.trip.TripRepository;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author Jhona
 */
@Controller
public class UserController {

    private UserRepository user;
    // private User us = new User();

    @Autowired
    public UserController(UserRepository user) {
        this.user = user;
    }

    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public String initSession(Map<String, Object> model) {
        User user = new User();
        model.put("user", user);
        return "user/userSession";
    }

    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    public String initSession(@Valid User user, BindingResult result, HttpSession session) {
        System.out.println(user.getEmail());
        User user1 = this.user.findByEmail(user.getEmail());
        if (user1 != null) {
            if (user1.getPassword().equals(user.getPassword())) {

                session.setAttribute("Email", user.getEmail());
                return "user/userProfile";

            } else {

                System.out.println("Error en contraseña");;
                return "user/userSession";
            }
        } else {
            System.out.println("Error en correo");
            return "user/userSession";
        }

    }

    @RequestMapping(value = "/user/new", method = RequestMethod.GET)
    public String initCreationForm(Map<String, Object> model) {
        User user = new User();
        model.put("user", user);
        return "user/userNew";
    }

    @RequestMapping(value = "/user/new", method = RequestMethod.POST)
    public String processCreationForm(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user/userNew";
        } else {
            this.user.save(user);
            return "user/userProfile";
        }
    }
}
