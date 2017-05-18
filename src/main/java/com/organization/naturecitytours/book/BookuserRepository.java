/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import org.springframework.data.repository.Repository;

/**
 *
 * @author Mark
 */
public interface BookuserRepository extends Repository<Bookuser,Integer> {
    
    /**
     * Mètode per guardar a la taula relacional les seves id
     * @param b 
     */
    void save(Bookuser b);
    
}
