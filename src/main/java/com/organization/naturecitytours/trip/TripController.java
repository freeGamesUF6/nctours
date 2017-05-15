/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.util.Collection;
import java.util.Map;
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
    
    @RequestMapping("/trip")
    public String trip() {
        return "trip/trip";
    }
    
    /**
     * Mètode que recupera un viatge determinat o una llista de viatges si el paràmetre de cerca és buit
     * @param trip
     * @param result
     * @param model
     * @return vista per mostrar la llista de viatges o el viatge seleccionat segons escaigui
     */
     @RequestMapping("/trip/list")
     public String tripList(Trip trip, BindingResult result, Map<String, Object> model) {
        // allow parameterless GET request for /trips to return all records
        if (trip.getName() == null) {
            trip.setName(""); // empty string signifies broadest possible search
        }

        // find trips bys name
        Collection<Trip> results = this.trip.findByName(trip.getName());
        if (results.isEmpty()) {
            // no trips found
            result.rejectValue("name", "notFound", "not found");
            return "trip/trip";
        } 
//        else if (results.size() == 1) {
//            // 1 trip found
//            trip = results.iterator().next();
//            return "redirect:/trip/" + trip.getId();
//        } 
        else {
            // multiple trips found
            model.put("selections", results);
            return "trip/tripList";
        }
        
     }
    
     /**
      * Mètode que permet guardar un nou viatge a la base de dades
      * @param t
      * @return 
      */
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
