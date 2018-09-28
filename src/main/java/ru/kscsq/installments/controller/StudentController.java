package ru.kscsq.installments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kscsq.installments.model.Student;
import ru.kscsq.installments.service.StudentService;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService service;

    @GetMapping
    public String getAll(Model model) {
        List<Student> list = service.getAll();
        Double total = list.stream().mapToDouble(d -> d.getAmount()).sum();
        model.addAttribute("students", service.getAll());
        model.addAttribute("total", total);

        return "table";
    }

    @GetMapping("/create")
//    @Secured("ADMIN")
    public String createStudent(Model model) {
        return "studentForm";
    }

    @GetMapping("/update/{id}")
//    @Secured("ADMIN")
    public String updateStudent(@PathVariable("id") Integer id, Model model) {
        Student student = service.getOne(id);

        model.addAttribute("student", student);

        return "studentForm";
    }

    @PostMapping
//    @Secured("ADMIN")
    public String addStudent(@RequestParam Integer id,
                             @RequestParam String lastname,
                             @RequestParam String firstname,
                             @RequestParam Double amount,
                             @RequestParam String date,
                             @RequestParam String transferMethod) {

        if (id == null) {
            Student student = new Student();
            student.setLastname(lastname);
            student.setFirstname(firstname);
            student.setAmount(amount);
            student.setDate(LocalDate.parse(date));
            student.setTransferMethod(transferMethod);
            service.save(student);
        } else {
            Student student = service.getOne(id);
            student.setLastname(lastname);
            student.setFirstname(firstname);
            student.setAmount(amount);
            student.setDate(LocalDate.parse(date));
            student.setTransferMethod(transferMethod);
            service.update(student);
        }
        return "redirect:/students";
    }

    @GetMapping("delete/{id}")
//    @Secured("ADMIN")
    public String deleteStudent(@PathVariable("id") Integer id) {
        service.delete(id);

        return "redirect:/students";
    }

}
