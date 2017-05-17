/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Mark
 */
@Entity
@Table(name="triphotels")
public class Triphotels implements Serializable {
    
    @ManyToOne
    @JoinColumn(name="idtrip")
    @Id
    private Trip idtrip;
    @ManyToOne
    @JoinColumn(name="idhotel")
    @Id
    private Hotel idhotel;

    public Trip getIdtrip() {
        return idtrip;
    }

    public void setIdtrip(Trip idtrip) {
        this.idtrip = idtrip;
    }

    public Hotel getIdhotel() {
        return idhotel;
    }

    public void setIdhotel(Hotel idhotel) {
        this.idhotel = idhotel;
    }
    
    
    
}
