package ru.kscsq.installments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kscsq.installments.model.Student;
import ru.kscsq.installments.repository.StudentRepository;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class StudentService {

    @Autowired
    private StudentRepository repository;

    public List<Student> getAll(){
        List<Student> list = new ArrayList<>();
        repository.findAll().iterator().forEachRemaining(list::add);
        return list.stream().sorted(Comparator.comparing(Student::getLastname)).collect(Collectors.toList());

    }

    public Student getOne(Integer id) {
        return repository.findById(id).orElse(null);
    }

    public void save(Student student) {
        repository.save(student);
    }

    public void delete(Integer id) {
        repository.deleteById(id);
    }
}
