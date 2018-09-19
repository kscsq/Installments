package ru.kscsq.installments.repository;

import ru.kscsq.installments.model.Expence;

import java.util.List;

public interface ExpenceRepository {

    List<Expence> getAll();
}
