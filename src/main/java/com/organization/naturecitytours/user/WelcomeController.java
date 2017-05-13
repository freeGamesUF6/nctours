package com.organization.naturecitytours.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
class WelcomeController {

     @RequestMapping("/hola")
    public String welcome() {
        return "world";
    }
    

    
    
    @RequestMapping("/user/profile")
    public String welcome1() {
        return "user/userProfile";
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
