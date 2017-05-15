/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.user.User;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;

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
    
    @RequestMapping(value = "/book/new", method = RequestMethod.POST)
    public String newBook(){
        return "book/bookForm";
    }
    
    @RequestMapping(value="/book/savebook")
    public String saveBook(Book book){
        this.book.save(book);
        
        return "";
    }
    
    @RequestMapping("/book/list")
    public String list(){
        Collection<Book> books= book.findAll();
        return "";
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
