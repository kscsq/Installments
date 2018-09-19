package ru.kscsq.installments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kscsq.installments.model.Expence;
import ru.kscsq.installments.repository.ExpenceRepository;

import java.util.List;

@Service
public class ExpenceService {

    @Autowired
    private ExpenceRepository repository;

    public List<Expence> getAll(){
        return repository.getAll();
    }
}
