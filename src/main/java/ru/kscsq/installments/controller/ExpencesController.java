package ru.kscsq.installments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kscsq.installments.service.ExpenceService;

@Controller
@RequestMapping("/expences")
public class ExpencesController {

    @Autowired
    private ExpenceService service;

    @GetMapping
    public String getAll(Model model){
        model.addAttribute("expences", service.getAll());

        return "expences";
    }
}
