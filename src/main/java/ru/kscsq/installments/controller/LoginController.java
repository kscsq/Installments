package ru.kscsq.installments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginPage(ModelMap map){
        return "login";
    }

    @GetMapping
    public String indexPage(ModelMap map, Principal principal){
        System.out.println(principal.getName());
        return "redirect:/students";
    }

}
