package ru.kscsq.installments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kscsq.installments.model.Student;
import ru.kscsq.installments.service.StudentService;

import java.time.LocalDate;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService service;

    @GetMapping
    public String getAll(Model model) {
        model.addAttribute("students", service.getAll());

        return "table";
    }

    @GetMapping("/create")
    public String createStudent(Model model) {

        model.addAttribute("student", new Student());
        return "studentForm";
    }

    @PostMapping
    public String addStudent(@RequestParam String lastname,
                             @RequestParam String firstname,
                             @RequestParam Double amount,
                             @RequestParam String date,
                             @RequestParam String transferMethod) {

        Student student = new Student();
        student.setLastname(lastname);
        student.setFirstname(firstname);
        student.setAmount(amount);
        student.setDate(LocalDate.parse(date));
        student.setTransferMethod(transferMethod);

        service.save(student);
        return "redirect:/students";
    }

    @GetMapping("delete/{id}")
    public String deleteStudent(@PathVariable("id") Integer id){
        service.delete(id);

        return "redirect:/students";
    }

}
