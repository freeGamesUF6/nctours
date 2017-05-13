/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.user;

import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.trip.TripRepository;
import java.util.Map;
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

    @RequestMapping("/user/login")
    public String initSession(@PathVariable("userEmail") String userEmail, Model model) {
        User user = this.user.findByEmail(userEmail);
        model.addAttribute(user);

//        if (u2 != null) {
//            if (u2.getPassword().equals(u.getPassword())) {
//                //Variables de Sesion!
//                request.getSession().setAttribute("mail", u2.getEmail());
//                request.getSession().setAttribute("nickname", u2.getNick());
//                RequestDispatcher rd = request.getRequestDispatcher("/views/games/listGames.jsp");
//                //RequestDispatcher rd = request.getRequestDispatcher("prova.jsp");
//                rd.forward(request, response);
//            } else {
//                throw new PasswordFailException();
//            }
//        } else {
//            throw new NickErrorException();
//        }

        return "user/userSession";
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
            return "user/userSession";
        }
    }
}
