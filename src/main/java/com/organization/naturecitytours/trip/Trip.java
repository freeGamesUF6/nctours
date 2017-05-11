/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

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
@Table(name = "user")
public class Trip {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    @NotEmpty
    private String name;
    @Column(name = "duration")
    private String duration;
    @Column(name = "iditinerary")
    @NotEmpty
    private String iditinerary;
    @Column(name = "pricedouble")
    @NotEmpty
    private String pricedouble;
    @Column(name = "pricesingle")
    @NotEmpty
    private String pricesingle;
    @Column(name = "suplement")
    private String suplement;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getIditinerary() {
        return iditinerary;
    }

    public void setIditinerary(String iditinerary) {
        this.iditinerary = iditinerary;
    }

    public String getPricedouble() {
        return pricedouble;
    }

    public void setPricedouble(String pricedouble) {
        this.pricedouble = pricedouble;
    }

    public String getPricesingle() {
        return pricesingle;
    }

    public void setPricesingle(String pricesingle) {
        this.pricesingle = pricesingle;
    }

    public String getSuplement() {
        return suplement;
    }

    public void setSuplement(String suplement) {
        this.suplement = suplement;
    }
    
    
}
