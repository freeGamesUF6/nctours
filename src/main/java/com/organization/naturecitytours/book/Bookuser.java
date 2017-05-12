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
@Table(name="bookuser")
public class Bookuser implements Serializable {
    @ManyToOne
    @JoinColumn(name="iduser")
    @Id
    private User iduser;
    @ManyToOne
    @JoinColumn(name="idbook")
    @Id
    private Book idbook;

    public User getIduser() {
        return iduser;
    }

    public void setIduser(User iduser) {
        this.iduser = iduser;
    }

    public Book getIdbook() {
        return idbook;
    }

    public void setIdbook(Book idbook) {
        this.idbook = idbook;
    }
    
    
}
