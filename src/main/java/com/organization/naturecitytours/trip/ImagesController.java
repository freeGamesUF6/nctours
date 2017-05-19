/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;



/**
 * 
 *
 * @author Jhona
 */
@Controller
public class ImagesController {

    private ImagesRepository images;
    private TripRepository trip;
    //private Images imgs=new Images();

    @Autowired
    public ImagesController(TripRepository trip, ImagesRepository images) {
        this.images = images;
        this.trip = trip;
    }

}
