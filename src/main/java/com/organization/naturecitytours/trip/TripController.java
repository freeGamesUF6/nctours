/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

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
public class TripController {
    
    private TripRepository trip;
    private Trip tr=new Trip();
    @Autowired
    public TripController(TripRepository trip){
        this.trip=trip;
    }
    
    @RequestMapping("/saveTrip")
    public String saveTrip(Trip t){
//        tr.setDuration("2");
//        tr.setName("viatge");
//        tr.setPricedouble(1000.5);
//        tr.setPricesingle(500.25);
        this.trip.save(tr);
        
        return "hello";
    }
}
