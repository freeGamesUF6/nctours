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
 */
@Entity
@Table(name="book")
public class Book implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "date")
    @NotEmpty
    private Date date;
    @Column(name = "num_pax")
    @NotEmpty
    private int num_Pax;
    @Column(name = "pvp")
    @NotEmpty
    private double pvp;
    @Column(name = "idtrip")
    @NotEmpty
    private Trip idtrip;
    @OneToMany(fetch = FetchType.LAZY,mappedBy="idbook",cascade= CascadeType.ALL)
   // @JoinTable(name="transaction")
    private Set<Bookpax> paxs;
    @OneToMany(fetch = FetchType.LAZY,mappedBy="idbook",cascade= CascadeType.ALL)
   // @JoinTable(name="transaction")
    private Set<Bookuser> users;
    
   
    
    
    



}
