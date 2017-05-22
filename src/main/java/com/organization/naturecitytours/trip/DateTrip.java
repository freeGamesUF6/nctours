/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import javax.persistence.Entity;
import javax.persistence.Table;import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;
import org.springframework.core.style.ToStringCreator;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Mark
 */


@Entity
@Table(name = "date")
public class DateTrip implements Serializable {

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
     

    @Column(name="departurefirst")
    private Date  departurefirst;
    
    @Column(name="departurelast")
    private Date   departurelast;
    
    @ManyToOne
    @JoinColumn(name="idtrip")
    private Trip idtrip;
    


    public Date  getDeparturefirst() {
        return departurefirst;
    }

    public void setDeparturefirst(Date   departurefirst) {
        this.departurefirst = departurefirst;
    }

    public Date  getDeparturelast() {
        return departurelast;
    }

    public void setDeparturelast(Date   departurelast) {
        this.departurelast = departurelast;
    }

    public Trip getIdtrip() {
        return idtrip;
    }

    public void setIdtrip(Trip idtrip) {
        this.idtrip = idtrip;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    
    
    
}
