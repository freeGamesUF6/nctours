/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Xavier
 */
@Entity
@Table(name="book")
public class Book {
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
    private int idtrip;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
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
    
    
    



}
