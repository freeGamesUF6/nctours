/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;import java.util.ArrayList;
import java.util.Collections;
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
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;
import org.springframework.core.style.ToStringCreator;

/**
 *
 * @author Mark
 */


@Entity
@Table(name = "date")
@IdClass(Date.class)
public class Date implements Serializable {
    
    @Column(name="departurefirst")
    @Id
    private Date departurefirst;
    @Column(name="departurelast")
    @Id
    private Date departurelast;
    @ManyToOne
    @JoinColumn(name="idtrip",nullable=false)
    @Id
    private Trip idtrip;
    


    public Date getDeparturefirst() {
        return departurefirst;
    }

    public void setDeparturefirst(Date departurefirst) {
        this.departurefirst = departurefirst;
    }

    public Date getDeparturelast() {
        return departurelast;
    }

    public void setDeparturelast(Date departurelast) {
        this.departurelast = departurelast;
    }

    public Trip getIdtrip() {
        return idtrip;
    }

    public void setIdtrip(Trip idtrip) {
        this.idtrip = idtrip;
    }
    
    
    
}
