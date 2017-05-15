package com.organization.naturecitytours.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
class WelcomeController {

     @RequestMapping("/")
    public String welcome() {
        return "index";
    }
    
    @RequestMapping("/book/form")
    public String welcome4() {
        return "book/bookForm";
    }
}
