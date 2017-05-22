/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.book;

import com.organization.naturecitytours.trip.Trip;
import com.organization.naturecitytours.trip.TripRepository;
import com.organization.naturecitytours.user.User;
import com.organization.naturecitytours.user.UserController;
import com.organization.naturecitytours.user.UserRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Mark
 * 
 * @version 0.1
 */
@Controller
public class BookController {
    private BookRepository book;
    private PaxRepository pax;
    private UserRepository user;
    private TripRepository trip;
    
    /**
     * constructor con inyección de dependencias
     * @param book 
     */
    @Autowired
    public BookController(BookRepository book, PaxRepository pax,UserRepository user,TripRepository trip){
        this.book=book;
        this.pax=pax;
        this.user=user;
        this.trip=trip;
        
    }
    
    /**
     * Método para empezar a crear una nueva reserva
     * @return la vista con el formulario de reserva
     */
    @RequestMapping(value = "/book/new", method = RequestMethod.GET)
    public ModelAndView newBook(Trip trip){
        ModelAndView mv=new ModelAndView("book/bookForm");
        mv.addObject(trip);    
        return mv;
    }
    
    
//    //XAVI
//    @RequestMapping(value = "/book/saveBook", method = RequestMethod.POST)
//    public String saveBookXavi(){
//        return "index";
//    }
    
    
    
    /**
     * Método para guardar una nueva reserva
     * @param book
     * @return la vista adecuada
     */
    
    @RequestMapping(value = "/book/saveBook", method = RequestMethod.GET)
    public String saveBook(HttpSession session,@RequestParam("paxs") String paxs,@RequestParam("idtrip")String idtrip,@RequestParam("date")String date){
       /* HttpSession session,@RequestParam("paxs") String paxs,@RequestParam("idtrip")String idtrip */
        
        /*Test code */
//        Long id=new Long(1);
//        Trip trip=this.trip.findById(6);
//        Set<Pax> paxs=new HashSet();
//        Pax p1=new Pax("46454545A","Mungo","Jerry","15-10-1983","98232346854SD","15-10-2018");
//        paxs.add(p1);   
//        Set<User> users=new HashSet();
//        User user=this.user.findByEmail("genialviatges@gmail.com");
//        users.add(user);
//        Book book=new Book("19-05-2017",6,2000.5,trip,paxs,users);
//        this.book.save(book);
        /* End Test code*/
        
        Book b=new Book();
        //Fem un split de la cadena paxs per obtenir un array de paxs
        String[] paxList=paxs.split(";");
        //Obtenir numero de paxs
        int numPax=paxList.length;
        //Obtenir informació de l'usuari utilitzant les dades de sessió i afegri-ho a l'objecte
        User user=this.user.findByEmail(session.getAttribute("user").toString());
        Set<User> users=new HashSet<User>();
        users.add(user);
        b.setUsers(users);
        b.setNum_Pax(numPax);
        //trobar el trip per id
        Trip trip=this.trip.findById(Integer.parseInt(idtrip));
        b.setIdtrip(trip);
        //Data del viatge
        SimpleDateFormat sd=new SimpleDateFormat("dd-mm-YYYY");
        Date dat=new Date();
        try {
            dat=sd.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(BookController.class.getName()).log(Level.SEVERE, null, ex);
        }
        b.setDate(dat);
        //calcular preu per nombre passatgers
        double pvp=0;
        for (int i = numPax; i > 0; i--) {
            pvp+=trip.getPricesingle();
        }
        b.setPvp(pvp);
        
        //Omplir col·lecció de paxs comprovant si el pax ja existeix a base de dades
        for (String pax1 : paxList) {

            String[] ps=pax1.split(",");
            Pax aux=this.pax.findById(ps[0]);
            if(aux!=null){
                b.getPaxs().add(aux);
            }else{
                Pax p=new Pax();
                p.setDni(ps[0]);
                p.setName(ps[1]);
                p.setSurname(ps[2]);
                p.setDob(ps[3]);
                p.setPassport(ps[4]);
                p.setPassportexpiry(ps[5]); 
                b.getPaxs().add(p);
            }
        }
        
        this.book.save(b);
        
        
        
        return "trip/tripList";
    }
    
    /**
     * Método que muestra todas las reservas de todos los usuarios siempre
     * que el usuario sea admin
     * @param book
     * @param result
     * @param model
     * @param session
     * @return la vista de todas las reservas si el usuario es admin@admin
     */
    @RequestMapping("/book/list")
    public String list(Book book,BindingResult result, Map<String, Object> model, HttpSession session){
        Collection<Book> books= this.book.findAll();
        if (books.isEmpty()) {
            // no trips found
            result.rejectValue("id", "notFound", "not found");
            return "admin/listBooks";
        }else {
            if (session.getAttribute("user")!=null && session.getAttribute("user").equals("admin@admin")) {
                model.put("selections", books);
                return "admin/listBooks";
            }else{
                return "trip/trip";
            }
            
        }
    }
    
    @RequestMapping("/book/delete/{id}")
    public String deleteBook(@PathVariable("id") String bookId){
        Long idbook=Long.parseLong(bookId);
        Book b=new Book();        
        //b=this.book.findById(idbook);
        this.book.delete(idbook);
        return "redirect:/book/list";
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
