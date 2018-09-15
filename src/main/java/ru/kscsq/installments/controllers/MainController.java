package ru.kscsq.installments.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.kscsq.installments.models.Student;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    private List<Student> students = new ArrayList<>();

    {
        students.add(new Student("Dmitrieva", "Varvara", 10000.00,
                LocalDate.of(2018, 9, 7), "card"));
        students.add(new Student("Burov", "Savva", 10000.00,
                LocalDate.of(2018, 9, 5), "card"));
        students.add(new Student("Golyashkina", "Daria", 10000.00,
                LocalDate.of(2018, 9, 5), "cash"));
    }

    @GetMapping("/")
    public String installmentsTable(Model model) {
        model.addAttribute("students", students);
        return "table";
    }
}
