/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.user.User;
import java.util.Collection;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Mark
 */
@Controller
public class BookController {
    private BookRepository book;
    
    @Autowired
    public BookController(BookRepository book){
        this.book=book;
    }
    
//    @RequestMapping("/book/list")
//    public String bookList(User user, BindingResult result, Map<String, Object> model) {
//        // find books by user
//        Bookuser bu=new Bookuser();
//        user.setId(3);
//        user.setEmail("admin@admin");
//        user.setPassword("admin");
//        bu.setIduser(user);
//        Collection<User> results = this.book.findByEmail(user.getEmail());
//        if (results.isEmpty()) {
//            // no trips found
//            result.rejectValue("id", "notFound", "not found");
//            return "hello";
//        }else {
//            // multiple trips found
//            model.put("selections", results);
//            return "hello";
//        } 
//    }
    
}
