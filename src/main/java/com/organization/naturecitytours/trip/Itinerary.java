/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Xavier,,Marc(Mapping)
 */
@Entity
@Table(name="itinerary")
public class Itinerary implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name="daydebrief")
    private String daydebrief;
    @ManyToOne
    @JoinColumn(name="idtrip")
    private Trip trip;

    
    
    
    
}
