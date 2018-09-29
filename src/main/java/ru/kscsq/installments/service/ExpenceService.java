package ru.kscsq.installments.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kscsq.installments.model.Expence;
import ru.kscsq.installments.repository.ExpenceRepository;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ExpenceService {

    private final ExpenceRepository repository;

    @Autowired
    public ExpenceService(ExpenceRepository repository) {
        this.repository = repository;
    }

    public List<Expence> getAll(){
        return repository.getAll()
                .stream()
                .sorted(Comparator.comparing(Expence::getDate))
                .collect(Collectors.toList());
    }

    public void save(Expence expence) {
        repository.save(expence);
    }

    public void delete(Integer id) {
        repository.delete(id);
    }

    public Expence getOne(Integer id) {
        return repository.getOne(id);
    }
}
