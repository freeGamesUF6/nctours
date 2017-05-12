/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.user.User;
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
@Table(name="bookpax")
public class Bookpax implements Serializable {
    @ManyToOne
    @JoinColumn(name="idbook")
    @Id
    private Book idbook;
    @ManyToOne
    @JoinColumn(name="dnipax")
    @Id
    private Pax dnipax;

    public Book getIduser() {
        return idbook;
    }

    public void setIduser(Book idbook) {
        this.idbook = idbook;
    }

    public Pax getDnipax() {
        return dnipax;
    }

    public void setDnipax(Pax dnipax) {
        this.dnipax = dnipax;
    }
    
    
}
