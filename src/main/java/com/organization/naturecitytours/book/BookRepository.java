/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.book.Book;
import com.organization.naturecitytours.user.User;
import java.util.Collection;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Mark
 */
public interface BookRepository extends Repository<Book,Integer> {
    /**
     * Mètode per guardar una nova reserva a base de dades
     * @param b 
     */
    void save(Book b);
    
    /**
     * 
     * @param id
     * @return java.util.Collection de reserves
     */
    @Query("SELECT DISTINCT user FROM User user WHERE user.email LIKE :email%")
    @Transactional(readOnly = true)
    Collection<User> findByEmail(@Param("email") String email);
}
