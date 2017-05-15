package com.organization.naturecitytours.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
class WelcomeController {

     @RequestMapping("/")
    public String welcome() {
        return "index";
    }
    

    
    @RequestMapping("/trip/list")
    public String welcome2() {
        return "trip/tripList";
    }
    
    @RequestMapping("/trip")
    public String welcome3() {
        return "trip/trip";
    }
    
     @RequestMapping("/book/form")
    public String welcome4() {
        return "book/bookForm";
    }
}
