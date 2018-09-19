package ru.kscsq.installments.repository;

import ru.kscsq.installments.model.Expence;

import java.util.List;

public interface ExpenceRepository {

    List<Expence> getAll();

    void save(Expence expence);

    void delete(Integer id);

    Expence getOne(Integer id);
}
