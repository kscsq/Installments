package ru.kscsq.installments.repository;

import org.springframework.data.repository.CrudRepository;
import ru.kscsq.installments.model.Student;

public interface StudentRepository extends CrudRepository<Student, Integer> {
}
