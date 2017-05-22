package com.organization.naturecitytours.user;


import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
class WelcomeController {

     @RequestMapping("/")
    public String welcome() {
        return "index";
    }
    
    @RequestMapping("/book/form/{id}")
    public String welcome4(Map<String, Object> model,@PathVariable("id") String idTrip) {
        
        model.put("idTrip",idTrip);
        System.out.println("id trip "+ idTrip);
                
        return "book/bookForm";
    }
}
