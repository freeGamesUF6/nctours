/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.book.Bookuser.BookuserId;
import com.organization.naturecitytours.user.User;
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Mark
 * @author Xavier
 */
@Entity
@Table(name="bookuser")
@IdClass(BookuserId.class)
public class Bookuser implements Serializable {
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="iduser")
    @Id
    public User iduser;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="idbook")
    @Id
    private Book idbook;

    public Bookuser() {
    }

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

    
    /**
     * Mark aixó és el que te a veure amb el IdClass, he ficat LONG pq es el que he trobat a l'exemple d'internet, pero està clar que s'ha de posar altre cosa! això ja t'ho deixo a tu q me embolio!
     * adjunto web d'on he tret solucions!
     * http://stackoverflow.com/questions/38613755/java-lang-illegalargumentexception-expecting-idclass-mapping
     * 
     */
    public class BookuserId implements Serializable {
        private Long iduser;
        private Long idbook;
    }
    
    
}
