package ru.kscsq.installments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kscsq.installments.model.Student;
import ru.kscsq.installments.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository repository;

    public Iterable<Student> getAll(){
        return repository.findAll();
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
