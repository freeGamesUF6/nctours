/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.util.Collection;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author Mark
 */
public interface TripRepository extends Repository<Trip,Integer> {
    /**
     * mètode per guardar un nou viatge a la base de dades
     * @param trip 
     */
    void save(Trip trip);
    /**
     * 
     * @param name
     * @return java.util.Collection de viatges
     */
    @Query("SELECT DISTINCT trip FROM Trip trip WHERE trip.name LIKE :name%")
    @Transactional(readOnly = true)
    Collection<Trip> findByName(@Param("name") String name);
}
