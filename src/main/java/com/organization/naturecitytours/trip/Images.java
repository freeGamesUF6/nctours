/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Jhona
 */
@Entity
@Table(name = "tripimage")
public class Images implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;   
    

    @Column(name="url")
    private String url;
    
    
 
    private Trip trip;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idtrip", nullable = false)
     public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }

//    public int getIdtrip() {
//        return idtrip;
//    }
//
//    public void setIdtrip(int idtrip) {
//        this.idtrip = idtrip;
//    }
    
}
