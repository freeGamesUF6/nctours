/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.user.User;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Xavier
 * @author Marc
 */
@Entity
@Table(name="book")
public class Book implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "date")
    @NotEmpty
    private String date;
    @Column(name = "num_pax")
    @NotEmpty
    private int num_Pax;
    @Column(name = "pvp")
    @NotEmpty
    private double pvp;
    @Column(name = "idtrip")
    @NotEmpty
    private int idtrip;
    @OneToMany(fetch = FetchType.LAZY,mappedBy="idbook",cascade= CascadeType.ALL)  
    private Set<Bookpax> paxs;
    @OneToMany(fetch = FetchType.LAZY,mappedBy="idbook",cascade= CascadeType.ALL) 
    private Set<Bookuser> users;

    public Book() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getNum_Pax() {
        return num_Pax;
    }

    public void setNum_Pax(int num_Pax) {
        this.num_Pax = num_Pax;
    }

    public double getPvp() {
        return pvp;
    }

    public void setPvp(double pvp) {
        this.pvp = pvp;
    }

    public int getIdtrip() {
        return idtrip;
    }

    public void setIdtrip(int idtrip) {
        this.idtrip = idtrip;
    }

    public Set<Bookpax> getPaxs() {
        return paxs;
    }

    public void setPaxs(Set<Bookpax> paxs) {
        this.paxs = paxs;
    }

    public Set<Bookuser> getUsers() {
        return users;
    }

    public void setUsers(Set<Bookuser> users) {
        this.users = users;
    }
    
   
    
    
    



}
