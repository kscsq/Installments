package ru.kscsq.installments.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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

    private final StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping
    public String getAll(Model model) {
        List<Student> list = studentService.getAll();
        Double total = list.stream().mapToDouble(Student::getAmount).sum();
        model.addAttribute("students", studentService.getAll());
        model.addAttribute("total", total);

        return "table";
    }

    @GetMapping("/create")
    @Secured("ROLE_ADMIN")
    public String createStudent(Model model) {
        return "studentForm";
    }

    @GetMapping("/update/{id}")
    @Secured("ROLE_ADMIN")
    public String updateStudent(@PathVariable("id") Integer id, Model model) {
        Student student = studentService.getOne(id);

        model.addAttribute("student", student);

        return "studentForm";
    }

    @PostMapping
    @Secured("ROLE_ADMIN")
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
            studentService.save(student);
        } else {
            Student student = studentService.getOne(id);
            student.setLastname(lastname);
            student.setFirstname(firstname);
            student.setAmount(amount);
            student.setDate(LocalDate.parse(date));
            student.setTransferMethod(transferMethod);
            studentService.update(student);
        }
        return "redirect:/students";
    }

    @GetMapping("delete/{id}")
    @Secured("ROLE_ADMIN")
    public String deleteStudent(@PathVariable("id") Integer id) {
        studentService.delete(id);

        return "redirect:/students";
    }

}
