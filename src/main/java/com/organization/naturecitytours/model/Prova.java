/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.model;

import com.organization.naturecitytours.user.User;
import org.springframework.stereotype.Controller;

import java.util.Collection;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mark
 */
@Controller
public class Prova {
    private provaRepository prova;
    private User u=new User();
    @Autowired
    public Prova(provaRepository prova) {
        this.prova = prova;
        
    }
   
//    @RequestMapping(value="/")
//    public String hola(){
//        return "hello";
//    }
//    
    @RequestMapping(value="/provaSave")
    public String provaSave(){
        User us=new User();
        us.setEmail("admin@admin");
        us.setPassword("admin");
        this.prova.save(us);
        return "hello";
    }
//    
//    @RequestMapping(value="/provaTrip")
    
}
