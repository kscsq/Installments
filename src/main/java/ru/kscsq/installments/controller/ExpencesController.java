package ru.kscsq.installments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kscsq.installments.model.Expence;
import ru.kscsq.installments.model.Student;
import ru.kscsq.installments.service.ExpenceService;
import ru.kscsq.installments.service.StudentService;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/expences")
public class ExpencesController {

    private final ExpenceService expenceService;

    @Autowired
    private StudentService studentService;

    @Autowired
    public ExpencesController(ExpenceService expenceService) {
        this.expenceService = expenceService;
    }


    @GetMapping
    public String getAll(Model model) {
        List<Expence> list = expenceService.getAll();
        Double total = list.stream().mapToDouble(Expence::getAmount).sum();

        List<Student> studentsList = studentService.getAll();
        Double studentsTotal = studentsList.stream().mapToDouble(Student::getAmount).sum();

        model.addAttribute("expences", expenceService.getAll());
        model.addAttribute("total", total);
        model.addAttribute("studentsTotal", studentsTotal);

        return "expences";
    }

    @GetMapping("/create")
    @Secured("ROLE_ADMIN")
    public String createExpence(Model model) {

        return "expenceForm";
    }

    @GetMapping("/update/{id}")
    @Secured("ROLE_ADMIN")
    public String updateExpence(@PathVariable("id") Integer id, Model model) {
        Expence expence = expenceService.getOne(id);

        model.addAttribute("expence", expence);

        return "expenceForm";
    }

    @PostMapping
    @Secured("ROLE_ADMIN")
    public String addExpence(@RequestParam Integer id,
                             @RequestParam String name,
                             @RequestParam Double amount,
                             @RequestParam String date,
                             @RequestParam String type,
                             @RequestParam String responsiblePerson) {

        if (id == null) {
            Expence expence = new Expence();
            expence.setName(name);
            expence.setAmount(amount);
            expence.setDate(LocalDate.parse(date));
            expence.setType(type);
            expence.setResponsiblePerson(responsiblePerson);
            expenceService.save(expence);
        } else {
            Expence expence = expenceService.getOne(id);
            expence.setName(name);
            expence.setAmount(amount);
            expence.setDate(LocalDate.parse(date));
            expence.setType(type);
            expence.setResponsiblePerson(responsiblePerson);
            expenceService.save(expence);
        }
        return "redirect:/expences";
    }

    @GetMapping("/delete/{id}")
    @Secured("ROLE_ADMIN")
    public String deleteExpence(@PathVariable("id") Integer id) {
        expenceService.delete(id);

        return "redirect:/expences";
    }
}
