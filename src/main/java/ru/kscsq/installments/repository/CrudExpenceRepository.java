package ru.kscsq.installments.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kscsq.installments.model.Expence;

public interface CrudExpenceRepository extends JpaRepository<Expence, Integer> {

}
