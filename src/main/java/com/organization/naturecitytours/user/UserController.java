/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.user;

import com.organization.naturecitytours.book.Bookuser;
import com.organization.naturecitytours.book.Book;
import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.trip.TripRepository;
import java.util.ArrayList;
import java.util.Collection;
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
        try {
            User user1 = this.user.findByEmail(user.getEmail());
       
           BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
           boolean matches = passwordEncoder.matches(user.getPassword(),user1.getPassword());
            System.out.println("Email del usuario devuelto: " + user1.getEmail());
      
                if ( matches) {

                    session.setAttribute("user", user.getEmail());
                    return "user/userProfile";
                   
                } else {

                    System.out.println("Error en contraseña");;
                    return "user/userSession";
                }
      
        } catch (Exception e) {
             System.out.println("Error en correo");
                    return "user/userSession";

        }

    }

    
     @RequestMapping("/user/logout")
    public String closeSession(HttpSession session) {
            session.setAttribute("user", null);
        return "index";
    }
    
    @RequestMapping("/user/profile")
    public String profile() {
        return "/user/userProfile";
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
    
           String cryptedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
           
           user.setPassword(cryptedPassword);
       
            this.user.save(user);
         
            return "user/userSession";
        }
    }
    
    @RequestMapping("/book/list")
    public String bookList(User user, BindingResult result, Map<String, Object> model) {
        // find books by user
        Bookuser bu=new Bookuser();
        user.setId(3);
        user.setEmail("admin@admin");
        user.setPassword("admin");
//        bu.setIduser(user);
        User results = this.user.findByEmail(user.getEmail());
        if (results==null) {
            // no trips found
            result.rejectValue("id", "notFound", "not found");
            return "hello";
        }else {
            // multiple trips found
            model.put("selections", results);
            return "hello";
        } 
    }
}
