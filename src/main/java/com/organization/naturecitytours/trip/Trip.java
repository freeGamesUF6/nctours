/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import com.organization.naturecitytours.book.Pax;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.Constraint;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.internal.constraintvalidators.bv.NotNullValidator;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PropertyComparator;
import org.springframework.core.style.ToStringCreator;

/**
 *
 * @author Mark
 */
@Entity
@Table(name = "trip")
public class Trip implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;
    @Column(name = "name")
    @NotEmpty
    private String name;
    @Column(name = "duration")
    private String duration;
    @Column(name = "pricedouble")
    @DecimalMax("100000.00")
    @NotNull
    private double pricedouble;
    @Column(name = "pricesingle")
    @DecimalMax("100000.00")
    @NotNull
    private double pricesingle;
    @Column(name = "suplement",nullable=true)
    private Double suplement;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "idtrip", cascade = CascadeType.ALL)
    private Set<Triphotels> hotels;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "idtrip",cascade = CascadeType.ALL)
    private Set<Date> dates;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "trip",cascade = CascadeType.ALL)
    private Set<Itinerary> itineraries;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public double getPricedouble() {
        return pricedouble;
    }

    public void setPricedouble(double pricedouble) {
        this.pricedouble = pricedouble;
    }

    public double getPricesingle() {
        return pricesingle;
    }

    public void setPricesingle(double pricesingle) {
        this.pricesingle = pricesingle;
    }

    public double getSuplement() {
        return suplement;
    }

    public void setSuplement(double suplement) {
        this.suplement = suplement;
    }

}
